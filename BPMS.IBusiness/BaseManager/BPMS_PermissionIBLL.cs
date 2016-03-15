using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BPMS.IBusiness
{
    /// <summary>
    /// 用户模块权限模块，角色模块权限，用户按钮权限，角色按钮权限，用户数据权限，角色数据权限
    /// </summary>
    public interface BPMS_PermissionIBLL
    {
        /// <summary>
        /// 获取 角色，用户 模块菜单权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        IList GetModulePermission(string UserId);
        /// <summary>
        /// 获取 角色，用户 操作按钮权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        IList GetButtonPermission(string UserId);
        /// <summary>
        /// 获取角色数据权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        Hashtable GetDataPermission(string UserId);
        /// <summary>
        /// 获取 所有模块菜单权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        IList GetModulePermission();
        /// <summary>
        /// 获取 所有 操作按钮权限
        /// </summary>
        /// <returns></returns>
        IList GetButtonPermission();
    }
}
