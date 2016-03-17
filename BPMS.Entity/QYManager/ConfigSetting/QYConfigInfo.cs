using DotNet.Kernel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace BPMS.Entity
{
    public class QYConfigInfo
    {
        /// <summary>
        /// 企业号
        /// <author>
        ///		<name>zhaishuangyan</name>
        ///		<date>2016.03.17</date>
        /// </author>
        /// </summary>
        [Description("企业号")]
        
        private string _QYName = null;
        /// <summary>
        /// 企业号ID
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
        private string _QYCorpId = null;
        /// <summary>
        /// 企业号名称
        /// </summary>
        /// <returns></returns>
        [Description("CorpId")]
        public string QYCorpId 
        {
            get
            {
                return this._QYCorpId;
            }
            set
            {
                this._QYCorpId = value;
            }
        }
        private string _QYSecret  = null;
        /// <summary>
        /// 企业号描述
        /// </summary>
        /// <returns></returns>
        [Description("Secret")]
        public string QYSecret 
        {
            get
            {
                return this._QYSecret;
            }
            set
            {
                this._QYSecret = value;
            }
        }
    }
}
