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
    /// 数据字典明细表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("辅助资料明细管理")]
    [Key("ItemDetailsId")]
    public class BPMS_ItemDetails
    {
        private string _ItemDetailsId = null;
        /// <summary>
        /// 数据字典明细表主键
        /// </summary>
        /// <returns></returns>
        [Description("数据字典明细表主键")]
        public string ItemDetailsId
        {
            get
            {
                return this._ItemDetailsId;
            }
            set
            {
                this._ItemDetailsId = value;
            }
        }
        private string _ItemsId = null;
        /// <summary>
        /// 数据字典主表主键
        /// </summary>
        /// <returns></returns>
        [Description("数据字典主表主键")]
        public string ItemsId
        {
            get
            {
                return this._ItemsId;
            }
            set
            {
                this._ItemsId = value;
            }
        }
        private string _ParentId = null;
        /// <summary>
        /// 父节点主键
        /// </summary>
        /// <returns></returns>
        [Description("父节点主键")]
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
        private string _ItemName = null;
        /// <summary>
        /// 名称
        /// </summary>
        /// <returns></returns>
        [Description("名称")]
        public string ItemName
        {
            get
            {
                return this._ItemName;
            }
            set
            {
                this._ItemName = value;
            }
        }
        private string _ItemCode = null;
        /// <summary>
        /// 代码
        /// </summary>
        /// <returns></returns>
        [Description("代码")]
        public string ItemCode
        {
            get
            {
                return this._ItemCode;
            }
            set
            {
                this._ItemCode = value;
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