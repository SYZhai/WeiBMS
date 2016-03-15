//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using System.Collections;
using System.Text;
using BPMS.Service;
using System.Data;

namespace BPMS.Service
{
    /// <summary>
    /// 数据权限存储表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.03</date>
    /// </author>
    /// </summary>
    public class BPMS_DataPermissionDAL
    {
        #region Method
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BPMS_DataPermission entity)
        {
            int IsOk = DataFactory.DbUtils().Insert(entity);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.AddTaskLog<BPMS_DataPermission>(entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Update(BPMS_DataPermission entity)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(BPMS_SysLogDAL.Instance.GetKeyFieldValue<BPMS_DataPermission>(entity).ToString());
            #endregion
            int IsOk = DataFactory.DbUtils().Update(entity, "DataPermissionId");
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.UpdateTaskLog<BPMS_DataPermission>(oldEntity, entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_DataPermission GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BPMS_DataPermission>("DataPermissionId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_DataPermission GetEntity(StringBuilder where, SqlParam[] param)
        {
            BPMS_DataPermission entity = new BPMS_DataPermission();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT  * FROM BPMS_DataPermission WHERE 1=1");
            strSql.Append(where);
            DataTable dt = DataFactory.SqlHelper().GetDataTableBySQL(strSql, param);
            if (dt.Rows.Count > 0)
            {
                return DbReader.ReaderToModel<BPMS_DataPermission>(dt.Rows[0]);
            }
            else
            {
                return entity;
            }
        }
        #endregion

        #region 授权项目
        /// <summary>
        /// 组织机构列表
        /// </summary>
        /// <returns></returns>
        public IList GetOrganizationList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BPMS_Organization WHERE 1=1");
            strSql.Append(" Order BY SortCode");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_Organization>(strSql);
        }
        /// <summary>
        /// 用户列表
        /// </summary>
        /// <returns></returns>
        public IList GetUserList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BPMS_User WHERE 1=1");
            strSql.Append(" Order BY SortCode");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_User>(strSql);
        }
        /// <summary>
        /// 员工列表
        /// </summary>
        /// <returns></returns>
        public IList GetEmployeeList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BPMS_Employee WHERE 1=1");
            strSql.Append(" Order BY SortCode");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_Employee>(strSql);
        }
        #endregion

        /// <summary>
        /// 新建的项目数据，默认把数据权限设置了，，这样就别必要要去数据权限管理里面去打钩
        /// </summary>
        /// <param name="RoleId">角色</param>
        /// <param name="ResourceId">对象</param>
        /// <param name="key">数据ID</param>
        /// <param name="UserId">当前用户</param>
        /// <param name="key"></param>
        public void AddItemDefault(string RoleId, string ResourceId, string key, string UserId)
        {
            Hashtable ht_Where = new Hashtable();
            ht_Where["RoleId"] = RoleId;
            ht_Where["ResourceId"] = ResourceId;
            BPMS_DataPermission entity = DataFactory.DbUtils().GetModelById<BPMS_DataPermission>(ht_Where);
            entity.ObjectId = entity.ObjectId + ",'" + key + "'";
            int IsOk = DataFactory.DbUtils().Update(entity, "DataPermissionId");
            CacheHelper.RemoveAllCache("Data" + UserId);
        }
    }
}