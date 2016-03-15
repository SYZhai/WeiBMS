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
    /// 菜单导航操作按钮关系表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("菜单导航操作按钮关系表")]
    [Key("SysMenuButtonId")]
    public class BPMS_SysMenuButton
    {
        private string _SysMenuButtonId = null;
        /// <summary>
        /// 菜单导航按钮关系主键
        /// </summary>
        /// <returns></returns>
        [Description("菜单导航按钮关系主键")]
        public string SysMenuButtonId
        {
            get
            {
                return this._SysMenuButtonId;
            }
            set
            {
                this._SysMenuButtonId = value;
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
        private int? _SortCode = null;
        /// <summary>
        /// 排序吗
        /// </summary>
        /// <returns></returns>
        [Description("排序吗")]
        public int? SortCode
        {
            get
            {
                return this._SortCode;
            }
            set
            {
                this._SortCode = value;
            }
        }
    }
}