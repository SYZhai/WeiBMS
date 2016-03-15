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
    /// 动态接口配置参数
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.03</date>
    /// </author>
    /// </summary>
    [Description("动态接口配置参数")]
    [Key("InterfaceDetailsId")]
    public class BASE_InterfaceManageDetails
    {
        private string _InterfaceDetailsId = null;
        /// <summary>
        /// 接口参数明细主键
        /// </summary>
        /// <returns></returns>
        [Description("接口参数明细主键")]
        public string InterfaceDetailsId
        {
            get
            {
                return this._InterfaceDetailsId;
            }
            set
            {
                this._InterfaceDetailsId = value;
            }
        }
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
        /// 参数代码
        /// </summary>
        /// <returns></returns>
        [Description("参数代码")]
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
        private string _Field = null;
        /// <summary>
        /// 参数字段
        /// </summary>
        /// <returns></returns>
        [Description("参数字段")]
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
        private string _FieldMemo = null;
        /// <summary>
        /// 参数说明
        /// </summary>
        /// <returns></returns>
        [Description("参数说明")]
        public string FieldMemo
        {
            get
            {
                return this._FieldMemo;
            }
            set
            {
                this._FieldMemo = value;
            }
        }
        private string _FieldType = null;
        /// <summary>
        /// 参数类型
        /// </summary>
        /// <returns></returns>
        [Description("参数类型")]
        public string FieldType
        {
            get
            {
                return this._FieldType;
            }
            set
            {
                this._FieldType = value;
            }
        }
        private int? _FieldMaxLength = null;
        /// <summary>
        /// 最大长度
        /// </summary>
        /// <returns></returns>
        [Description("最大长度")]
        public int? FieldMaxLength
        {
            get
            {
                return this._FieldMaxLength;
            }
            set
            {
                this._FieldMaxLength = value;
            }
        }
        private int? _FieldMinLength = null;
        /// <summary>
        /// 允许空：0-是，1-否
        /// </summary>
        /// <returns></returns>
        [Description("允许空：0-是，1-否")]
        public int? FieldMinLength
        {
            get
            {
                return this._FieldMinLength;
            }
            set
            {
                this._FieldMinLength = value;
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
    }
}