using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.User
{
    public partial class UpdateUserPwd : System.Web.UI.Page
    {

        BPMS_UserIBLL bpms_useribll = new BPMS_UserBLL();
        BPMS_User bpms_user = new BPMS_User();
        string _key, _Account;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //用户主键
            _Account = Server.UrlDecode(Request["Account"]);//用户账户
            if (!IsPostBack)
            {
                txtUserName.Value = _Account;
            }
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            string s = Session["dt_session_code"].ToString().ToLower();
            if (txtCode.Value.ToLower() != Session["dt_session_code"].ToString().ToLower())
            {
                txtCode.Focus();
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0026);
                return;
            }
            bool IsOk = false;
            if (_Account != "System" && _Account != "admin")
            {
                bpms_user = bpms_useribll.GetEntity(_key);
                string Password = DESEncrypt.Encrypt(txtUserPwd.Value, bpms_user.Secretkey);
                bpms_user.Password = Md5Helper.MD5(Password, 32);
                bpms_user.ModifyDate = DateTime.Now;
                bpms_user.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_user.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_useribll.Update(bpms_user);
                if (IsOk)
                {
                    if (Request["status"] == "1")
                    {
                        Session.Abandon();  //取消当前会话
                        Session.Clear();    //清除当前浏览器所以Session
                        Response.Write("<script>alert('登陆修改成功,请重新登陆');top.location.href='/Index.htm'</script>");
                    }
                    else
                    {
                        ShowMsgHelper.AlertCallback(MessageHelper.MSG0007);
                    }
                }
                else
                {
                    ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
                }
            }
            else
            {
                ShowMsgHelper.Alert_Error(_Account + "用户不能被修改。");
            }
        }
    }
}