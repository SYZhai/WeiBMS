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
    /// 登录系统日志
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("登录系统日志")]
    [Key("SysLoginLogId")]
    public class BPMS_SysLoginLog
    {
        private string _SysLoginLogId = null;
        /// <summary>
        /// 登录系统日志主键
        /// </summary>
        /// <returns></returns>
        [Description("登录系统日志主键")]
        public string SysLoginLogId
        {
            get
            {
                return this._SysLoginLogId;
            }
            set
            {
                this._SysLoginLogId = value;
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
        private string _Account = null;
        /// <summary>
        /// 登录账户
        /// </summary>
        /// <returns></returns>
        [Description("登录账户")]
        public string Account
        {
            get
            {
                return this._Account;
            }
            set
            {
                this._Account = value;
            }
        }
        private string _Status = null;
        /// <summary>
        /// 登录状态
        /// </summary>
        /// <returns></returns>
        [Description("登录状态")]
        public string Status
        {
            get
            {
                return this._Status;
            }
            set
            {
                this._Status = value;
            }
        }
        private string _IPAddress = null;
        /// <summary>
        /// 登录IP地址
        /// </summary>
        /// <returns></returns>
        [Description("登录IP地址")]
        public string IPAddress
        {
            get
            {
                return this._IPAddress;
            }
            set
            {
                this._IPAddress = value;
            }
        }
        private string _IPAddressName = null;
        /// <summary>
        /// IP地址所在地址
        /// </summary>
        /// <returns></returns>
        [Description("IP地址所在地址")]
        public string IPAddressName
        {
            get
            {
                return this._IPAddressName;
            }
            set
            {
                this._IPAddressName = value;
            }
        }
    }
}