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
    /// 模块列表表头定义
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("模块列表表头定义")]
    [Key("TableColumnsId")]
    public class BPMS_TableColumns
    {
        private string _TableColumnsId = null;
        /// <summary>
        /// 模块列表表头定义主键
        /// </summary>
        /// <returns></returns>
        [Description("模块列表表头定义主键")]
        public string TableColumnsId
        {
            get
            {
                return this._TableColumnsId;
            }
            set
            {
                this._TableColumnsId = value;
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
        private string _Title = null;
        /// <summary>
        /// 标题
        /// </summary>
        /// <returns></returns>
        [Description("标题")]
        public string Title
        {
            get
            {
                return this._Title;
            }
            set
            {
                this._Title = value;
            }
        }
        private string _Field = null;
        /// <summary>
        /// 字段
        /// </summary>
        /// <returns></returns>
        [Description("字段")]
        public string Field
        {
            get
            {
                return this._Field;
            }
            set
            {
                this._Field = value;
            }
        }
        private int? _Width = null;
        /// <summary>
        /// 宽度
        /// </summary>
        /// <returns></returns>
        [Description("宽度")]
        public int? Width
        {
            get
            {
                return this._Width;
            }
            set
            {
                this._Width = value;
            }
        }
        private int? _IsHidden = null;
        /// <summary>
        /// 是否隐藏
        /// </summary>
        /// <returns></returns>
        [Description("是否隐藏")]
        public int? IsHidden
        {
            get
            {
                return this._IsHidden;
            }
            set
            {
                this._IsHidden = value;
            }
        }
        private string _Align = null;
        /// <summary>
        /// 对齐方式
        /// </summary>
        /// <returns></returns>
        [Description("对齐方式")]
        public string Align
        {
            get
            {
                return this._Align;
            }
            set
            {
                this._Align = value;
            }
        }
        private string _Custom = null;
        /// <summary>
        /// 自定义
        /// </summary>
        /// <returns></returns>
        [Description("自定义")]
        public string Custom
        {
            get
            {
                return this._Custom;
            }
            set
            {
                this._Custom = value;
            }
        }
        private int? _IsPublic = null;
        /// <summary>
        /// 是公开
        /// </summary>
        /// <returns></returns>
        [Description("是公开")]
        public int? IsPublic
        {
            get
            {
                return this._IsPublic;
            }
            set
            {
                this._IsPublic = value;
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
        private int? _AllowEdit = null;
        /// <summary>
        /// 允许编辑
        /// </summary>
        /// <returns></returns>
        [Description("允许编辑")]
        public int? AllowEdit
        {
            get
            {
                return this._AllowEdit;
            }
            set
            {
                this._AllowEdit = value;
            }
        }
        private int? _AllowDelete = null;
        /// <summary>
        /// 允许删除
        /// </summary>
        /// <returns></returns>
        [Description("允许删除")]
        public int? AllowDelete
        {
            get
            {
                return this._AllowDelete;
            }
            set
            {
                this._AllowDelete = value;
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