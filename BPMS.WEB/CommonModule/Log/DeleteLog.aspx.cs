using BPMS.Business;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Log
{
    public partial class DeleteLog : System.Web.UI.Page
    {
        BPMS_SysLogIBLL bpms_syslogsibll = new BPMS_SysLogBLL();
        public string _Type;
        protected void Page_Load(object sender, EventArgs e)
        {
            _Type = Request["type"];//1:登录日志，2：操作日志
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            bool IsOk = false;
            if (_Type == "2")
            {
                IsOk = bpms_syslogsibll.EmptyLog(KeepTime.Value);//清空操作日志
            }
            else
            {
                IsOk = bpms_syslogsibll.EmptyLoginLog(KeepTime.Value);//清空登录日志
            }
            if (IsOk)
                ShowMsgHelper.AlertCallback(MessageHelper.MSG0029);
            else
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}