//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using BPMS.Service;
using BPMS.IBusiness;
using System.Collections;
using System.Text;
using System.Collections.Generic;

namespace BPMS.Business
{
    /// <summary>
    /// 动态接口配置
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.03</date>
    /// </author>
    /// </summary>
    public class BASE_InterfaceManageBLL : BASE_InterfaceManageIBLL
    {
        private readonly BASE_InterfaceManageDAL dal = new BASE_InterfaceManageDAL();

        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public bool Delete(string KeyValue)
        {
            return dal.Delete(KeyValue) >= 0 ? true : false;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BASE_InterfaceManage GetEntity(string KeyValue)
        {
            return dal.GetEntity(KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="Code">接口编号</param>
        /// <returns></returns>
        public BASE_InterfaceManage GetEntityByCode(string Code)
        {
            return dal.GetEntityByCode(Code);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        public IList GetList()
        {
            return dal.GetList();
        }
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="Parm_Key_Value">搜索条件键值</param>
        /// <returns></returns>
        public IList GetListWhere(Hashtable Parm_Key_Value)
        {
            StringBuilder SqlWhere = new StringBuilder();
            List<SqlParam> ListParam = new List<SqlParam>();
            //编号
            if (Parm_Key_Value["Code"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Code"].ToString()))
            {
                SqlWhere.Append(" AND Code like @Code");
                ListParam.Add(new SqlParam("@Code", '%' + Parm_Key_Value["Code"].ToString() + '%'));
            }
            //名称
            if (Parm_Key_Value["FullName"] != null && !string.IsNullOrEmpty(Parm_Key_Value["FullName"].ToString()))
            {
                SqlWhere.Append(" AND FullName like @FullName");
                ListParam.Add(new SqlParam("@FullName", '%' + Parm_Key_Value["FullName"].ToString() + '%'));
            }
            return dal.GetListWhere(SqlWhere, ListParam.ToArray());
        }
        /// <summary>
        /// 接口参数列表
        /// </summary>
        /// <param name="InterfaceId">接口主键</param>
        /// <returns></returns>
        public IList GetListDetails(string InterfaceId)
        {
            return dal.GetListDetails(InterfaceId);
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
            return dal.AddInterfaceManage(InterfaceFrom, InterfaceDetailsFrom, key);
        }
    }
}