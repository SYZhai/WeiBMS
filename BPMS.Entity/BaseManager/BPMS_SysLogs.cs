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
    /// 系统操作日志
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("系统操作日志")]
    [Key("SyslogsId")]
    public class BPMS_SysLogs
    {
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
        private int? _OperationType = null;
        /// <summary>
        /// 操作类型
        /// </summary>
        /// <returns></returns>
        [Description("操作类型")]
        public int? OperationType
        {
            get
            {
                return this._OperationType;
            }
            set
            {
                this._OperationType = value;
            }
        }
        private string _TableName = null;
        /// <summary>
        /// 数据库表
        /// </summary>
        /// <returns></returns>
        [Description("数据库表")]
        public string TableName
        {
            get
            {
                return this._TableName;
            }
            set
            {
                this._TableName = value;
            }
        }
        private string _BusinessName = null;
        /// <summary>
        /// 业务名称
        /// </summary>
        /// <returns></returns>
        [Description("业务名称")]
        public string BusinessName
        {
            get
            {
                return this._BusinessName;
            }
            set
            {
                this._BusinessName = value;
            }
        }
        private string _Object_ID = null;
        /// <summary>
        /// 对象主键
        /// </summary>
        /// <returns></returns>
        [Description("对象主键")]
        public string Object_ID
        {
            get
            {
                return this._Object_ID;
            }
            set
            {
                this._Object_ID = value;
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
        private string _Result = null;
        /// <summary>
        /// 结果
        /// </summary>
        /// <returns>操作业务把结果记录起来</returns>
        [Description("结果")]
        public string Result
        {
            get
            {
                return this._Result;
            }
            set
            {
                this._Result = value;
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
    }
}