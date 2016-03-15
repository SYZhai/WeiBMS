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

namespace BPMS.Business
{
    /// <summary>
    /// 数据权限存储表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.03</date>
    /// </author>
    /// </summary>
    public class BPMS_DataPermissionBLL : BPMS_DataPermissionIBLL
    {
        private readonly BPMS_DataPermissionDAL dal = new BPMS_DataPermissionDAL();

        #region Method
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Insert(BPMS_DataPermission entity)
        {
            return dal.Insert(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Update(BPMS_DataPermission entity)
        {
            return dal.Update(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_DataPermission GetEntity(string KeyValue)
        {
            return dal.GetEntity(KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <param name="ResourceId">授权项目</param>
        /// <returns></returns>
        public BPMS_DataPermission GetEntity(string RoleId, string ResourceId)
        {
            StringBuilder where = new StringBuilder();
            where.Append(" AND RoleId = @RoleId");
            where.Append(" AND ResourceId = @ResourceId");
            SqlParam[] para = {
                                        new SqlParam("@RoleId",RoleId),
                                        new SqlParam("@ResourceId", ResourceId)};
            return dal.GetEntity(where, para);
        }
        #endregion

        #region 授权项目
        /// <summary>
        /// 组织机构列表
        /// </summary>
        /// <returns></returns>
        public IList GetOrganizationList()
        {
            return dal.GetOrganizationList();
        }
        /// <summary>
        /// 用户列表
        /// </summary>
        /// <returns></returns>
        public IList GetUserList()
        {
            return dal.GetUserList();
        }
        /// <summary>
        /// 员工列表
        /// </summary>
        /// <returns></returns>
        public IList GetEmployeeList()
        {
            return dal.GetEmployeeList();
        }
        #endregion

        /// <summary>
        /// 新建的项目数据，默认把数据权限设置了，，这样就别必要要去数据权限管理里面去打钩
        /// </summary>
        /// <param name="RoleId">角色</param>
        /// <param name="ResourceId">对象</param>
        /// <param name="key">数据ID</param>
        /// <param name="UserId">当前用户</param>
        /// <param name="key"></param>
        public void AddItemDefault(string RoleId, string ResourceId, string key, string UserId)
        {
            dal.AddItemDefault(RoleId, ResourceId, key,UserId);
        }
    }
}