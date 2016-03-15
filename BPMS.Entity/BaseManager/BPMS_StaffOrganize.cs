//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using System;
using System.ComponentModel;
using System.Text;

namespace BPMS.Entity
{
    /// <summary>
    /// 用户账户部门关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("用户账户部门关系")]
    [Key("StaffOrganizeId")]
    public class BPMS_StaffOrganize
    {
        private string _StaffOrganizeId = null;
        /// <summary>
        /// 用户组织关系主键
        /// </summary>
        /// <returns></returns>
        [Description("用户组织关系主键")]
        public string StaffOrganizeId
        {
            get
            {
                return this._StaffOrganizeId;
            }
            set
            {
                this._StaffOrganizeId = value;
            }
        }
        private string _OrganizationId = null;
        /// <summary>
        /// 组织机构主键
        /// </summary>
        /// <returns></returns>
        [Description("组织机构主键")]
        public string OrganizationId
        {
            get
            {
                return this._OrganizationId;
            }
            set
            {
                this._OrganizationId = value;
            }
        }
        private string _UserId = null;
        /// <summary>
        /// 用户主键
        /// </summary>
        /// <returns></returns>
        [Description("用户主键")]
        public string UserId
        {
            get
            {
                return this._UserId;
            }
            set
            {
                this._UserId = value;
            }
        }
        private DateTime? _CreateDate = null;
        /// <summary>
        /// 发生时间
        /// </summary>
        /// <returns></returns>
        [Description("发生时间")]
        public DateTime? CreateDate
        {
            get
            {
                return this._CreateDate;
            }
            set
            {
                this._CreateDate = value;
            }
        }
        private string _CreateUserId = null;
        /// <summary>
        /// 创建用户主键
        /// </summary>
        /// <returns></returns>
        [Description("创建用户主键")]
        public string CreateUserId
        {
            get
            {
                return this._CreateUserId;
            }
            set
            {
                this._CreateUserId = value;
            }
        }
        private string _CreateUserName = null;
        /// <summary>
        /// 创建用户
        /// </summary>
        /// <returns></returns>
        [Description("创建用户")]
        public string CreateUserName
        {
            get
            {
                return this._CreateUserName;
            }
            set
            {
                this._CreateUserName = value;
            }
        }
    }
}