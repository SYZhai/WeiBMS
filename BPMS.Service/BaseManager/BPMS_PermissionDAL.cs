using BPMS.Entity;
using DotNet.Kernel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BPMS.Service
{
    /// <summary>
    /// 用户模块权限模块，角色模块权限，用户按钮权限，角色按钮权限，用户数据权限，角色数据权限
    /// </summary>
    public class BPMS_PermissionDAL
    {
        /// <summary>
        /// 获取 角色，用户 模块菜单权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public IList GetModulePermission(string UserId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  UM.UserId ,
                                    UM.MenuId ,
                                    SM.ParentId ,
                                    SM.FullName ,
                                    SM.Description ,
                                    SM.Img ,
                                    SM.NavigateUrl ,
                                    SM.FormName ,
                                    SM.Target ,
                                    SM.IsUnfold
                            FROM    BPMS_SysMenu SM
                                    INNER JOIN ( SELECT UR.UserId AS UserId ,
                                                        RM.MenuId AS MenuId
                                                 FROM   BPMS_RoleMenu RM
                                                        INNER JOIN BPMS_UserRole UR ON RM.RoleId = UR.RoleId
                                                 UNION
                                                 SELECT UserId ,
                                                        MenuId
                                                 FROM   BPMS_UserMenu
                                                 UNION
                                                 SELECT U.UserId ,
                                                        RM.MenuId
                                                 FROM   BPMS_User U
                                                        LEFT JOIN BPMS_RoleMenu RM ON U.RoleId = RM.RoleId
                                                 WHERE  U.UserId = @UserId
                                               ) UM ON SM.MenuId = UM.MenuId
                            WHERE   UM.UserId = @UserId AND SM.Enabled = 1
                            ORDER BY SM.SortCode");
            SqlParam[] param = {
                                         new SqlParam("@UserId",UserId)};
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_ModulePermission>(strSql, param);
        }
        /// <summary>
        /// 获取 角色，用户 按钮权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public IList GetButtonPermission(string UserId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  BID.UserId ,
                                    BID.MenuId ,
                                    BID.ButtonId ,
                                    B.FullName ,
                                    B.Img ,
                                    B.Event ,
                                    B.Control_ID ,
                                    B.Category ,
                                    B.Split ,
                                    B.Description,
                                    MB.SortCode
                            FROM    BPMS_Button B
                                    INNER JOIN ( SELECT UR.UserId AS UserId ,
                                                        RMB.MenuId AS MenuId ,
                                                        RMB.ButtonId AS ButtonId
                                                 FROM   BPMS_UserRole UR
                                                        INNER JOIN BPMS_RoleMenuButton RMB ON UR.RoleId = RMB.RoleId
                                                 GROUP BY RMB.MenuId ,
                                                        RMB.ButtonId ,
                                                        UR.UserId
                                                 UNION
                                                 SELECT UM.UserId AS UserId ,
                                                        UM.MenuId AS MenuId ,
                                                        UMB.ButtonId AS ButtonId
                                                 FROM   BPMS_UserMenu UM
                                                        INNER JOIN BPMS_UserMenuButton UMB ON UM.MenuId = UMB.MenuId
                                                 GROUP BY UM.UserId ,
                                                        UM.MenuId ,
                                                        UMB.ButtonId
                                                 UNION
                                                 SELECT U.UserId ,
                                                        RMB.MenuId ,
                                                        RMB.ButtonId
                                                 FROM   BPMS_User u
                                                        INNER JOIN BPMS_RoleMenuButton RMB ON u.RoleId = RMB.RoleId
                                                 WHERE  U.UserId = @UserId
                                               ) BID ON B.ButtonId = BID.ButtonId
                                    INNER JOIN BPMS_SysMenuButton MB ON BID.MenuId = MB.MenuId
                                                                            AND BID.ButtonId = MB.ButtonId
                            WHERE   BID.UserId = @UserId AND B.Enabled = 1
                            GROUP BY BID.UserId ,
                                    BID.MenuId ,
                                    BID.ButtonId ,
                                    B.FullName ,
                                    B.Img ,
                                    B.Event ,
                                    B.Control_ID ,
                                    B.Category ,
                                    B.Split ,
                                    B.Description ,
                                    MB.SortCode
                            ORDER BY MB.SortCode");
            SqlParam[] param = {
                                         new SqlParam("@UserId",UserId)};
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_ButtonPermission>(strSql, param);
        }

        /// <summary>
        /// 获取 角色数据权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public Hashtable GetDataPermission(string UserId)
        {
            Hashtable ht = new Hashtable();
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  DP.ResourceId ,
                                    DP.ObjectId
                            FROM    BPMS_DataPermission DP
                                    LEFT JOIN BPMS_UserRole UR ON UR.RoleId = DP.RoleId
                            WHERE   UR.UserId = @UserId
                            UNION ALL
                            SELECT  DP.ResourceId ,
                                    DP.ObjectId
                            FROM    BPMS_DataPermission DP
                                    INNER JOIN BPMS_User U ON DP.RoleId = U.RoleId
                            WHERE   U.UserId = @UserId");
            SqlParam[] param = {
                                         new SqlParam("@UserId",UserId)};
            DataTable dt = DataFactory.SqlHelper().GetDataTableBySQL(strSql, param);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (ht[dt.Rows[i]["ResourceId"]] != null)
                {
                    ht[dt.Rows[i]["ResourceId"]] = ht[dt.Rows[i]["ResourceId"]] + "," + dt.Rows[i]["ObjectId"].ToString();
                }
                else
                {
                    ht[dt.Rows[i]["ResourceId"]] = dt.Rows[i]["ObjectId"];
                }
            }
            return ht;
        }


        /// <summary>
        /// 获取 所有 模块菜单权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public IList GetModulePermission()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  MenuId ,
                                    ParentId ,
                                    FullName ,
                                    Description ,
                                    Img ,
                                    NavigateUrl ,
                                    FormName ,
                                    Target ,
                                    IsUnfold
                            FROM    BPMS_SysMenu
                            ORDER BY SortCode");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_ModulePermission>(strSql);
        }

        /// <summary>
        /// 获取 所有 按钮权限
        /// </summary>
        /// <returns></returns>
        public IList GetButtonPermission()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  MB.MenuId ,
                                    B.ButtonId ,
                                    B.FullName ,
                                    B.Img ,
                                    B.Event ,
                                    B.Control_ID ,
                                    B.Category ,
                                    B.Split ,
                                    B.Description
                            FROM    BPMS_SysMenuButton MB
                                    LEFT JOIN BPMS_Button B ON B.ButtonId = MB.ButtonId
                                    ORDER BY MB.CreateDate");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_ButtonPermission>(strSql);
        }

        /// <summary>
        /// 获取 所有数据权限
        /// </summary>
        /// <returns></returns>
        public Hashtable GetDataPermission()
        {
            Hashtable ht = new Hashtable();
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  DP.ResourceId ,
                                    DP.ObjectId
                            FROM    BPMS_DataPermission DP
                                    LEFT JOIN BPMS_UserRole UR ON UR.RoleId = DP.RoleId
                            UNION ALL
                            SELECT  DP.ResourceId ,
                                    DP.ObjectId
                            FROM    BPMS_DataPermission DP
                                    INNER JOIN BPMS_User U ON DP.RoleId = U.RoleId");
            DataTable dt = DataFactory.SqlHelper().GetDataTableBySQL(strSql);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (ht[dt.Rows[i]["ResourceId"]] != null)
                {
                    ht[dt.Rows[i]["ResourceId"]] = ht[dt.Rows[i]["ResourceId"]] + "," + dt.Rows[i]["ObjectId"].ToString();
                }
                else
                {
                    ht[dt.Rows[i]["ResourceId"]] = dt.Rows[i]["ObjectId"];
                }
            }
            return ht;
        }
    }
}
