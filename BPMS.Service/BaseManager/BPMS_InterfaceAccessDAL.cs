//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using System.Collections;
using System.Text;
using BPMS.Service;

namespace BPMS.Service
{
    /// <summary>
    /// 系统接口访问
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.02</date>
    /// </author>
    /// </summary>
    public class BPMS_InterfaceAccessDAL
    {
        #region Method
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BPMS_InterfaceAccess entity)
        {
            int IsOk = DataFactory.DbUtils().Insert(entity);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.AddTaskLog<BPMS_InterfaceAccess>(entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Update(BPMS_InterfaceAccess entity)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(BPMS_SysLogDAL.Instance.GetKeyFieldValue<BPMS_InterfaceAccess>(entity).ToString());
            #endregion
            int IsOk = DataFactory.DbUtils().Update(entity, "IAccessId");
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.UpdateTaskLog<BPMS_InterfaceAccess>(oldEntity, entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public int Delete(string KeyValue)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(KeyValue);
            #endregion
            int IsOk = DataFactory.DbUtils().Delete("BPMS_InterfaceAccess", "IAccessId", KeyValue);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.DeleteTaskLog<BPMS_InterfaceAccess>(oldEntity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public int BatchDelete(string[] KeyValue)
        {
            return DataFactory.DbUtils().BatchDelete("BPMS_InterfaceAccess", "IAccessId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_InterfaceAccess GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BPMS_InterfaceAccess>("IAccessId", KeyValue);
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
            strSql.Append("SELECT * FROM BPMS_InterfaceAccess WHERE 1=1");
            strSql.Append(where);
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_InterfaceAccess>(strSql, param);
        }
        #endregion

        /// <summary>
        /// 验证是否有效用户可以访问接口
        /// </summary>
        /// <param name="AuthorizationUserId"></param>
        /// <returns></returns>
        public int IsEnabled(string AuthorizationUserId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  COUNT(1)
                            FROM    BPMS_InterfaceAccess
                            WHERE   AuthorizationUserId = @AuthorizationUserId
                                    AND GETDATE() BETWEEN StartDate AND EndDate AND Enabled=1");
            SqlParam[] param = {
                                         new SqlParam("@AuthorizationUserId",AuthorizationUserId)};
            return CommonHelper.GetInt(DataFactory.SqlHelper().GetObjectValue(strSql, param));
        }
    }
}