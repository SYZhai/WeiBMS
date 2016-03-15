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
    /// 首页快捷功能
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("首页快捷功能")]
    [Key("ShortcutId")]
    public class BPMS_Shortcut
    {
        private string _ShortcutId = null;
        /// <summary>
        /// 首页快捷功能主键
        /// </summary>
        /// <returns></returns>
        [Description("首页快捷功能主键")]
        public string ShortcutId
        {
            get
            {
                return this._ShortcutId;
            }
            set
            {
                this._ShortcutId = value;
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
    }
}