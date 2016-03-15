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
    /// 组织机构、部门
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("组织机构、部门")]
    [Key("OrganizationId")]
    public class BPMS_Organization
    {
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
        private string _ShortName = null;
        /// <summary>
        /// 简称
        /// </summary>
        /// <returns></returns>
        [Description("简称")]
        public string ShortName
        {
            get
            {
                return this._ShortName;
            }
            set
            {
                this._ShortName = value;
            }
        }
        private string _FullName = null;
        /// <summary>
        /// 名称
        /// </summary>
        /// <returns></returns>
        [Description("名称")]
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
        private int? _IsInnerOrganize = null;
        /// <summary>
        /// 内部组织
        /// </summary>
        /// <returns></returns>
        [Description("内部组织")]
        public int? IsInnerOrganize
        {
            get
            {
                return this._IsInnerOrganize;
            }
            set
            {
                this._IsInnerOrganize = value;
            }
        }
        private string _Manager = null;
        /// <summary>
        /// 主负责人
        /// </summary>
        /// <returns></returns>
        [Description("主负责人")]
        public string Manager
        {
            get
            {
                return this._Manager;
            }
            set
            {
                this._Manager = value;
            }
        }
        private string _AssistantManager = null;
        /// <summary>
        /// 副负责人
        /// </summary>
        /// <returns></returns>
        [Description("副负责人")]
        public string AssistantManager
        {
            get
            {
                return this._AssistantManager;
            }
            set
            {
                this._AssistantManager = value;
            }
        }
        private string _OuterPhone = null;
        /// <summary>
        /// 电话
        /// </summary>
        /// <returns></returns>
        [Description("电话")]
        public string OuterPhone
        {
            get
            {
                return this._OuterPhone;
            }
            set
            {
                this._OuterPhone = value;
            }
        }
        private string _InnerPhone = null;
        /// <summary>
        /// 内线
        /// </summary>
        /// <returns></returns>
        [Description("内线")]
        public string InnerPhone
        {
            get
            {
                return this._InnerPhone;
            }
            set
            {
                this._InnerPhone = value;
            }
        }
        private string _Fax = null;
        /// <summary>
        /// 传真
        /// </summary>
        /// <returns></returns>
        [Description("传真")]
        public string Fax
        {
            get
            {
                return this._Fax;
            }
            set
            {
                this._Fax = value;
            }
        }
        private string _Postalcode = null;
        /// <summary>
        /// 邮编
        /// </summary>
        /// <returns></returns>
        [Description("邮编")]
        public string Postalcode
        {
            get
            {
                return this._Postalcode;
            }
            set
            {
                this._Postalcode = value;
            }
        }
        private string _Address = null;
        /// <summary>
        /// 地址
        /// </summary>
        /// <returns></returns>
        [Description("地址")]
        public string Address
        {
            get
            {
                return this._Address;
            }
            set
            {
                this._Address = value;
            }
        }
        private string _Web = null;
        /// <summary>
        /// 网址
        /// </summary>
        /// <returns></returns>
        [Description("网址")]
        public string Web
        {
            get
            {
                return this._Web;
            }
            set
            {
                this._Web = value;
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