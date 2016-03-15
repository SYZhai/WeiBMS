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
    /// 用户菜单关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.27</date>
    /// </author>
    /// </summary>
    public class BPMS_UserMenuDAL
    {
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public DataTable GetList(string UserId)
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
                            UM.MenuId AS IsExist
                            FROM    BPMS_SysMenu M
                            LEFT JOIN BPMS_UserMenu UM ON M.MenuId = UM.MenuId AND 1=1");
            strSql.Append(" AND UserId = @UserId");
            strSql.Append(" ORDER BY M.SortCode");
            SqlParam[] param = {
                                         new SqlParam("@UserId",UserId)};
            return DataFactory.SqlHelper().GetDataTableBySQL(strSql, param);
        }
        /// <summary>
        /// 分配用户模块菜单权限
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="RoleId">用户主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public int AddModulePermission(string[] KeyValue, string UserId, string CreateUserId, string CreateUserName)
        {
            StringBuilder[] sqls = new StringBuilder[KeyValue.Length + 1];
            object[] objs = new object[KeyValue.Length + 1];
            sqls[0] = DbCommon.DeleteSql("BPMS_UserMenu", "UserId");
            objs[0] = new SqlParam[] { new SqlParam("@UserId", UserId) };
            int index = 1;
            foreach (string item in KeyValue)
            {
                if (item.Length > 0)
                {
                    BPMS_UserMenu entity = new BPMS_UserMenu();
                    entity.UserMenuId = CommonHelper.GetGuid;
                    entity.UserId = UserId;
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