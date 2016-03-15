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
    /// 系统接口访问
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.02</date>
    /// </author>
    /// </summary>
    [Description("系统接口访问")]
    [Key("IAccessId")]
    public class BPMS_InterfaceAccess
    {
        private string _IAccessId = null;
        /// <summary>
        /// 系统接口访问主键
        /// </summary>
        /// <returns></returns>
        [Description("系统接口访问主键")]
        public string IAccessId
        {
            get
            {
                return this._IAccessId;
            }
            set
            {
                this._IAccessId = value;
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
        private string _AuthorizationUserId = null;
        /// <summary>
        /// 授权用户主键
        /// </summary>
        /// <returns></returns>
        [Description("授权用户主键")]
        public string AuthorizationUserId
        {
            get
            {
                return this._AuthorizationUserId;
            }
            set
            {
                this._AuthorizationUserId = value;
            }
        }
        private string _AuthorizationUserName = null;
        /// <summary>
        /// 授权用户
        /// </summary>
        /// <returns></returns>
        [Description("授权用户")]
        public string AuthorizationUserName
        {
            get
            {
                return this._AuthorizationUserName;
            }
            set
            {
                this._AuthorizationUserName = value;
            }
        }
        private string _AuthorizationCode = null;
        /// <summary>
        /// 授权模块编号
        /// </summary>
        /// <returns></returns>
        [Description("授权模块编号")]
        public string AuthorizationCode
        {
            get
            {
                return this._AuthorizationCode;
            }
            set
            {
                this._AuthorizationCode = value;
            }
        }
        private DateTime? _StartDate = null;
        /// <summary>
        /// 生效日期
        /// </summary>
        /// <returns></returns>
        [Description("生效日期")]
        public DateTime? StartDate
        {
            get
            {
                return this._StartDate;
            }
            set
            {
                this._StartDate = value;
            }
        }
        private DateTime? _EndDate = null;
        /// <summary>
        /// 过期日期
        /// </summary>
        /// <returns></returns>
        [Description("过期日期")]
        public DateTime? EndDate
        {
            get
            {
                return this._EndDate;
            }
            set
            {
                this._EndDate = value;
            }
        }
        private string _Description = null;
        /// <summary>
        /// 描述
        /// </summary>
        /// <returns></returns>
        [Description("描述")]
        public string Description
        {
            get
            {
                return this._Description;
            }
            set
            {
                this._Description = value;
            }
        }
        private int? _Enabled = null;
        /// <summary>
        /// 有效
        /// </summary>
        /// <returns></returns>
        [Description("有效")]
        public int? Enabled
        {
            get
            {
                return this._Enabled;
            }
            set
            {
                this._Enabled = value;
            }
        }
        private int? _DeleteMark = null;
        /// <summary>
        /// 删除标记
        /// </summary>
        /// <returns></returns>
        [Description("删除标记")]
        public int? DeleteMark
        {
            get
            {
                return this._DeleteMark;
            }
            set
            {
                this._DeleteMark = value;
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
        private DateTime? _ModifyDate = null;
        /// <summary>
        /// 修改时间
        /// </summary>
        /// <returns></returns>
        [Description("修改时间")]
        public DateTime? ModifyDate
        {
            get
            {
                return this._ModifyDate;
            }
            set
            {
                this._ModifyDate = value;
            }
        }
        private string _ModifyUserId = null;
        /// <summary>
        /// 修改用户主键
        /// </summary>
        /// <returns></returns>
        [Description("修改用户主键")]
        public string ModifyUserId
        {
            get
            {
                return this._ModifyUserId;
            }
            set
            {
                this._ModifyUserId = value;
            }
        }
        private string _ModifyUserName = null;
        /// <summary>
        /// 修改用户
        /// </summary>
        /// <returns></returns>
        [Description("修改用户")]
        public string ModifyUserName
        {
            get
            {
                return this._ModifyUserName;
            }
            set
            {
                this._ModifyUserName = value;
            }
        }
    }
}