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
    /// 操作按钮
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("操作按钮")]
    [Key("ButtonId")]
    public class BPMS_Button
    {
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
        private string _FullName = null;
        /// <summary>
        /// 按钮名称
        /// </summary>
        /// <returns></returns>
        [Description("按钮名称")]
        public string FullName
        {
            get
            {
                return this._FullName;
            }
            set
            {
                this._FullName = value;
            }
        }
        private string _Img = null;
        /// <summary>
        /// 按钮图标
        /// </summary>
        /// <returns></returns>
        [Description("按钮图标")]
        public string Img
        {
            get
            {
                return this._Img;
            }
            set
            {
                this._Img = value;
            }
        }
        private string _Event = null;
        /// <summary>
        /// 按钮事件
        /// </summary>
        /// <returns></returns>
        [Description("按钮事件")]
        public string Event
        {
            get
            {
                return this._Event;
            }
            set
            {
                this._Event = value;
            }
        }
        private string _Control_ID = null;
        /// <summary>
        /// 控件ID
        /// </summary>
        /// <returns></returns>
        [Description("控件ID")]
        public string Control_ID
        {
            get
            {
                return this._Control_ID;
            }
            set
            {
                this._Control_ID = value;
            }
        }
        private string _Category = null;
        /// <summary>
        /// 分类
        /// </summary>
        /// <returns></returns>
        [Description("分类")]
        public string Category
        {
            get
            {
                return this._Category;
            }
            set
            {
                this._Category = value;
            }
        }
        private int? _Split = null;
        /// <summary>
        /// 是否分开
        /// </summary>
        /// <returns></returns>
        [Description("是否分开")]
        public int? Split
        {
            get
            {
                return this._Split;
            }
            set
            {
                this._Split = value;
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
        /// 有效：1-有效，0-无效
        /// </summary>
        /// <returns></returns>
        [Description("有效：1-有效，0-无效")]
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
        private int? _DeleteMark = null;
        /// <summary>
        /// 删除标记:1-正常，0-删除
        /// </summary>
        /// <returns></returns>
        [Description("删除标记:1-正常，0-删除")]
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