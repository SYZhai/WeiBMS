using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.ExampleModule.POOrder
{
    public partial class POOrderForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BillDate.Value = DateTime.Now.ToString("yyyy-MM-dd") + " 00:00:00";
                CreateUserName.Value = RequestSession.GetSessionUser().UserName;
            }
        }
    }
}