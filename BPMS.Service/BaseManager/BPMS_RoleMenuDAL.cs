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
    /// 系统角色菜单关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.25</date>
    /// </author>
    /// </summary>
    public class BPMS_RoleMenuDAL
    {
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <returns></returns>
        public DataTable GetList(string RoleId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  
                            M.MenuId,
                            M.Code ,
                            M.FullName ,
                            M.Img ,
                            M.Category,
                            M.Description,
							M.SortCode,
                            M.ParentId,
                            R.MenuId AS IsExist
                            FROM    BPMS_SysMenu M
                            LEFT JOIN BPMS_RoleMenu R ON M.MenuId = R.MenuId AND 1=1");
            strSql.Append(" AND RoleId = @RoleId");
            strSql.Append(" ORDER BY M.SortCode");
            SqlParam[] param = {
                                         new SqlParam("@RoleId",RoleId)};
            return DataFactory.SqlHelper().GetDataTableBySQL(strSql, param);
        }
        /// <summary>
        /// 分配角色模块菜单权限
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="RoleId">角色主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public int AddModulePermission(string[] KeyValue, string RoleId, string CreateUserId, string CreateUserName)
        {
            StringBuilder[] sqls = new StringBuilder[KeyValue.Length + 1];
            object[] objs = new object[KeyValue.Length + 1];
            sqls[0] = DbCommon.DeleteSql("BPMS_RoleMenu", "RoleId");
            objs[0] = new SqlParam[] { new SqlParam("@RoleId", RoleId) };
            int index = 1;
            foreach (string item in KeyValue)
            {
                if (item.Length > 0)
                {
                    BPMS_RoleMenu entity = new BPMS_RoleMenu();
                    entity.RoleMenuId = CommonHelper.GetGuid;
                    entity.RoleId = RoleId;
                    entity.MenuId = item;
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