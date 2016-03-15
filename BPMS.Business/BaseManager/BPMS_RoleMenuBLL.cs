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
    /// 系统角色菜单关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.25</date>
    /// </author>
    /// </summary>
    public class BPMS_RoleMenuBLL : BPMS_RoleMenuIBLL
    {
        private readonly BPMS_RoleMenuDAL dal = new BPMS_RoleMenuDAL();
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <returns></returns>
        public DataTable GetList(string RoleId)
        {
            return dal.GetList(RoleId);
        }
        /// <summary>
        /// 分配角色模块菜单权限
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="RoleId">角色主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public bool AddModulePermission(string[] KeyValue, string RoleId, string CreateUserId, string CreateUserName)
        {
            return dal.AddModulePermission(KeyValue, RoleId, CreateUserId, CreateUserName) >= 0 ? true : false;
        }
    }
}