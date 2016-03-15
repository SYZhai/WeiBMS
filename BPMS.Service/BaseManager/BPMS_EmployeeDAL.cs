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
    /// 员工、职员
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.22</date>
    /// </author>
    /// </summary>
    public class BPMS_EmployeeDAL
    {
        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <returns></returns>
        public object GetMaxCode()
        {
            return DataFactory.DbUtils().GetMax("BPMS_Employee", "EmployeeId");
        }
        /// <summary>
        /// 获取记录总数
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <returns></returns>
        public int GetRecordCount(string KeyValue)
        {
            return DataFactory.DbUtils().RecordCount("BPMS_Employee", "EmployeeId", KeyValue);
        }
        /// <summary>
        /// 获取记录总数（带条件）
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public int GetRecordCount(StringBuilder where, SqlParam[] param)
        {
            return DataFactory.DbUtils().RecordCount("BPMS_Employee", where, param);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BPMS_Employee entity)
        {
            int IsOk = DataFactory.DbUtils().Insert(entity);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.AddTaskLog<BPMS_Employee>(entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Update(BPMS_Employee entity)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(BPMS_SysLogDAL.Instance.GetKeyFieldValue<BPMS_Employee>(entity).ToString());
            #endregion
            int IsOk = DataFactory.DbUtils().Update(entity, "EmployeeId");
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.UpdateTaskLog<BPMS_Employee>(oldEntity, entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
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
            int IsOk = DataFactory.DbUtils().Delete("BPMS_Employee", "EmployeeId", KeyValue);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.DeleteTaskLog<BPMS_Employee>(oldEntity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
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
            return DataFactory.DbUtils().BatchDelete("BPMS_Employee", "EmployeeId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_Employee GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BPMS_Employee>("EmployeeId", KeyValue);
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
            strSql.Append("SELECT * FROM BPMS_Employee WHERE 1=1");
            strSql.Append(where);
            strSql.Append(DataPermission.Instance.Employee);
            strSql.Append(" Order BY SortCode");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_Employee>(strSql, param);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        /// <param name="orderField">排序字段</param>
        /// <param name="orderType">排序类型</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">页大小</param>
        /// <param name="count">总条数</param>
        /// <returns></returns>
        public IList GetPageList(string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            return this.GetPageListWhere(null, null, orderField, orderType, pageIndex, pageSize, ref  count);
        }
        /// <summary>
        /// 分页获取数据列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="orderType">排序类型</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">页大小</param>
        /// <param name="count">总条数</param>
        /// <returns></returns>
        public IList GetPageListWhere(StringBuilder where, SqlParam[] param, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  *
                            FROM    ( SELECT    E.EmployeeId ,
                                                E.Code ,
                                                E.RealName ,
                                                E.Gender ,
                                                E.Email ,
                                                E.Mobile ,
                                                E.OfficePhone ,
                                                I.ItemName AS DutyId ,
                                                IA.ItemName AS TitleId ,
                                                E.JoinInDate ,
                                                E.IsDimission ,
                                                E.Enabled ,
					                            E.SortCode,
												E.CompanyId,
												E.DepartmentId,
												E.WorkgroupId,
                                                E.Spell,
                                                E.Description
                                        FROM      BPMS_Employee E
                                                LEFT JOIN BPMS_ItemDetails I ON E.DutyId = I.ItemCode
                                                                                AND I.ItemsId = '137a2d97-d1d9-4752-9c5e-239097e2ed68'
                                                LEFT JOIN BPMS_ItemDetails IA ON E.TitleId = IA.ItemCode
                                                                                    AND IA.ItemsId = '2acba9e8-5fa7-4b6f-8ebd-56e753dd059a'
                                    ) A WHERE 1=1");
            strSql.Append(DataPermission.Instance.Employee);
            strSql.Append(where);
            return DataFactory.SqlHelper().GetPageList<BPMS_Employee>(strSql.ToString(), param, CommonHelper.ToOrderField("SortCode", orderField), orderType, pageIndex, pageSize, ref count);
        }
        #endregion

        /// <summary>
        /// 自动补全(显示20行)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public IList autocomplete(StringBuilder where, SqlParam[] param)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT TOP 10 EmployeeId,RealName,Code FROM BPMS_Employee WHERE 1=1");
            strSql.Append(where);
            strSql.Append(DataPermission.Instance.Employee);
            strSql.Append(" AND Enabled = 1");
            strSql.Append(" ORDER BY CreateDate");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_Employee>(strSql, param);
        }
    }
}