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
    /// 文件表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.29</date>
    /// </author>
    /// </summary>
    [Description("文件表")]
    [Key("FileId")]
    public class BASE_File
    {
        private string _FileId = null;
        /// <summary>
        /// 文件表主键
        /// </summary>
        /// <returns></returns>
        [Description("文件表主键")]
        public string FileId
        {
            get
            {
                return this._FileId;
            }
            set
            {
                this._FileId = value;
            }
        }
        private string _ParentId = null;
        /// <summary>
        /// 父级主键
        /// </summary>
        /// <returns></returns>
        [Description("父级主键")]
        public string ParentId
        {
            get
            {
                return this._ParentId;
            }
            set
            {
                this._ParentId = value;
            }
        }
        private string _FileName = null;
        /// <summary>
        /// 文件名
        /// </summary>
        /// <returns></returns>
        [Description("文件名")]
        public string FileName
        {
            get
            {
                return this._FileName;
            }
            set
            {
                this._FileName = value;
            }
        }
        private string _FilePath = null;
        /// <summary>
        /// 文件位置
        /// </summary>
        /// <returns></returns>
        [Description("文件位置")]
        public string FilePath
        {
            get
            {
                return this._FilePath;
            }
            set
            {
                this._FilePath = value;
            }
        }
        private string _Introduction = null;
        /// <summary>
        /// 介绍
        /// </summary>
        /// <returns></returns>
        [Description("介绍")]
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
        private string _FileType = null;
        /// <summary>
        /// 文件类型
        /// </summary>
        /// <returns></returns>
        [Description("文件类型")]
        public string FileType
        {
            get
            {
                return this._FileType;
            }
            set
            {
                this._FileType = value;
            }
        }
        private string _FileSize = null;
        /// <summary>
        /// 文件大小
        /// </summary>
        /// <returns></returns>
        [Description("文件大小")]
        public string FileSize
        {
            get
            {
                return this._FileSize;
            }
            set
            {
                this._FileSize = value;
            }
        }
        private string _FileImg = null;
        /// <summary>
        /// 文件图标
        /// </summary>
        /// <returns></returns>
        [Description("文件图标")]
        public string FileImg
        {
            get
            {
                return this._FileImg;
            }
            set
            {
                this._FileImg = value;
            }
        }
        private string _Extensions = null;
        /// <summary>
        /// 后缀名
        /// </summary>
        /// <returns></returns>
        [Description("后缀名")]
        public string Extensions
        {
            get
            {
                return this._Extensions;
            }
            set
            {
                this._Extensions = value;
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