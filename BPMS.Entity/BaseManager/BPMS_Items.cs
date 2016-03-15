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
    /// 数据字典主表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("辅助资料管理")]
    [Key("ItemsId")]
    public class BPMS_Items
    {
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
        private int? _IsTree = null;
        /// <summary>
        /// 树型结构
        /// </summary>
        /// <returns></returns>
        [Description("树型结构")]
        public int? IsTree
        {
            get
            {
                return this._IsTree;
            }
            set
            {
                this._IsTree = value;
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