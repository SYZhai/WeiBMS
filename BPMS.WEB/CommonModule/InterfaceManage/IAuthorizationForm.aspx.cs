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

namespace BPMS.WEB.CommonModule.InterfaceManage
{
    public partial class IAuthorizationForm : System.Web.UI.Page
    {
        BPMS_InterfaceAccessIBLL bpms_interfaceaccessibll = new BPMS_InterfaceAccessBLL();
        BPMS_InterfaceAccess bpms_interfaceaccess = new BPMS_InterfaceAccess();
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
                bpms_interfaceaccess = bpms_interfaceaccessibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_interfaceaccess);
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
            bpms_interfaceaccess = ControlBindHelper.GetWebControls<BPMS_InterfaceAccess>(this.Page);
            bpms_interfaceaccess.Enabled = Enabled.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_interfaceaccess.IAccessId = _key;
                bpms_interfaceaccess.ModifyDate = DateTime.Now;
                bpms_interfaceaccess.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_interfaceaccess.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_interfaceaccessibll.Update(bpms_interfaceaccess);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_interfaceaccess.IAccessId = CommonHelper.GetGuid;
                bpms_interfaceaccess.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_interfaceaccess.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_interfaceaccessibll.Insert(bpms_interfaceaccess);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}