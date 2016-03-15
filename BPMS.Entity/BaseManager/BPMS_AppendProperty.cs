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
    /// 附加属性信息
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("附加属性信息")]
    [Key("PropertyId")]
    public class BPMS_AppendProperty
    {
        private string _PropertyId = null;
        /// <summary>
        /// 附加属性信息主键
        /// </summary>
        /// <returns></returns>
        [Description("附加属性信息主键")]
        public string PropertyId
        {
            get
            {
                return this._PropertyId;
            }
            set
            {
                this._PropertyId = value;
            }
        }
        private string _ParentId = null;
        /// <summary>
        /// 父级主键
        /// </summary>
        /// <returns></returns>
        [Description("父级主键")]
        public string ParentId
        {
            get
            {
                return this._ParentId;
            }
            set
            {
                this._ParentId = value;
            }
        }
        private string _FullName = null;
        /// <summary>
        /// 属性名称
        /// </summary>
        /// <returns></returns>
        [Description("属性名称")]
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
        private string _Control_Id = null;
        /// <summary>
        /// 控件ID
        /// </summary>
        /// <returns></returns>
        [Description("控件ID")]
        public string Control_Id
        {
            get
            {
                return this._Control_Id;
            }
            set
            {
                this._Control_Id = value;
            }
        }
        private int? _Type = null;
        /// <summary>
        /// 控件类型
        /// </summary>
        /// <returns></returns>
        [Description("控件类型")]
        public int? Type
        {
            get
            {
                return this._Type;
            }
            set
            {
                this._Type = value;
            }
        }
        private int? _DataSourceType = null;
        /// <summary>
        /// 控件数据源类型
        /// </summary>
        /// <returns></returns>
        [Description("控件数据源类型")]
        public int? DataSourceType
        {
            get
            {
                return this._DataSourceType;
            }
            set
            {
                this._DataSourceType = value;
            }
        }
        private string _DataSource = null;
        /// <summary>
        /// 控件数据源
        /// </summary>
        /// <returns></returns>
        [Description("控件数据源")]
        public string DataSource
        {
            get
            {
                return this._DataSource;
            }
            set
            {
                this._DataSource = value;
            }
        }
        private string _Length = null;
        /// <summary>
        /// 控件长度
        /// </summary>
        /// <returns></returns>
        [Description("控件长度")]
        public string Length
        {
            get
            {
                return this._Length;
            }
            set
            {
                this._Length = value;
            }
        }
        private string _Height = null;
        /// <summary>
        /// 控件高度
        /// </summary>
        /// <returns></returns>
        [Description("控件高度")]
        public string Height
        {
            get
            {
                return this._Height;
            }
            set
            {
                this._Height = value;
            }
        }
        private string _Style = null;
        /// <summary>
        /// 控件样式
        /// </summary>
        /// <returns></returns>
        [Description("控件样式")]
        public string Style
        {
            get
            {
                return this._Style;
            }
            set
            {
                this._Style = value;
            }
        }
        private string _Validator = null;
        /// <summary>
        /// 验证控件
        /// </summary>
        /// <returns></returns>
        [Description("验证控件")]
        public string Validator
        {
            get
            {
                return this._Validator;
            }
            set
            {
                this._Validator = value;
            }
        }
        private int? _Showlength = null;
        /// <summary>
        /// 最大显示长度
        /// </summary>
        /// <returns></returns>
        [Description("最大显示长度")]
        public int? Showlength
        {
            get
            {
                return this._Showlength;
            }
            set
            {
                this._Showlength = value;
            }
        }
        private string _Defaults = null;
        /// <summary>
        /// 默认值
        /// </summary>
        /// <returns></returns>
        [Description("默认值")]
        public string Defaults
        {
            get
            {
                return this._Defaults;
            }
            set
            {
                this._Defaults = value;
            }
        }
        private string _Custom = null;
        /// <summary>
        /// 自定义属性
        /// </summary>
        /// <returns></returns>
        [Description("自定义属性")]
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
        private string _Event = null;
        /// <summary>
        /// 事件
        /// </summary>
        /// <returns></returns>
        [Description("事件")]
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