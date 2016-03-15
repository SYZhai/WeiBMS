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
    /// 新闻表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.28</date>
    /// </author>
    /// </summary>
    [Description("新闻表")]
    [Key("NewsId")]
    public class BASE_News
    {
        private string _NewsId = null;
        /// <summary>
        /// 新闻表主键
        /// </summary>
        /// <returns></returns>
        [Description("新闻表主键")]
        public string NewsId
        {
            get
            {
                return this._NewsId;
            }
            set
            {
                this._NewsId = value;
            }
        }
        private string _Introduction = null;
        /// <summary>
        /// 内容简介
        /// </summary>
        /// <returns></returns>
        [Description("内容简介")]
        public string Introduction
        {
            get
            {
                return this._Introduction;
            }
            set
            {
                this._Introduction = value;
            }
        }
        private string _Contents = null;
        /// <summary>
        /// 文章内容
        /// </summary>
        /// <returns></returns>
        [Description("文章内容")]
        public string Contents
        {
            get
            {
                return this._Contents;
            }
            set
            {
                this._Contents = value;
            }
        }
        private string _Keywords = null;
        /// <summary>
        /// 关键字
        /// </summary>
        /// <returns></returns>
        [Description("关键字")]
        public string Keywords
        {
            get
            {
                return this._Keywords;
            }
            set
            {
                this._Keywords = value;
            }
        }
        private string _AuditStatus = null;
        /// <summary>
        /// 审核状态
        /// </summary>
        /// <returns></returns>
        [Description("审核状态")]
        public string AuditStatus
        {
            get
            {
                return this._AuditStatus;
            }
            set
            {
                this._AuditStatus = value;
            }
        }
        private int? _ReadCount = null;
        /// <summary>
        /// 被阅读次数
        /// </summary>
        /// <returns></returns>
        [Description("被阅读次数")]
        public int? ReadCount
        {
            get
            {
                return this._ReadCount;
            }
            set
            {
                this._ReadCount = value;
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