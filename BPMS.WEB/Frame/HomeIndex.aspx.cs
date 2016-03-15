using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.Frame
{
    public partial class HomeIndex : System.Web.UI.Page
    {
        public StringBuilder sbDate = new StringBuilder();
        public StringBuilder sbDateCount = new StringBuilder();
        BPMS_SysLogIBLL bpms_syslogsibll = new BPMS_SysLogBLL();
        public string strmonth;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetLoginLog();
            }
        }
        public void GetLoginLog()
        {
            DataTable dt = bpms_syslogsibll.GetHighchartLoginLog();
            GregorianCalendar gc = new GregorianCalendar();
            int year = int.Parse(DateTime.Now.ToString("yyyy"));
            int month = int.Parse(DateTime.Now.ToString("MM"));
            int days = gc.GetDaysInMonth(year, month);
            strmonth = month.ToString();
            sbDate.Append("[");
            sbDateCount.Append("[");
            for (int i = 1; i <= days; i++)
            {
                sbDate.Append(i + ",");
                DataTable newdt = DataTableHelper.GetNewDataTable(dt, "data = " + i + "");
                if (newdt != null && newdt.Rows.Count > 0)
                {
                    sbDateCount.Append(newdt.Rows[0]["count"] + ",");
                }
                else
                {
                    sbDateCount.Append(0 + ",");
                }
            }
            sbDate.Append("]");
            sbDateCount.Append("]");
        }
    }
}