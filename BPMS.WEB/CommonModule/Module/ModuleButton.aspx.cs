using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Module
{
    public partial class ModuleButton : System.Web.UI.Page
    {
        public StringBuilder htmlButtontoolbar = new StringBuilder();
        public StringBuilder htmlButtonApplication = new StringBuilder();
        BPMS_SysMenuButtonIBLL bpms_sysmenubuttonibll = new BPMS_SysMenuButtonBLL();
        public string _Menu_Id, _MenuName, _MenuImg;
        protected void Page_Load(object sender, EventArgs e)
        {
            _Menu_Id = Request["Menu_Id"];//模块主键
            _MenuName = Server.UrlDecode(Request["Menu_Name"]);//模块名称
            _MenuImg = Request["Menu_Img"];//模块图标
            InitButton();
        }
        public void InitButton()
        {
            DataTable dt = bpms_sysmenubuttonibll.GetListWhere(_Menu_Id);
            if (DataTableHelper.IsExistRows(dt))
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string checkbuttonNo = "checkbuttonNo";
                    string triangleNo = "triangleNo";
                    if (CommonHelper.GetDateTime(dt.Rows[i]["IsExist"]) < DateTime.Now)
                    {
                        checkbuttonNo = "checkbuttonOk";
                        triangleNo = "triangleOk";
                    }
                    if (dt.Rows[i]["Category"].ToString() == "工具栏")
                    {
                        htmlButtontoolbar.Append("<div title=\"" + dt.Rows[i]["Description"] + "\" class=\"" + checkbuttonNo + " panelcheck\">");
                        htmlButtontoolbar.Append("<div id=\"" + dt.Rows[i]["ButtonId"] + "\" class=\"checktext\">");
                        htmlButtontoolbar.Append("<img src=\"../../Themes/Images/16/" + dt.Rows[i]["Img"] + "\" />" + dt.Rows[i]["FullName"] + "");
                        htmlButtontoolbar.Append("</div>");
                        htmlButtontoolbar.Append("<div class=\"" + triangleNo + "\"></div>");
                        htmlButtontoolbar.Append("</div>");

                    }
                    else if (dt.Rows[i]["Category"].ToString() == "右击菜单栏")
                    {
                        htmlButtonApplication.Append("<div title=\"" + dt.Rows[i]["Description"] + "\" class=\"" + checkbuttonNo + " panelcheck\">");
                        htmlButtonApplication.Append("<div id=\"" + dt.Rows[i]["ButtonId"] + "\" class=\"checktext\">");
                        htmlButtonApplication.Append("<img src=\"../../Themes/Images/16/" + dt.Rows[i]["Img"] + "\" />" + dt.Rows[i]["FullName"] + "");
                        htmlButtonApplication.Append("</div>");
                        htmlButtonApplication.Append("<div class=\"" + triangleNo + "\"></div>");
                        htmlButtonApplication.Append("</div>");
                    }
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
            string[] array = new string[0];
            if (!string.IsNullOrEmpty(hiddenButtonId.Value))
            {
                array = hiddenButtonId.Value.Split('≌');
            }
            bool IsOk = false;
            string CreateUserId = RequestSession.GetSessionUser().UserId;
            string CreateUserName = RequestSession.GetSessionUser().UserName;
            IsOk = bpms_sysmenubuttonibll.BatchAddMenuButton(array, _Menu_Id, CreateUserId, CreateUserName);
            if (IsOk)
            {
                ShowMsgHelper.AlertCallback(MessageHelper.MSG0007);
            }
            else
            {
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
            }
        }
    }
}