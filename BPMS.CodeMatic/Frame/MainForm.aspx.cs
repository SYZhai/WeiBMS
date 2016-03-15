using BPMS.CodeMatic.Code;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TryClothes.Web.Frame
{
    public partial class MainForm : System.Web.UI.Page
    {
        DataBase_Dal database_dal = new DataBase_Dal();
        public StringBuilder strHtml = new StringBuilder();
        public object connectstring = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            connectstring = Session["connectstring"];
            if (connectstring != null)
            {
                InitDBInfo();
            }
            else
            {
                ShowMsgHelper.ShowScript("LoginForm()");
            }
        }
        /// <summary>
        /// 加载数据库信息
        /// </summary>
        public void InitDBInfo()
        {
            DataTable dt = database_dal.InitDBName(connectstring.ToString());
            if (DataTableHelper.IsExistRows(dt))
            {
                strHtml.Append("<ul class=\"black strTree\">");
                strHtml.Append("<li>");
                strHtml.Append("<div><img src=\"../Themes/Images/folder-closed.gif\" />数据库</div>");
                strHtml.Append("<ul>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    strHtml.Append("<li>");
                    strHtml.Append("<div><img src=\"../Themes/Images/db.png\" />" + dt.Rows[i]["name"].ToString() + "</div>");
                    strHtml.Append("<ul style='display: none;'>");
                    strHtml.Append("<li>");
                    strHtml.Append("<div><img src=\"../Themes/Images/folder-closed.gif\" />表</div>");
                    strHtml.Append(InitTableInfo(dt.Rows[i]["name"].ToString()));
                    strHtml.Append("</li>");
                    strHtml.Append("</ul>");
                    strHtml.Append("</li>");
                }
                strHtml.Append("</ul>");
                strHtml.Append("</li>");
                strHtml.Append("</ul>");
            }
        }
        /// <summary>
        /// 加载数据表
        /// </summary>
        /// <param name="DB">数据库名称</param>
        /// <returns></returns>
        public string InitTableInfo(string DB)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            string DBServerName = Session["DBServerName"].ToString();
            string DBLoginName = Session["DBLoginName"].ToString();
            string Password = Session["DBPassword"].ToString();
            DataTable dt = database_dal.InitDBName(DB, DBServerName, DBLoginName, Password);
            sb_TreeNode.Append("<ul style='display: none;' class='ulcontextmenu'>");
            DataView dv = new DataView(dt);
            dv.RowFilter = "ParentId = '0'";
            if (dv.Count > 0)
            {
                foreach (DataRowView drv in dv)
                {
                    sb_TreeNode.Append("<li>");
                    sb_TreeNode.Append("<div><img src=\"../Themes/Images/06.gif\" /><span database='" + DB + "' tableRemark='" + drv["Remark"].ToString() + "'>" + drv["Field"].ToString() + "</span></div>");
                    sb_TreeNode.Append(InitFieldInfo(drv["ID"].ToString(), dt));
                    sb_TreeNode.Append("</li>");
                }
            }
            sb_TreeNode.Append("</ul>");
            return sb_TreeNode.ToString();
        }
        /// <summary>
        /// 加载数据库表字段
        /// </summary>
        /// <param name="TableCode">表名</param>
        /// <param name="dt">表字段</param>
        /// <returns></returns>
        public string InitFieldInfo(string TableCode, DataTable dt)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            DataView dv = new DataView(dt);
            dv.RowFilter = "ParentId = '" + TableCode + "'";
            if (dv.Count > 0)
            {
                sb_TreeNode.Append("<ul style='display: none;'>");
                sb_TreeNode.Append("<li>");
                sb_TreeNode.Append("<div><img src=\"../Themes/Images/folder-closed.gif\" />列</div>");
                sb_TreeNode.Append("<ul style='display: none;'>");
                foreach (DataRowView drv in dv)
                {
                    sb_TreeNode.Append("<li>");
                    sb_TreeNode.Append("<div><img src=\"../Themes/Images/06.gif\" />" + drv["Field"].ToString() + "</div>");
                    sb_TreeNode.Append("</li>");
                }
                sb_TreeNode.Append("</ul>");
                sb_TreeNode.Append("</li>");
                sb_TreeNode.Append("</ul>");
            }
            return sb_TreeNode.ToString();
        }
    }
}