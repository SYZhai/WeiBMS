using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.UserPermission
{
    public partial class UserButtonPermission : System.Web.UI.Page
    {
        public StringBuilder sbModule = new StringBuilder();
        public StringBuilder sbButton = new StringBuilder();
        BPMS_UserMenuButtonIBLL bpms_usermenubuttonibll = new BPMS_UserMenuButtonBLL();
        BPMS_UserMenuIBLL bpms_usermenuibll = new BPMS_UserMenuBLL();
        string _UserId;
        protected void Page_Load(object sender, EventArgs e)
        {
            _UserId = Request["UserId"];//用户主键
            if (!IsPostBack)
            {
                GetMenuTreeList();
            }
        }
        /// <summary>
        /// 模块菜单树
        /// </summary>
        public void GetMenuTreeList()
        {
            DataTable dtButton = bpms_usermenubuttonibll.GetList(_UserId);

            DataTable list = bpms_usermenuibll.GetList(_UserId);
            DataView dv = new DataView(list);
            dv.RowFilter = " ParentId = '0'";
            foreach (DataRowView drv in dv)
            {
                if (!string.IsNullOrEmpty(drv["IsExist"].ToString()))
                {
                    sbModule.Append("<li>");
                    sbModule.Append("<div id='" + drv["MenuId"] + "'><img src='/Themes/images/32/" + drv["Img"] + "' style='width:18px; height:18px;vertical-align: middle;' alt=''/>" + drv["FullName"] + "</div>");
                    //创建子节点
                    sbModule.Append(GetTreeNode(drv["MenuId"].ToString(), list, dtButton));
                    NodeButton(dtButton, drv["MenuId"].ToString());
                    sbModule.Append("</li>");
                }
            }
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="parentID">父节点主键</param>
        /// <param name="list">菜单集合</param>
        /// <returns></returns>
        public string GetTreeNode(string ParentId, DataTable list, DataTable dtButton)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            DataView dv = new DataView(list);
            dv.RowFilter = "ParentId = '" + ParentId + "'";
            if (dv.Count > 0)
            {
                sb_TreeNode.Append("<ul>");
                foreach (DataRowView drv in dv)
                {
                    if (!string.IsNullOrEmpty(drv["IsExist"].ToString()))
                    {
                        sb_TreeNode.Append("<li>");
                        sb_TreeNode.Append("<div id='" + drv["MenuId"] + "'><img src='/Themes/images/32/" + drv["Img"] + "' style='width:18px; height:18px;vertical-align: middle;' alt=''/>" + drv["FullName"] + "</div>");
                        //创建子节点
                        sb_TreeNode.Append(GetTreeNode(drv["MenuId"].ToString(), list, dtButton));
                        NodeButton(dtButton, drv["MenuId"].ToString());
                        sb_TreeNode.Append("</li>");
                    }
                }
                sb_TreeNode.Append("</ul>");
            }
            return sb_TreeNode.ToString();
        }


        /// <summary>
        /// 加载模块菜单按钮
        /// </summary>
        /// <param name="dtButton">按钮集合</param>
        /// <param name="MenuId">模块主键</param>
        public void NodeButton(DataTable dtButton, string MenuId)
        {
            sbButton.Append("<div id='Module_" + MenuId + "' class='ModuleButton'  style='display:none;'>");
            DataView dv = new DataView(dtButton);
            dv.RowFilter = " MenuId = '" + MenuId + "'";
            if (dv.Count > 0)
            {
                sbButton.Append("<div class=\"bd\" style='border-left: 0px solid #ccc;border-right: 0px solid #ccc;border-bottom: 0px solid #ccc;'><div class=\"tipstitle_title settingtable bold bd todayInfoPanelTab rightPanelTitle_normal\">");
                sbButton.Append("<div style=\"position: absolute\">");
                sbButton.Append("<div id=\"tb_toolbar_" + MenuId + "\" class=\"tab_list bd actived\" onclick=\"$('#tb_Application_" + MenuId + "').removeClass('actived');;$(this).addClass('actived');$('#div_toolbar_" + MenuId + "').show();$('#div_Application" + MenuId + "').hide();\">工具栏</div>");
                sbButton.Append("<div id=\"tb_Application_" + MenuId + "\" class=\"tab_list bd\" onclick=\"$('#tb_toolbar_" + MenuId + "').removeClass('actived');$(this).addClass('actived');$('#div_Application" + MenuId + "').show();$('#div_toolbar_" + MenuId + "').hide();\">右击菜单栏</div>");
                sbButton.Append("</div>");
                sbButton.Append("</div>");
                sbButton.Append("<div class=\"ScrollBar\" style=\"padding: 5px;\">");
                StringBuilder sbtoolbar = new StringBuilder();
                StringBuilder sbApplication = new StringBuilder();
                foreach (DataRowView drv in dv)
                {
                    string checkbuttonNo = "checkbuttonNo";
                    string triangleNo = "triangleNo";
                    string IsExist = drv["IsExist"].ToString();
                    if (!string.IsNullOrEmpty(IsExist))
                    {
                        checkbuttonNo = "checkbuttonOk";
                        triangleNo = "triangleOk";
                    }

                    if (drv["Category"].ToString() == "工具栏")
                    {
                        sbtoolbar.Append("<div class=\"" + checkbuttonNo + " panelcheck\">");
                        sbtoolbar.Append("<div id=\"" + drv["ButtonId"] + "|" + drv["MenuId"] + "\" class=\"checktext\">");
                        sbtoolbar.Append("<img src=\"../../Themes/Images/16/" + drv["Img"] + "\" />" + drv["FullName"] + "");
                        sbtoolbar.Append("</div>");
                        sbtoolbar.Append("<div class=\"" + triangleNo + "\"></div>");
                        sbtoolbar.Append("</div>");
                    }
                    else
                    {
                        if (drv["Category"].ToString() == "右击菜单栏")
                        {
                            sbApplication.Append("<div class=\"" + checkbuttonNo + " panelcheck\">");
                            sbApplication.Append("<div id=\"" + drv["ButtonId"] + "|" + drv["MenuId"] + "\" class=\"checktext\">");
                            sbApplication.Append("<img src=\"../../Themes/Images/16/" + drv["Img"] + "\" />" + drv["FullName"] + "");
                            sbApplication.Append("</div>");
                            sbApplication.Append("<div class=\"" + triangleNo + "\"></div>");
                            sbApplication.Append("</div>");
                        }
                    }
                }
                sbButton.Append("<div id=\"div_toolbar_" + MenuId + "\">");
                sbButton.Append(sbtoolbar);
                sbButton.Append("</div>");
                sbButton.Append("<div id=\"div_Application" + MenuId + "\" style='display:none'>");
                sbButton.Append(sbApplication);
                sbButton.Append("</div>");
                sbButton.Append("</div>");
                sbButton.Append("</div>");
            }
            else
            {
                sbButton.Append(" <span style='color:red;'>暂无按钮</span>");
            }
            sbButton.Append("</div>");
        }
    }
}