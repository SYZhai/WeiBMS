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
    /// 系统异常
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("系统异常")]
    [Key("ExceptionId")]
    public class BPMS_Exception
    {
        private string _ExceptionId = null;
        /// <summary>
        /// 系统异常主键
        /// </summary>
        /// <returns></returns>
        [Description("系统异常主键")]
        public string ExceptionId
        {
            get
            {
                return this._ExceptionId;
            }
            set
            {
                this._ExceptionId = value;
            }
        }
        private string _Source = null;
        /// <summary>
        /// 异常信息来源
        /// </summary>
        /// <returns></returns>
        [Description("异常信息来源")]
        public string Source
        {
            get
            {
                return this._Source;
            }
            set
            {
                this._Source = value;
            }
        }
        private string _Exception = null;
        /// <summary>
        /// 异常信息
        /// </summary>
        /// <returns></returns>
        [Description("异常信息")]
        public string Exception
        {
            get
            {
                return this._Exception;
            }
            set
            {
                this._Exception = value;
            }
        }
        private string _Description = null;
        /// <summary>
        /// 异常信息描述
        /// </summary>
        /// <returns></returns>
        [Description("异常信息描述")]
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
        private string _OperationIp = null;
        /// <summary>
        /// 操作IP
        /// </summary>
        /// <returns></returns>
        [Description("操作IP")]
        public string OperationIp
        {
            get
            {
                return this._OperationIp;
            }
            set
            {
                this._OperationIp = value;
            }
        }
        private string _OperationIpCity = null;
        /// <summary>
        /// 操作IP所在城市
        /// </summary>
        /// <returns></returns>
        [Description("操作IP所在城市")]
        public string OperationIpCity
        {
            get
            {
                return this._OperationIpCity;
            }
            set
            {
                this._OperationIpCity = value;
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
    }
}