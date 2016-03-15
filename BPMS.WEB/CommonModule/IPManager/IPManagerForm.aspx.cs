using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.IPManager
{
    public partial class IPManagerForm : System.Web.UI.Page
    {
        BPMS_IPBlacklistIBLL bpms_ipblacklistibll = new BPMS_IPBlacklistBLL();
        BPMS_IPBlacklist bpms_ipblacklist = new BPMS_IPBlacklist();
        string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            if (!IsPostBack)
            {
                InitControl();
            }
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public void InitControl()
        {
            if (!string.IsNullOrEmpty(_key))
            {
                bpms_ipblacklist = bpms_ipblacklistibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_ipblacklist);
            }
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            bool IsOk = false;
            bpms_ipblacklist = ControlBindHelper.GetWebControls<BPMS_IPBlacklist>(this.Page);
            bpms_ipblacklist.Enabled = Enabled.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_ipblacklist.IPBlacklistId = _key;
                bpms_ipblacklist.ModifyDate = DateTime.Now;
                bpms_ipblacklist.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_ipblacklist.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_ipblacklistibll.Update(bpms_ipblacklist);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_ipblacklist.IPBlacklistId = CommonHelper.GetGuid;
                bpms_ipblacklist.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_ipblacklist.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_ipblacklistibll.Insert(bpms_ipblacklist);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}