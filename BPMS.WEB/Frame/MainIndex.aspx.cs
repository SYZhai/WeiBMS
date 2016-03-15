using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.Frame
{
    public partial class MainIndex : System.Web.UI.Page
    {
        public string UserInfo, DepartmentName, _USERCOUNT = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Session.Abandon();  //取消当前会话
                Session.Clear();
                Response.Redirect("/Index.htm");
            }
            UserInfo = RequestSession.GetSessionUser().UserName + "[" + RequestSession.GetSessionUser().Code + "]";
            DepartmentName = RequestSession.GetSessionUser().DepartmentName;
            _USERCOUNT = Application["CurrentUsers"].ToString();
        }
    }
}