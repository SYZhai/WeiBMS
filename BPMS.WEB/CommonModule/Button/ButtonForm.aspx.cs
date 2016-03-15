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

namespace BPMS.WEB.CommonModule.Button
{
    public partial class ButtonForm : System.Web.UI.Page
    {
        BPMS_ButtonIBLL bpms_buttonibll = new BPMS_ButtonBLL();
        BPMS_Button bpms_button = new BPMS_Button();
        string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            if (!IsPostBack)
            {
                SortCode.Value = bpms_buttonibll.GetMaxCode().ToString();
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
                bpms_button = bpms_buttonibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_button);
                if (bpms_button.Img != "")
                {
                    Img_Menu_Img.Src = "/Themes/Images/16/" + bpms_button.Img;
                }
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
            bpms_button = ControlBindHelper.GetWebControls<BPMS_Button>(this.Page);
            bpms_button.Enabled = Enabled.Checked ? 1 : 0;
            bpms_button.Split = Split.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_button.ButtonId = _key;
                bpms_button.ModifyDate = DateTime.Now;
                bpms_button.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_button.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_buttonibll.Update(bpms_button);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_button.ButtonId = CommonHelper.GetGuid;
                bpms_button.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_button.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_buttonibll.Insert(bpms_button);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}