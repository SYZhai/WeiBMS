using BPMS.IBusiness;
using BPMS.Service;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BPMS.Business
{
    /// <summary>
    /// 用户模块权限模块，角色模块权限，用户按钮权限，角色按钮权限，用户数据权限，角色数据权限
    /// </summary>
    public class BPMS_PermissionBLL : BPMS_PermissionIBLL
    {
        private readonly BPMS_PermissionDAL dal = new BPMS_PermissionDAL();

        /// <summary>
        /// 获取 角色，用户 模块菜单权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public IList GetModulePermission(string UserId)
        {
            return dal.GetModulePermission(UserId);
        }
        /// <summary>
        /// 获取 角色，用户 按钮权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public IList GetButtonPermission(string UserId)
        {
            return dal.GetButtonPermission(UserId);
        }
        /// <summary>
        /// 获取角色数据权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public Hashtable GetDataPermission(string UserId)
        {
            return dal.GetDataPermission(UserId);
        }

        /// <summary>
        /// 获取所有模块菜单权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public IList GetModulePermission()
        {
            return dal.GetModulePermission();
        }
        /// <summary>
        /// 获取所有按钮权限
        /// </summary>
        /// <returns></returns>
        public IList GetButtonPermission()
        {
            return dal.GetButtonPermission();
        }
    }
}
