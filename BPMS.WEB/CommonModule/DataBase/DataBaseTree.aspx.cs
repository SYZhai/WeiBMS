using BPMS.Business;
using BPMS.IBusiness;
using DotNet.Kernel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.DataBase
{
    public partial class DataBaseTree : System.Web.UI.Page
    {
        public StringBuilder strHtml = new StringBuilder();
        BPMS_DataBaseIBLL bpms_databaseibll = new BPMS_DataBaseBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitTableInfo();
            }
        }
        /// <summary>
        /// 加载数据表
        /// </summary>
        /// <param name="DB">数据库名称</param>
        /// <returns></returns>
        public void InitTableInfo()
        {
            DataTable dt = bpms_databaseibll.InitDBName(ConfigHelper.GetValue("DBName"));
            DataView dv = new DataView(dt);
            int index = 0;
            string strclass = "";
            if (dv.Count > 0)
            {
                foreach (DataRowView drv in dv)
                {
                    if (index == 0)
                        strclass = "collapsableselected";
                    else
                        strclass = "";
                    strHtml.Append("<li>");
                    strHtml.Append("<div class='" + strclass + "'><img src=\"/Themes/Images/16/table.png\" /><span tableRemark='" + drv["Remark"].ToString() + "'>" + drv["Field"].ToString() + "</span></div>");
                    strHtml.Append("</li>");
                    index++;
                }
            }
        }
    }
}