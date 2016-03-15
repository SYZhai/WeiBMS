//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using BPMS.Entity;
using System.Collections;
using System.Text;

namespace BPMS.IBusiness
{
    /// <summary>
    /// 数据权限存储表 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.03</date>
    /// </author>
    /// </summary>
    public interface BPMS_DataPermissionIBLL
    {
        #region Method
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Insert(BPMS_DataPermission entity);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Update(BPMS_DataPermission entity);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        BPMS_DataPermission GetEntity(string KeyValue);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <param name="ResourceId">授权项目</param>
        /// <returns></returns>
        BPMS_DataPermission GetEntity(string RoleId, string ResourceId);
        #endregion

        #region 授权项目
        /// <summary>
        /// 组织机构列表
        /// </summary>
        /// <returns></returns>
        IList GetOrganizationList();
        /// <summary>
        /// 用户列表
        /// </summary>
        /// <returns></returns>
        IList GetUserList();
        /// <summary>
        /// 员工列表
        /// </summary>
        /// <returns></returns>
        IList GetEmployeeList();
        #endregion

        /// <summary>
        /// 新建的项目数据，默认把数据权限设置了，，这样就别必要要去数据权限管理里面去打钩
        /// </summary>
        /// <param name="RoleId">角色</param>
        /// <param name="ResourceId">对象</param>
        /// <param name="key">数据ID</param>
        /// <param name="UserId">当前用户</param>
        /// <param name="key"></param>
        void AddItemDefault(string RoleId, string ResourceId, string key, string UserId);
    }
}