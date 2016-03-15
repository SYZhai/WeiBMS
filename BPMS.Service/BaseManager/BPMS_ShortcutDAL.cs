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
    /// 首页快捷功能
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.28</date>
    /// </author>
    /// </summary>
    public class BPMS_ShortcutDAL
    {
        #region Method
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BPMS_Shortcut entity)
        {
            int IsOk = DataFactory.DbUtils().Insert(entity);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.AddTaskLog<BPMS_Shortcut>(entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public int Delete(string KeyValue, string UserId)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(KeyValue);
            #endregion
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"DELETE FROM BPMS_Shortcut WHERE 1=1");
            strSql.Append(" AND MenuId = @MenuId");
            strSql.Append(" AND UserId = @UserId");
            SqlParam[] param = {
                                         new SqlParam("@MenuId",KeyValue),
                                         new SqlParam("@UserId",UserId)};
            int IsOk = DataFactory.SqlHelper().ExecuteBySql(strSql, param);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.DeleteTaskLog<BPMS_Shortcut>(oldEntity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_Shortcut GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BPMS_Shortcut>("ShortcutId", KeyValue);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public IList GetList(string UserId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  M.MenuId ,
                                    M.Code ,
                                    M.FullName ,
                                    M.Description ,
                                    M.Img ,
                                    M.NavigateUrl
                            FROM    BPMS_Shortcut S
                                    LEFT JOIN BPMS_SysMenu M ON S.MenuId = M.MenuId
                            WHERE 1=1 AND UserId = @UserId");
            strSql.Append(" ORDER BY S.CreateDate");
            SqlParam[] param = {
                                         new SqlParam("@UserId",UserId)};
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_ModulePermission>(strSql, param);
        }
        #endregion
    }
}