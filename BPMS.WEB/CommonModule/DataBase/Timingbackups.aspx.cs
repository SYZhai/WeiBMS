using BPMS.Service;
using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.DataBase
{
    public partial class Timingbackups : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Enabled.Checked = ConfigHelper.GetValue("IsBackupsData").Equals("true");
                Time.Value = ConfigHelper.GetValue("BackupsDataTime");
            }
        }

        protected void Accept_Click(object sender, EventArgs e)
        {
            string IsBackupsData = Enabled.Checked.ToString().ToLower();
            string BackupsDataTime = Time.Value.ToString();
            ConfigHelper.SetValue("IsBackupsData", IsBackupsData);
            ConfigHelper.SetValue("BackupsDataTime", BackupsDataTime);
            //写入操作日志
            BPMS_SysLogDAL.Instance.AddTaskLog(RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName, "设置定时备份数据库", "设置定时备份数据库成功，自动启动时间：" + BackupsDataTime);
            ShowMsgHelper.AlertCallback(MessageHelper.MSG0007);
        }
    }
}