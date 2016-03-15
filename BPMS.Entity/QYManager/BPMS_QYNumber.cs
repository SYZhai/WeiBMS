//=====================================================================================
// All Rights Reserved , Copyright © HaWoDe 2015
//=====================================================================================

using DotNet.Kernel;
using System;
using System.ComponentModel;
using System.Text;

namespace BPMS.Entity
{
    /// <summary>
    /// 企业号
    /// <author>
    ///		<name>zhaishuangyan</name>
    ///		<date>2015.11.10</date>
    /// </author>
    /// </summary>
    [Description("企业号")]
    [Key("QYId")]
    public class BPMS_QYNumber
    {
        private string _QYId = null;
        /// <summary>
        /// 企业号ID
        /// </summary>
        /// <returns></returns>
        [Description("企业号ID")]
        public string QYId
        {
            get
            {
                return this._QYId;
            }
            set
            {
                this._QYId = value;
            }
        }
        private string _QYName = null;
        /// <summary>
        /// 企业号名称
        /// </summary>
        /// <returns></returns>
        [Description("企业号名称")]
        public string QYName
        {
            get
            {
                return this._QYName;
            }
            set
            {
                this._QYName = value;
            }
        }
        private string _QYDescription = null;
        /// <summary>
        /// 企业号描述
        /// </summary>
        /// <returns></returns>
        [Description("企业号描述")]
        public string QYDescription
        {
            get
            {
                return this._QYDescription;
            }
            set
            {
                this._QYDescription = value;
            }
        }
        private string _QYLogo = null;
        /// <summary>
        /// 企业号logo
        /// </summary>
        /// <returns></returns>
        [Description("企业号logo")]
        public string QYLogo
        {
            get
            {
                return this._QYLogo;
            }
            set
            {
                this._QYLogo = value;
            }
        }
        private string _QYEwm = null;
        /// <summary>
        /// 企业号二维码
        /// </summary>
        /// <returns></returns>
        [Description("企业号二维码")]
        public string QYEwm
        {
            get
            {
                return this._QYEwm;
            }
            set
            {
                this._QYEwm = value;
            }
        }
        private string _CorpID = null;
        /// <summary>
        /// CorpID
        /// </summary>
        /// <returns></returns>
        [Description("CorpID")]
        public string CorpID
        {
            get
            {
                return this._CorpID;
            }
            set
            {
                this._CorpID = value;
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
        /// SortCode
        /// </summary>
        /// <returns></returns>
        [Description("SortCode")]
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
        /// 创建用户id
        /// </summary>
        /// <returns></returns>
        [Description("创建用户id")]
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
        /// 创建用户名称
        /// </summary>
        /// <returns></returns>
        [Description("创建用户名称")]
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