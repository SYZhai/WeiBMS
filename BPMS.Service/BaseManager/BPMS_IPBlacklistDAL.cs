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
using System.Data;

namespace BPMS.Service
{
    /// <summary>
    /// IP黑名单
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.31</date>
    /// </author>
    /// </summary>
    public class BPMS_IPBlacklistDAL
    {
        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <returns></returns>
        public object GetMaxCode()
        {
            return DataFactory.DbUtils().GetMax("BPMS_IPBlacklist", "SortCode");
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BPMS_IPBlacklist entity)
        {
            entity.SortCode = CommonHelper.GetInt(this.GetMaxCode());
            int IsOk = DataFactory.DbUtils().Insert(entity);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.AddTaskLog<BPMS_IPBlacklist>(entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Update(BPMS_IPBlacklist entity)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(BPMS_SysLogDAL.Instance.GetKeyFieldValue<BPMS_IPBlacklist>(entity).ToString());
            #endregion
            int IsOk = DataFactory.DbUtils().Update(entity, "IPBlacklistId");
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.UpdateTaskLog<BPMS_IPBlacklist>(oldEntity, entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
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
            int IsOk = DataFactory.DbUtils().Delete("BPMS_IPBlacklist", "IPBlacklistId", KeyValue);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.DeleteTaskLog<BPMS_IPBlacklist>(oldEntity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
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
            return DataFactory.DbUtils().BatchDelete("BPMS_IPBlacklist", "IPBlacklistId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_IPBlacklist GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BPMS_IPBlacklist>("IPBlacklistId", KeyValue);
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
            strSql.Append("SELECT * FROM BPMS_IPBlacklist WHERE 1=1");
            strSql.Append(where);
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_IPBlacklist>(strSql, param);
        }
        #endregion

        /// <summary>
        /// 获得不允许登录IP范围列表
        /// </summary>
        /// <param name="where">条件</param>
        /// <returns></returns>
        public IList GetIPBlacklist()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BPMS_IPBlacklist WHERE 1=1");
            strSql.Append(" AND Enabled =1 ");
            strSql.Append(" AND Failuretime >= @Failuretime ");
            SqlParam[] param = {
                                         new SqlParam("@Failuretime",DbType.DateTime, DateTime.Now)};
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_IPBlacklist>(strSql, param);
        }
    }
}