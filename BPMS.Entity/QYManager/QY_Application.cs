//=====================================================================================
// All Rights Reserved , Copyright © HaWoDe 2016
//=====================================================================================

using DotNet.Kernel;
using System;
using System.ComponentModel;
using System.Text;

namespace BPMS.Entity
{
    /// <summary>
    /// 企业号应用
    /// <author>
    ///		<name>SYZhai</name>
    ///		<date>2016.03.22</date>
    /// </author>
    /// </summary>
    [Description("企业号应用")]
    [Key("appId")]
    public class QY_Application
    {
        private int? _appId = null;
        /// <summary>
        /// 应用ID
        /// </summary>
        /// <returns></returns>
        [Description("应用ID")]
        public int? appId
        {
            get
            {
                return this._appId;
            }
            set
            {
                this._appId = value;
            }
        }
        private string _appName = null;
        /// <summary>
        /// 应用名称
        /// </summary>
        /// <returns></returns>
        [Description("应用名称")]
        public string appName
        {
            get
            {
                return this._appName;
            }
            set
            {
                this._appName = value;
            }
        }
        private string _appDescription = null;
        /// <summary>
        /// 应用描述
        /// </summary>
        /// <returns></returns>
        [Description("应用描述")]
        public string appDescription
        {
            get
            {
                return this._appDescription;
            }
            set
            {
                this._appDescription = value;
            }
        }
        private string _appManager = null;
        /// <summary>
        /// 应用管理组
        /// </summary>
        /// <returns></returns>
        [Description("应用管理组")]
        public string appManager
        {
            get
            {
                return this._appManager;
            }
            set
            {
                this._appManager = value;
            }
        }
        private string _appDepartment = null;
        /// <summary>
        /// 应用可见范围
        /// </summary>
        /// <returns></returns>
        [Description("应用可见范围")]
        public string appDepartment
        {
            get
            {
                return this._appDepartment;
            }
            set
            {
                this._appDepartment = value;
            }
        }
        private string _appUrl = null;
        /// <summary>
        /// 接口Url
        /// </summary>
        /// <returns></returns>
        [Description("接口Url")]
        public string appUrl
        {
            get
            {
                return this._appUrl;
            }
            set
            {
                this._appUrl = value;
            }
        }
        private string _appToken = null;
        /// <summary>
        /// 应用Token
        /// </summary>
        /// <returns></returns>
        [Description("应用Token")]
        public string appToken
        {
            get
            {
                return this._appToken;
            }
            set
            {
                this._appToken = value;
            }
        }
        private string _appEncodingAESKey = null;
        /// <summary>
        /// EncodingAESKey
        /// </summary>
        /// <returns></returns>
        [Description("EncodingAESKey")]
        public string appEncodingAESKey
        {
            get
            {
                return this._appEncodingAESKey;
            }
            set
            {
                this._appEncodingAESKey = value;
            }
        }
        private int? _Enabled = null;
        /// <summary>
        /// 是否可用
        /// </summary>
        /// <returns></returns>
        [Description("是否可用")]
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
        private DateTime? _CreateDate = null;
        /// <summary>
        /// 创建日期
        /// </summary>
        /// <returns></returns>
        [Description("创建日期")]
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
        /// 修改日期
        /// </summary>
        /// <returns></returns>
        [Description("修改日期")]
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
        private string _remark = null;
        /// <summary>
        /// 备注
        /// </summary>
        /// <returns></returns>
        [Description("备注")]
        public string remark
        {
            get
            {
                return this._remark;
            }
            set
            {
                this._remark = value;
            }
        }
    }
}