using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Controlpanel
{
    public partial class ControlpanelIndex : System.Web.UI.Page
    {
        public string UserId,Account;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserId = RequestSession.GetSessionUser().UserId;
            Account = RequestSession.GetSessionUser().Account.ToString();
        }
    }
}