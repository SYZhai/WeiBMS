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
using System;
using System.Threading;

namespace BPMS.Service
{
    /// <summary>
    /// 系统角色菜单按钮关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.26</date>
    /// </author>
    /// </summary>
    public class BPMS_RoleMenuButtonDAL
    {
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <returns></returns>
        public DataTable GetList(string RoleId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  B.ButtonId ,
                                    B.FullName ,
                                    B.Img ,
                                    B.Description ,
                                    MB.MenuId ,
                                    B.Category ,
                                    RMB.RoleMenuButtonId AS IsExist
                            FROM    BPMS_SysMenuButton MB
                                    LEFT JOIN BPMS_Button B ON B.ButtonId = MB.ButtonId
                                    LEFT JOIN BPMS_RoleMenuButton RMB ON RMB.ButtonId = B.ButtonId
                            AND RMB.MenuId = MB.MenuId AND 1=1
							AND RMB.RoleId = @RoleId ");
            strSql.Append(" ORDER BY MB.SortCode");
            SqlParam[] param = {
                                         new SqlParam("@RoleId",RoleId)};
            return DataFactory.SqlHelper().GetDataTableBySQL(strSql, param);
        }
        /// <summary>
        /// 分配角色按钮权限
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="RoleId">角色主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public int AddButtonPermission(string[] KeyValue, string RoleId, string CreateUserId, string CreateUserName)
        {
            StringBuilder[] sqls = new StringBuilder[KeyValue.Length + 1];
            object[] objs = new object[KeyValue.Length + 1];
            sqls[0] = DbCommon.DeleteSql("BPMS_RoleMenuButton", "RoleId");
            objs[0] = new SqlParam[] { new SqlParam("@RoleId", RoleId) };
            int index = 1;
            foreach (string item in KeyValue)
            {
                if (item.Length > 0)
                {
                    string[] stritem = item.Split('|');
                    BPMS_RoleMenuButton entity = new BPMS_RoleMenuButton();
                    entity.RoleMenuButtonId = CommonHelper.GetGuid;
                    entity.RoleId = RoleId;
                    entity.ButtonId = stritem[0];
                    entity.MenuId = stritem[1];
                    entity.CreateDate = DateTime.Now;
                    entity.CreateUserId = CreateUserId;
                    entity.CreateUserName = CreateUserName;
                    sqls[index] = DbCommon.InsertSql(entity);
                    objs[index] = DbCommon.GetParameter(entity);
                    index++;
                }
            }
            return DataFactory.SqlHelper().BatchExecuteBySql(sqls, objs);
        }
    }
}