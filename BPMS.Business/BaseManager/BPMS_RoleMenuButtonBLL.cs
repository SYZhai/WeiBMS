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
    /// 系统角色菜单按钮关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.26</date>
    /// </author>
    /// </summary>
    public class BPMS_RoleMenuButtonBLL : BPMS_RoleMenuButtonIBLL
    {
        private readonly BPMS_RoleMenuButtonDAL dal = new BPMS_RoleMenuButtonDAL();

        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <returns></returns>
        public DataTable GetList(string RoleId)
        {
            return dal.GetList(RoleId);
        }
        /// <summary>
        /// 分配角色按钮权限
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="RoleId">角色主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public bool AddButtonPermission(string[] KeyValue, string RoleId, string CreateUserId, string CreateUserName)
        {
            return dal.AddButtonPermission(KeyValue, RoleId, CreateUserId, CreateUserName) >= 0 ? true : false;
        }
    }
}