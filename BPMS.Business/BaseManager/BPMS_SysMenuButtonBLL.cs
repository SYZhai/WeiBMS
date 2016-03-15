//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using BPMS.Service;
using BPMS.IBusiness;
using System.Collections;
using System.Text;
using System.Data;

namespace BPMS.Business
{
    /// <summary>
    /// 菜单导航操作按钮关系表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.24</date>
    /// </author>
    /// </summary>
    public class BPMS_SysMenuButtonBLL : BPMS_SysMenuButtonIBLL
    {
        private readonly BPMS_SysMenuButtonDAL dal = new BPMS_SysMenuButtonDAL();

        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="MenuId">模块菜单主键</param>
        /// <returns></returns>
        public DataTable GetListWhere(string MenuId)
        {
            StringBuilder where = new StringBuilder();
            where.Append(" AND S.MenuId = @MenuId");
            SqlParam[] param = {
                                         new SqlParam("@MenuId",MenuId)};
            return dal.GetListWhere(where, param);
        }

        /// <summary>
        /// 设批量添加，菜单导航操作按钮关系
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="MenuId">模块菜单主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public bool BatchAddMenuButton(string[] KeyValue, string MenuId, string CreateUserId, string CreateUserName)
        {
            return dal.BatchAddMenuButton(KeyValue, MenuId, CreateUserId, CreateUserName) >= 0 ? true : false;
        }
    }
}