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
    /// 系统接口访问
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.02</date>
    /// </author>
    /// </summary>
    public class BPMS_InterfaceAccessBLL : BPMS_InterfaceAccessIBLL
    {
        private readonly BPMS_InterfaceAccessDAL dal = new BPMS_InterfaceAccessDAL();

        #region Method
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Insert(BPMS_InterfaceAccess entity)
        {
            return dal.Insert(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Update(BPMS_InterfaceAccess entity)
        {
            return dal.Update(entity) >= 0 ? true : false;
        }
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
        /// 批量删除数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public bool BatchDelete(string[] KeyValue)
        {
            return dal.BatchDelete(KeyValue) >= 0 ? true : false;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_InterfaceAccess GetEntity(string KeyValue)
        {
            return dal.GetEntity(KeyValue);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        public IList GetList()
        {
            return dal.GetListWhere(null, null);
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
            //显示有效、无效
            if (Parm_Key_Value["Enabled"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Enabled"].ToString()))
            {
                SqlWhere.Append(" AND Enabled = @Enabled");
                ListParam.Add(new SqlParam("@Enabled", Parm_Key_Value["Enabled"].ToString()));
            }
            //编号
            if (Parm_Key_Value["Code"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Code"].ToString()))
            {
                SqlWhere.Append(" AND Code like @Code");
                ListParam.Add(new SqlParam("@Code", '%' + Parm_Key_Value["Code"].ToString() + '%'));
            }
            //名称
            if (Parm_Key_Value["AuthorizationUserName"] != null && !string.IsNullOrEmpty(Parm_Key_Value["AuthorizationUserName"].ToString()))
            {
                SqlWhere.Append(" AND AuthorizationUserName like @AuthorizationUserName");
                ListParam.Add(new SqlParam("@AuthorizationUserName", '%' + Parm_Key_Value["AuthorizationUserName"].ToString() + '%'));
            }
            return dal.GetListWhere(SqlWhere, ListParam.ToArray());
        }
        #endregion

        /// <summary>
        /// 验证是否有效用户可以访问接口
        /// </summary>
        /// <param name="AuthorizationUserId">用户主键</param>
        /// <returns></returns>
        public bool IsEnabled(string AuthorizationUserId)
        {
            if (CommonHelper.GetBool(ConfigHelper.GetValue("CheckInterface")))
            {
                return true;
            }
            return dal.IsEnabled(AuthorizationUserId) > 0 ? true : false;
        }
    }
}