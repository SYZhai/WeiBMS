using BPMS.Entity;
using BPMS.Business;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.QYManager
{
    public partial class QY_ApplicationForm : System.Web.UI.Page
    {
        QY_ApplicationIBLL qy_applicationibll = new QY_ApplicationBLL();
        QY_Application qy_application = new QY_Application();
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
                qy_application = qy_applicationibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, qy_application);
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
            qy_application = ControlBindHelper.GetWebControls<QY_Application>(this.Page);
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                qy_application.appId =Convert.ToInt32(_key);
                qy_application.ModifyDate = DateTime.Now;
                qy_application.ModifyUserId = RequestSession.GetSessionUser().UserId.ToString();
                qy_application.ModifyUserName = RequestSession.GetSessionUser().UserName.ToString();
                IsOk = qy_applicationibll.Update(qy_application);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                qy_application.appId =Convert.ToInt32(CommonHelper.GetGuid);
                qy_application.CreateUserId = RequestSession.GetSessionUser().UserId.ToString();
                qy_application.CreateUserName = RequestSession.GetSessionUser().UserName.ToString();
                IsOk = qy_applicationibll.Insert(qy_application);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}