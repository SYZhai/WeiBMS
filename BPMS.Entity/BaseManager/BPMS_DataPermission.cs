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
    /// 数据权限存储表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.03</date>
    /// </author>
    /// </summary>
    [Description("数据权限存储")]
    [Key("DataPermissionId")]
    public class BPMS_DataPermission
    {
        private string _DataPermissionId = null;
        /// <summary>
        /// 数据权限存储主键
        /// </summary>
        /// <returns></returns>
        [Description("数据权限存储主键")]
        public string DataPermissionId
        {
            get
            {
                return this._DataPermissionId;
            }
            set
            {
                this._DataPermissionId = value;
            }
        }
        private string _RoleId = null;
        /// <summary>
        /// 角色主键
        /// </summary>
        /// <returns></returns>
        [Description("角色主键")]
        public string RoleId
        {
            get
            {
                return this._RoleId;
            }
            set
            {
                this._RoleId = value;
            }
        }
        private string _Code = null;
        /// <summary>
        /// 编号
        /// </summary>
        /// <returns></returns>
        [Description("编号")]
        public string Code
        {
            get
            {
                return this._Code;
            }
            set
            {
                this._Code = value;
            }
        }
        private string _ResourceId = null;
        /// <summary>
        /// 对什么资源
        /// </summary>
        /// <returns></returns>
        [Description("对什么资源")]
        public string ResourceId
        {
            get
            {
                return this._ResourceId;
            }
            set
            {
                this._ResourceId = value;
            }
        }
        private string _ObjectId = null;
        /// <summary>
        /// 存储对象主键
        /// </summary>
        /// <returns></returns>
        [Description("存储对象主键")]
        public string ObjectId
        {
            get
            {
                return this._ObjectId;
            }
            set
            {
                this._ObjectId = value;
            }
        }
        private DateTime? _CreateDate = null;
        /// <summary>
        /// 创建时间
        /// </summary>
        /// <returns></returns>
        [Description("创建时间")]
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