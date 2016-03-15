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
using System.Collections.Generic;

namespace BPMS.Business
{
    /// <summary>
    /// 用户帐户角色关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.24</date>
    /// </author>
    /// </summary>
    public class BPMS_UserRoleBLL : BPMS_UserRoleIBLL
    {
        private readonly BPMS_UserRoleDAL dal = new BPMS_UserRoleDAL();

        /// <summary>
        /// 加载未添加成员
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <returns></returns>
        public IList GetListNotMember(string RoleId)
        {
            return dal.GetListNotMember(RoleId);
        }
        /// <summary>
        /// 加载角色里面成员
        /// </summary>
        /// <param name="Parm_Key_Value">搜索条件键值</param>
        /// <returns></returns>
        public IList GetListMember(Hashtable Parm_Key_Value)
        {
            StringBuilder SqlWhere = new StringBuilder();
            List<SqlParam> ListParam = new List<SqlParam>();
            //编号
            if (Parm_Key_Value["Code"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Code"].ToString()))
            {
                SqlWhere.Append(" AND Code like @Code");
                ListParam.Add(new SqlParam("@Code", '%' + Parm_Key_Value["Code"].ToString() + '%'));
            }
            //账户
            if (Parm_Key_Value["Account"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Code"].ToString()))
            {
                SqlWhere.Append(" AND Account like @Account");
                ListParam.Add(new SqlParam("@Account", '%' + Parm_Key_Value["Account"].ToString() + '%'));
            }
            //名称
            if (Parm_Key_Value["RealName"] != null && !string.IsNullOrEmpty(Parm_Key_Value["RealName"].ToString()))
            {
                SqlWhere.Append(" AND (RealName like @RealName");
                SqlWhere.Append(" OR Spell like @Spell)");
                ListParam.Add(new SqlParam("@RealName", '%' + Parm_Key_Value["RealName"].ToString() + '%'));
                ListParam.Add(new SqlParam("@Spell", '%' + Parm_Key_Value["RealName"].ToString() + '%'));
            }
            //手机
            if (Parm_Key_Value["Mobile"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Mobile"].ToString()))
            {
                SqlWhere.Append(" AND Mobile like @Mobile");
                ListParam.Add(new SqlParam("@Mobile", '%' + Parm_Key_Value["Mobile"].ToString() + '%'));
            }
            SqlWhere.Append(" AND UserId IN(SELECT UserId FROM BPMS_UserRole WHERE RoleId = @RoleId)");
            ListParam.Add(new SqlParam("@RoleId", Parm_Key_Value["RoleId"].ToString()));
            return dal.GetListMember(SqlWhere, ListParam.ToArray());
        }
        /// <summary>
        /// 批量添加角色成员 
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="RoleId">角色主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public bool BatchAddMember(string[] KeyValue, string RoleId, string CreateUserId, string CreateUserName)
        {
            return dal.BatchAddMember(KeyValue, RoleId, CreateUserId, CreateUserName) >= 0 ? true : false;
        }
        /// <summary>
        /// 删除角色成员
        /// </summary>
        /// <param name="RoleId">角色主键</param>
        /// <param name="KeyValue">要删除值</param>
        /// <returns></returns>
        public bool BatchDeleteMember(string RoleId, string[] KeyValue)
        {
            return dal.BatchDeleteMember(RoleId, KeyValue) >= 0 ? true : false;
        }

        /// <summary>
        /// 用户分配角色列表，
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public DataTable GetUserRoleList(string UserId)
        {
            return dal.GetUserRoleList(UserId);
        }
        /// <summary>
        /// 用户批量添加角色
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="UserId">模用户主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public bool BatchAddUserRole(string[] KeyValue, string UserId, string CreateUserId, string CreateUserName)
        {
            return dal.BatchAddUserRole(KeyValue, UserId, CreateUserId, CreateUserName) >= 0 ? true : false;
        }
        /// <summary>
        /// 根据用户查询 拥有角色列表
        /// </summary>
        /// <param name="UserId"></param>
        /// <returns></returns>
        public IList GetUserRoleListByUserId(string UserId)
        {
            return dal.GetUserRoleListByUserId(UserId);
        }
    }
}