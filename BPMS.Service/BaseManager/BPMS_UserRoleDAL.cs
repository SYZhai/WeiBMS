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
    /// 用户帐户角色关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.24</date>
    /// </author>
    /// </summary>
    public class BPMS_UserRoleDAL
    {
        /// <summary>
        /// 加载未添加成员
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <returns></returns>
        public IList GetListNotMember(string RoleId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT * FROM BPMS_User WHERE 1=1 ");
            strSql.Append(" AND UserId NOT IN(SELECT UserId FROM BPMS_UserRole WHERE RoleId = @RoleId)");
            strSql.Append(" ORDER BY SortCode");
            SqlParam[] param = {
                                         new SqlParam("@RoleId",RoleId)};
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_User>(strSql, param);
        }
        /// <summary>
        /// 加载角色里面成员
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <returns></returns>
        public IList GetListMember(StringBuilder where, SqlParam[] param)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  *
                            FROM    ( SELECT    U.UserId ,
                                                U.Code ,
                                                U.Account,
                                                U.RealName ,
                                                U.Gender ,
                                                U.Mobile ,
                                                I.ItemName AS DutyId ,
                                                IA.ItemName AS TitleId ,
                                                U.Enabled ,
					                            U.SortCode,
												ORG.FullName AS DepartmentId,
                                                U.Spell,
                                                U.Description
                                        FROM      BPMS_User U
												LEFT JOIN BPMS_Organization ORG ON ORG.OrganizationId = U.DepartmentId
                                                LEFT JOIN BPMS_ItemDetails I ON U.DutyId = I.ItemCode
                                                                                AND I.ItemsId = '137a2d97-d1d9-4752-9c5e-239097e2ed68'
                                                LEFT JOIN BPMS_ItemDetails IA ON U.TitleId = IA.ItemCode
                                                                                    AND IA.ItemsId = '2acba9e8-5fa7-4b6f-8ebd-56e753dd059a'
                                    ) A WHERE 1=1");
            strSql.Append(where);
            strSql.Append(" ORDER BY DepartmentId,SortCode");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_User>(strSql, param);
        }

        /// <summary>
        /// 批量添加角色成员
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="RoleId">角色主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public int BatchAddMember(string[] KeyValue, string RoleId, string CreateUserId, string CreateUserName)
        {
            StringBuilder[] sqls = new StringBuilder[KeyValue.Length];
            object[] objs = new object[KeyValue.Length];
            int index = 0;
            foreach (string item in KeyValue)
            {
                if (item.Length > 0)
                {
                    BPMS_UserRole entity = new BPMS_UserRole();
                    entity.UserRoleId = CommonHelper.GetGuid;
                    entity.RoleId = RoleId;
                    entity.UserId = item;
                    entity.CreateUserId = CreateUserId;
                    entity.CreateUserName = CreateUserName;
                    sqls[index] = DbCommon.InsertSql(entity);
                    objs[index] = DbCommon.GetParameter(entity);
                    index++;
                }
            }
            return DataFactory.SqlHelper().BatchExecuteBySql(sqls, objs);
        }
        /// <summary>
        /// 删除角色成员
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <param name="KeyValue">要删除值</param>
        /// <returns></returns>
        public int BatchDeleteMember(string RoleId, string[] KeyValue)
        {
            StringBuilder[] sqls = new StringBuilder[KeyValue.Length];
            object[] objs = new object[KeyValue.Length];
            int index = 0;
            foreach (string item in KeyValue)
            {
                if (item.Length > 0)
                {
                    Hashtable ht = new Hashtable();
                    ht["RoleId"] = RoleId;
                    ht["UserId"] = item;
                    sqls[index] = DbCommon.DeleteSql("BPMS_UserRole", ht);
                    objs[index] = DbCommon.GetParameter(ht);
                    index++;
                }
            }
            return DataFactory.SqlHelper().BatchExecuteBySql(sqls, objs);
        }

        /// <summary>
        /// 用户分配角色列表，
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public DataTable GetUserRoleList(string UserId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  
                            R.RoleId ,
                            R.FullName ,
                            R.Description,
                            R.OrganizationId,
                            UR.RoleId AS IsExist
                            FROM    BPMS_Roles R
                            LEFT JOIN BPMS_UserRole UR ON R.RoleId = UR.RoleId AND 1=1");
            strSql.Append(" AND UserId =@UserId");
            strSql.Append(" ORDER BY R.SortCode");
            SqlParam[] param = {
                                         new SqlParam("@UserId",UserId)};
            return DataFactory.SqlHelper().GetDataTableBySQL(strSql, param);
        }
        /// <summary>
        /// 用户批量添加角色
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="UserId">模用户主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public int BatchAddUserRole(string[] KeyValue, string UserId, string CreateUserId, string CreateUserName)
        {
            StringBuilder[] sqls = new StringBuilder[KeyValue.Length + 1];
            object[] objs = new object[KeyValue.Length + 1];
            sqls[0] = DbCommon.DeleteSql("BPMS_UserRole", "UserId");
            objs[0] = new SqlParam[] { new SqlParam("@UserId", UserId) };
            int index = 1;
            foreach (string item in KeyValue)
            {
                if (item.Length > 0)
                {
                    BPMS_UserRole entity = new BPMS_UserRole();
                    entity.UserRoleId = CommonHelper.GetGuid;
                    entity.UserId = UserId;
                    entity.RoleId = item;
                    entity.CreateUserId = CreateUserId;
                    entity.CreateUserName = CreateUserName;
                    sqls[index] = DbCommon.InsertSql(entity);
                    objs[index] = DbCommon.GetParameter(entity);
                    index++;
                }
            }
            return DataFactory.SqlHelper().BatchExecuteBySql(sqls, objs);
        }
        /// <summary>
        /// 根据用户查询 拥有角色列表
        /// </summary>
        /// <param name="UserId"></param>
        /// <returns></returns>
        public IList GetUserRoleListByUserId(string UserId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  R.RoleId ,
                                    R.Code ,
                                    R.FullName ,
                                    I.ItemName AS Category ,
                                    R.Description
                            FROM    BPMS_UserRole UR
                                    LEFT JOIN BPMS_Roles R ON R.RoleId = UR.RoleId
                                    LEFT JOIN BPMS_ItemDetails I ON R.Category = I.ItemCode
                                                                    AND I.ItemsId = '5fed1313-7355-4cc4-a7ec-73211a361fa6'
                            WHERE   1 = 1");
            strSql.Append(" AND UserId = @UserId");
            SqlParam[] param = {
                                         new SqlParam("@UserId",UserId)};
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_Roles>(strSql, param);
        }
    }
}