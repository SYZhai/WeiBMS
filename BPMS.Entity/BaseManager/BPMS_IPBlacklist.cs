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
    /// IP黑名单
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.31</date>
    /// </author>
    /// </summary>
    [Description("IP访问管理")]
    [Key("IPBlacklistId")]
    public class BPMS_IPBlacklist
    {
        private string _IPBlacklistId = null;
        /// <summary>
        /// IP黑名单主键
        /// </summary>
        /// <returns></returns>
        [Description("IP主键")]
        public string IPBlacklistId
        {
            get
            {
                return this._IPBlacklistId;
            }
            set
            {
                this._IPBlacklistId = value;
            }
        }
        private string _Category = null;
        /// <summary>
        /// 规则类型
        /// </summary>
        /// <returns></returns>
        [Description("规则类型")]
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
        private string _StartIp = null;
        /// <summary>
        /// 起始IP
        /// </summary>
        /// <returns></returns>
        [Description("起始IP")]
        public string StartIp
        {
            get
            {
                return this._StartIp;
            }
            set
            {
                this._StartIp = value;
            }
        }
        private string _EndIp = null;
        /// <summary>
        /// 结束IP
        /// </summary>
        /// <returns></returns>
        [Description("结束IP")]
        public string EndIp
        {
            get
            {
                return this._EndIp;
            }
            set
            {
                this._EndIp = value;
            }
        }
        private DateTime? _Failuretime = null;
        /// <summary>
        /// 失效时间
        /// </summary>
        /// <returns></returns>
        [Description("失效时间")]
        public DateTime? Failuretime
        {
            get
            {
                return this._Failuretime;
            }
            set
            {
                this._Failuretime = value;
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