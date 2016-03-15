//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using BPMS.Entity;
using System.Collections;
using System.Text;
using System.Data;

namespace BPMS.IBusiness
{
    /// <summary>
    /// 系统角色菜单关系 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.25</date>
    /// </author>
    /// </summary>
    public interface BPMS_RoleMenuIBLL
    {
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <returns></returns>
        DataTable GetList(string RoleId);
        /// <summary>
        /// 分配角色模块菜单权限
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="RoleId">角色主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        bool AddModulePermission(string[] KeyValue, string RoleId, string CreateUserId, string CreateUserName);
    }
}