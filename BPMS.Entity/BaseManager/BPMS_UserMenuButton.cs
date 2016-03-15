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
    /// 用户菜单按钮关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("用户菜单按钮关系")]
    [Key("UserMenuButtonId")]
    public class BPMS_UserMenuButton
    {
        private string _UserMenuButtonId = null;
        /// <summary>
        /// 用户菜单按钮关系主键
        /// </summary>
        /// <returns></returns>
        [Description("用户菜单按钮关系主键")]
        public string UserMenuButtonId
        {
            get
            {
                return this._UserMenuButtonId;
            }
            set
            {
                this._UserMenuButtonId = value;
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
        private string _MenuId = null;
        /// <summary>
        /// 菜单主键
        /// </summary>
        /// <returns></returns>
        [Description("菜单主键")]
        public string MenuId
        {
            get
            {
                return this._MenuId;
            }
            set
            {
                this._MenuId = value;
            }
        }
        private string _ButtonId = null;
        /// <summary>
        /// 按钮主键
        /// </summary>
        /// <returns></returns>
        [Description("按钮主键")]
        public string ButtonId
        {
            get
            {
                return this._ButtonId;
            }
            set
            {
                this._ButtonId = value;
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