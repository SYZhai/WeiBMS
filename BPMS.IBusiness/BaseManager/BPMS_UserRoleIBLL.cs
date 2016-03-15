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
    /// 用户帐户角色关系 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.24</date>
    /// </author>
    /// </summary>
    public interface BPMS_UserRoleIBLL
    {
        /// <summary>
        /// 加载未添加成员
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <returns></returns>
        IList GetListNotMember(string RoleId);
        /// <summary>
        /// 加载角色里面成员
        /// </summary>
        /// <param name="Parm_Key_Value">搜索条件键值</param>
        /// <returns></returns>
        IList GetListMember(Hashtable Parm_Key_Value);
        /// <summary>
        /// 批量添加角色成员
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="RoleId">角色主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        bool BatchAddMember(string[] KeyValue, string RoleId, string CreateUserId, string CreateUserName);
        /// <summary>
        /// 删除角色成员
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <param name="KeyValue">要删除值</param>
        /// <returns></returns>
        bool BatchDeleteMember(string RoleId, string[] KeyValue);
        /// <summary>
        /// 用户分配角色列表，
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        DataTable GetUserRoleList(string UserId);
        /// <summary>
        /// 用户批量添加角色
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="UserId">模用户主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        bool BatchAddUserRole(string[] KeyValue, string UserId, string CreateUserId, string CreateUserName);
        /// <summary>
        /// 根据用户查询 拥有角色列表
        /// </summary>
        /// <param name="UserId"></param>
        /// <returns></returns>
        IList GetUserRoleListByUserId(string UserId);
    }
}