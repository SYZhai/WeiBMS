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
    /// 动态接口配置
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.03</date>
    /// </author>
    /// </summary>
    [Description("动态接口配置")]
    [Key("InterfaceId")]
    public class BASE_InterfaceManage
    {
        private string _InterfaceId = null;
        /// <summary>
        /// 接口配置设置主键
        /// </summary>
        /// <returns></returns>
        [Description("接口配置设置主键")]
        public string InterfaceId
        {
            get
            {
                return this._InterfaceId;
            }
            set
            {
                this._InterfaceId = value;
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
        /// 接口名称
        /// </summary>
        /// <returns></returns>
        [Description("接口名称")]
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
        private string _Type = null;
        /// <summary>
        /// 动作类型
        /// </summary>
        /// <returns></returns>
        [Description("动作类型")]
        public string Type
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
        private string _PermissionConstraint = null;
        /// <summary>
        /// 约束达式
        /// </summary>
        /// <returns></returns>
        [Description("约束达式")]
        public string PermissionConstraint
        {
            get
            {
                return this._PermissionConstraint;
            }
            set
            {
                this._PermissionConstraint = value;
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
        private int? _SortCode = null;
        /// <summary>
        /// 排序码
        /// </summary>
        /// <returns></returns>
        [Description("排序码")]
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
        private string _ModifyDate = null;
        /// <summary>
        /// 修改时间
        /// </summary>
        /// <returns></returns>
        [Description("修改时间")]
        public string ModifyDate
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