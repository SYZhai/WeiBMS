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
    /// 系统操作日志明细
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("系统操作日志明细")]
    [Key("SysLogDetailsId")]
    public class BPMS_SysLogDetails
    {
        private string _SysLogDetailsId = null;
        /// <summary>
        /// 操作日志明细主键
        /// </summary>
        /// <returns></returns>
        [Description("操作日志明细主键")]
        public string SysLogDetailsId
        {
            get
            {
                return this._SysLogDetailsId;
            }
            set
            {
                this._SysLogDetailsId = value;
            }
        }
        private string _SyslogsId = null;
        /// <summary>
        /// 操作日志主键
        /// </summary>
        /// <returns></returns>
        [Description("操作日志主键")]
        public string SyslogsId
        {
            get
            {
                return this._SyslogsId;
            }
            set
            {
                this._SyslogsId = value;
            }
        }
        private string _FieldName = null;
        /// <summary>
        /// 字段名称
        /// </summary>
        /// <returns></returns>
        [Description("字段名称")]
        public string FieldName
        {
            get
            {
                return this._FieldName;
            }
            set
            {
                this._FieldName = value;
            }
        }
        private string _FieldText = null;
        /// <summary>
        /// 字段值
        /// </summary>
        /// <returns></returns>
        [Description("字段值")]
        public string FieldText
        {
            get
            {
                return this._FieldText;
            }
            set
            {
                this._FieldText = value;
            }
        }
        private string _NewValue = null;
        /// <summary>
        /// 新值
        /// </summary>
        /// <returns></returns>
        [Description("新值")]
        public string NewValue
        {
            get
            {
                return this._NewValue;
            }
            set
            {
                this._NewValue = value;
            }
        }
        private string _OldValue = null;
        /// <summary>
        /// 旧值
        /// </summary>
        /// <returns></returns>
        [Description("旧值")]
        public string OldValue
        {
            get
            {
                return this._OldValue;
            }
            set
            {
                this._OldValue = value;
            }
        }
        private string _Remark = null;
        /// <summary>
        /// 备注
        /// </summary>
        /// <returns></returns>
        [Description("备注")]
        public string Remark
        {
            get
            {
                return this._Remark;
            }
            set
            {
                this._Remark = value;
            }
        }
    }
}