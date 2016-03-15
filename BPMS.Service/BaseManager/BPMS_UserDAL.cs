//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using System.Collections;
using System.Text;
using BPMS.Service;
using System.Collections.Generic;
using System.Data;

namespace BPMS.Service
{
    /// <summary>
    /// 用户、帐户
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.21</date>
    /// </author>
    /// </summary>
    public class BPMS_UserDAL
    {
        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <returns></returns>
        public object GetMaxCode()
        {
            return DataFactory.DbUtils().GetMax("BPMS_User", "SortCode");
        }
        /// <summary>
        /// 获取记录总数
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <returns></returns>
        public int GetRecordCount(string KeyValue)
        {
            return DataFactory.DbUtils().RecordCount("BPMS_User", "UserId", KeyValue);
        }
        /// <summary>
        /// 获取记录总数（带条件）
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public int GetRecordCount(StringBuilder where, SqlParam[] param)
        {
            return DataFactory.DbUtils().RecordCount("BPMS_User", where, param);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BPMS_User entity)
        {
            entity.SortCode = CommonHelper.GetInt(this.GetMaxCode());
            int IsOk = DataFactory.DbUtils().Insert(entity);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.AddTaskLog<BPMS_User>(entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Update(BPMS_User entity)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(BPMS_SysLogDAL.Instance.GetKeyFieldValue<BPMS_User>(entity).ToString());
            #endregion
            int IsOk = DataFactory.DbUtils().Update(entity, "UserId");
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.UpdateTaskLog<BPMS_User>(oldEntity, entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int UpdateNotLog(BPMS_User entity)
        {
            return DataFactory.DbUtils().Update(entity, "UserId");
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
            int IsOk = DataFactory.DbUtils().Delete("BPMS_User", "UserId", KeyValue);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.DeleteTaskLog<BPMS_User>(oldEntity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
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
            return DataFactory.DbUtils().BatchDelete("BPMS_User", "UserId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_User GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BPMS_User>("UserId", KeyValue);
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
            strSql.Append("SELECT * FROM BPMS_User WHERE 1=1");
            strSql.Append(where);
            strSql.Append(DataPermission.Instance.User);
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_User>(strSql, param);
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
            strSql.Append(@"SELECT  U.UserId ,
                                    U.Code ,
                                    U.Account ,
                                    U.RealName ,
                                    U.Gender ,
                                    U.Email ,
                                    U.Mobile ,
                                    U.OICQ ,
                                    U.Enabled ,
                                    U.SortCode ,
                                    ORGA.FullName AS CompanyId ,
                                    ORG.FullName AS DepartmentId ,
                                    U.Spell ,
                                    U.LogOnCount ,
                                    U.LastVisit ,
                                    U.Description
                            FROM    BPMS_User U
                                    LEFT JOIN BPMS_Organization ORG ON ORG.OrganizationId = U.DepartmentId
                                    LEFT JOIN BPMS_Organization ORGA ON ORGA.OrganizationId = U.CompanyId");
            strSql.Append(" WHERE 1=1 " + DataPermission.Instance.User + "");
            strSql.Append(where);
            return DataFactory.SqlHelper().GetPageList<BPMS_User>(strSql.ToString(), param, "CompanyId," + CommonHelper.ToOrderField("SortCode", orderField), orderType, pageIndex, pageSize, ref count);
        }
        #endregion

        /// <summary>
        /// 登录验证
        /// </summary>
        /// <param name="Account">登录账户</param>
        /// <returns></returns>
        public BPMS_User GetEntityByAccount(string Account)
        {
            return DataFactory.DbUtils().GetModelById<BPMS_User>("Account", Account);
        }
        /// <summary>
        /// 根据机构查询用户列表
        /// </summary>
        /// <param name="Category">分类</param>
        /// <param name="OrganizationId">机构主键</param>
        /// <returns></returns>
        public IList GetDataTableByOrganizationId(string Category, string OrganizationId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT UserId,Code,RealName,Gender FROM BPMS_User WHERE 1=1");
            List<SqlParam> ListParam = new List<SqlParam>();
            //机构查询
            if (!string.IsNullOrEmpty(Category))
            {
                if (Category == "公司")
                {
                    strSql.Append(" AND CompanyId = @OrganizationId");
                }
                else if (Category == "部门")
                {
                    strSql.Append(" AND DepartmentId = @OrganizationId");
                }
                else if (Category == "工作组")
                {
                    strSql.Append(" AND WorkgroupId = @OrganizationId");
                }
                ListParam.Add(new SqlParam("@OrganizationId", OrganizationId));
            }
            strSql.Append(DataPermission.Instance.User);
            strSql.Append(" ORDER BY CompanyId,DepartmentId,WorkgroupId,SortCode DESC");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_User>(strSql, ListParam.ToArray());
        }
        /// <summary>
        /// 得到一个对象IList
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public IList GetIListById(string KeyValue)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  *
                            FROM    ( SELECT    U.UserId ,
                                                U.Code ,
                                                U.Account ,
                                                U.RealName ,
                                                U.Gender ,
                                                U.Email ,
                                                U.Mobile ,
                                                U.OICQ ,
                                                U.Birthday,
                                                U.Telephone,
                                                I.ItemName AS DutyId ,
                                                IA.ItemName AS TitleId ,
                                                U.Enabled ,
                                                U.SortCode ,
                                                ORG_C.FullName AS CompanyId,
                                                ORG_D.FullName AS DepartmentId ,
                                                ORG_W.FullName AS WorkgroupId ,
                                                U.Spell ,
                                                U.LogOnCount ,
                                                U.LastVisit ,
                                                U.Description,
                                                R.FullName AS RoleId
                                      FROM      BPMS_User U
                                                LEFT JOIN BPMS_ItemDetails I ON U.DutyId = I.ItemCode
                                                                                AND I.ItemsId = '137a2d97-d1d9-4752-9c5e-239097e2ed68'
                                                LEFT JOIN BPMS_ItemDetails IA ON U.TitleId = IA.ItemCode
                                                                                 AND IA.ItemsId = '2acba9e8-5fa7-4b6f-8ebd-56e753dd059a'
                                                LEFT JOIN BPMS_Roles R ON R.RoleId = U.RoleId
                                                LEFT JOIN BPMS_Organization ORG_C ON ORG_C.OrganizationId = U.CompanyId
                                                LEFT JOIN BPMS_Organization ORG_D ON ORG_D.OrganizationId = U.DepartmentId
                                                 LEFT JOIN BPMS_Organization ORG_W ON ORG_W.OrganizationId = U.WorkgroupId
                                    ) A
                            WHERE   1 = 1");
            strSql.Append(" AND UserId = @UserId");
            SqlParam[] param = {
                                         new SqlParam("@UserId",KeyValue)};
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_User>(strSql, param);
        }
        /// <summary>
        /// 自动补全(显示20行)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public IList autocomplete(StringBuilder where, SqlParam[] param)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT TOP 10 UserId,RealName,Code FROM BPMS_User WHERE 1=1");
            strSql.Append(where);
            strSql.Append(DataPermission.Instance.User);
            strSql.Append(" AND Enabled = 1");
            strSql.Append(" ORDER BY CreateDate");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_User>(strSql, param);
        }
    }
}