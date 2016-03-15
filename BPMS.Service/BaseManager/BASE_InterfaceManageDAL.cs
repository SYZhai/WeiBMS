//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using System.Collections;
using System.Text;
using BPMS.Service;
using System;

namespace BPMS.Service
{
    /// <summary>
    /// 动态接口配置
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.03</date>
    /// </author>
    /// </summary>
    public class BASE_InterfaceManageDAL
    {
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public int Delete(string KeyValue)
        {
            return DataFactory.DbUtils().Delete("BASE_InterfaceManage", "InterfaceId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BASE_InterfaceManage GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BASE_InterfaceManage>("InterfaceId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="Code">接口编号</param>
        /// <returns></returns>
        public BASE_InterfaceManage GetEntityByCode(string Code)
        {
            return DataFactory.DbUtils().GetModelById<BASE_InterfaceManage>("Code", Code);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        public IList GetList()
        {
            return this.GetListWhere(null, null);
        }
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public IList GetListWhere(StringBuilder where, SqlParam[] param)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BASE_InterfaceManage WHERE 1=1");
            strSql.Append(where);
            strSql.Append(" ORDER BY CreateDate DESC");
            return DataFactory.SqlHelper().GetDataListBySQL<BASE_InterfaceManage>(strSql, param);
        }

        /// <summary>
        /// 接口参数列表
        /// </summary>
        /// <param name="InterfaceId">接口主键</param>
        /// <returns></returns>
        public IList GetListDetails(string InterfaceId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BASE_InterfaceManageDetails WHERE 1=1");
            strSql.Append(" AND InterfaceId = @InterfaceId");
            strSql.Append(" ORDER BY SortCode");
            SqlParam[] param = {
                                        new SqlParam("@InterfaceId",InterfaceId)};
            return DataFactory.SqlHelper().GetDataListBySQL<BASE_InterfaceManageDetails>(strSql, param);
        }

        /// <summary>
        /// 批量新增 接口，接口参数
        /// </summary>
        /// <param name="InterfaceFrom">接口配置</param>
        /// <param name="InterfaceDetailsFrom">接口参数明细</param>
        /// <param name="key">主键</param>
        /// <returns></returns>
        public int AddInterfaceManage(object[] InterfaceFrom, object[] InterfaceDetailsFrom, string key)
        {
            try
            {
                StringBuilder[] sqls = new StringBuilder[InterfaceDetailsFrom.Length + 2];
                object[] objs = new object[InterfaceDetailsFrom.Length + 2];
                Hashtable ht_Interface = new Hashtable();
                foreach (string item in InterfaceFrom)
                {
                    if (item.Length > 0)
                    {
                        string[] str_item = item.Split('☻');
                        ht_Interface[str_item[0]] = str_item[1];
                    }
                }
                if (!string.IsNullOrEmpty(key))
                {
                    ht_Interface["InterfaceId"] = key;
                    ht_Interface["ModifyDate"] = DateTime.Now;
                    ht_Interface["ModifyUserId"] = RequestSession.GetSessionUser().UserId;
                    ht_Interface["ModifyUserName"] = RequestSession.GetSessionUser().UserName;
                }
                else
                {
                    ht_Interface["InterfaceId"] = CommonHelper.GetGuid;
                    ht_Interface["CreateUserId"] = RequestSession.GetSessionUser().UserId;
                    ht_Interface["CreateUserName"] = RequestSession.GetSessionUser().UserName;
                }
                sqls[0] = !string.IsNullOrEmpty(key) ? DbCommon.UpdateSql("BASE_InterfaceManage", "InterfaceId", ht_Interface) : DbCommon.InsertSql("BASE_InterfaceManage", ht_Interface);
                objs[0] = DbCommon.GetParameter(ht_Interface);
                sqls[1] = DbCommon.DeleteSql("BASE_InterfaceManageDetails", "InterfaceId");
                objs[1] = new SqlParam[] { new SqlParam("@InterfaceId", key) };
                int index = 2;
                foreach (string item in InterfaceDetailsFrom)
                {
                    if (item.Length > 0)
                    {
                        Hashtable ht_InterfaceDetails = new Hashtable();
                        foreach (string itemwithin in item.Split('☺'))
                        {
                            if (itemwithin.Length > 0)
                            {
                                string[] str_item = itemwithin.Split('☻');
                                ht_InterfaceDetails[str_item[0]] = str_item[1];
                                if (str_item[0].ToString() == "FieldMinLength")
                                {
                                    ht_InterfaceDetails[str_item[0]] = str_item[1] == "true" ? 0 : 1;
                                }
                                if (str_item[0].ToString() == "Enabled")
                                {
                                    ht_InterfaceDetails[str_item[0]] = str_item[1] == "true" ? 0 : 1;
                                }
                            }
                        }
                        ht_InterfaceDetails["InterfaceDetailsId"] = CommonHelper.GetGuid;
                        ht_InterfaceDetails["InterfaceId"] = ht_Interface["InterfaceId"];
                        sqls[index] = DbCommon.InsertSql("BASE_InterfaceManageDetails", ht_InterfaceDetails); ;
                        objs[index] = DbCommon.GetParameter(ht_InterfaceDetails);
                        index++;
                    }
                }
                return DataFactory.SqlHelper().BatchExecuteBySql(sqls, objs);
            }
            catch
            {
                return -1;
            }
        }
    }
}