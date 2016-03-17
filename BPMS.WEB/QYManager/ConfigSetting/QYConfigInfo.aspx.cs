using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.QYManager.ConfigSetting
{
    public partial class QYConfigInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                QYName.Value = ConfigHelper.GetValue("QYName");
                QYCorpId.Value = ConfigHelper.GetValue("corpId");
                QYCorpSecret.Value = ConfigHelper.GetValue("corpSecret");
            }
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                ConfigHelper.SetValue("QYName", QYName.Value);
                ConfigHelper.SetValue("corpId", QYCorpId.Value);
                ConfigHelper.SetValue("corpSecret", QYCorpSecret.Value);
                ShowMsgHelper.AlertCallback(MessageHelper.MSG0007);
            }
            catch (Exception ex)
            {
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
            }
            
        }
    }
}