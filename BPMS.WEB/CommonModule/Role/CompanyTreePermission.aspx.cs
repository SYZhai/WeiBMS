using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Role
{
    public partial class CompanyTreePermission : System.Web.UI.Page
    {
        public StringBuilder strHtml = new StringBuilder();
        BPMS_OrganizationIBLL bpms_organizationibll = new BPMS_OrganizationBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTree();
            }
        }
        /// <summary>
        /// 组织机构
        /// </summary>
        public void GetTree()
        {
            IList list = bpms_organizationibll.GetList();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == "0");
            foreach (BPMS_Organization entity in itemNode)
            {
                strHtml.Append("<li>");
                strHtml.Append("<div id='" + entity.OrganizationId + "'><img src='/Themes/images/16/house.png' style='vertical-align: middle;' alt=''/><span>" + entity.FullName + "</span></div>");
                //创建子节点
                strHtml.Append(GetTreeNode(list));
                strHtml.Append("</li>");
            }
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="list">list</param>
        /// <returns></returns>
        public string GetTreeNode(IList list)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.Category == "公司");
            int index = 0;
            string strclass = "";
            if (itemNode.Count > 0)
            {
                sb_TreeNode.Append("<ul>");
                foreach (BPMS_Organization entity in itemNode)
                {
                    if (index == 0)
                        strclass = "collapsableselected";
                    else
                        strclass = "";
                    sb_TreeNode.Append("<li>");
                    sb_TreeNode.Append("<div class='" + strclass + "' id='" + entity.OrganizationId + "'><img src='/Themes/images/16/chart_organisation.png' style='vertical-align: middle;' alt=''/><span>" + entity.FullName + "</span></div>");
                    sb_TreeNode.Append("</li>");
                    index++;
                }
                sb_TreeNode.Append("</ul>");
            }
            return sb_TreeNode.ToString();
        }
    }
}