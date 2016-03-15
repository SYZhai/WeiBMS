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

namespace BPMS.WEB.CommonModule.Organize
{
    public partial class OrganizeTree : System.Web.UI.Page
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
                strHtml.Append("<div class='divTree' id='" + entity.OrganizationId + "'><img src='/Themes/images/16/house.png' style='vertical-align: middle;' alt=''/><span>" + entity.FullName + "</span></div>");
                //创建子节点
                strHtml.Append(GetTreeNode(entity.OrganizationId, list));
                strHtml.Append("</li>");
            }
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="parentID">父节点主键</param>
        /// <param name="list">菜单集合</param>
        /// <returns></returns>
        public string GetTreeNode(string ParentId, IList list)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == ParentId);
            if (itemNode.Count > 0)
            {
                sb_TreeNode.Append("<ul>");
                foreach (BPMS_Organization entity in itemNode)
                {
                    
                    sb_TreeNode.Append("<li title='" + entity.Category + "'>");
                    sb_TreeNode.Append("<div class='divTree' Category='" + entity.Category + "' id='" + entity.OrganizationId + "'><img src='/Themes/images/16/" + CategoryToImg(entity.Category) + "' style='vertical-align: middle;' alt=''/><span>" + entity.FullName + "</span></div>");
                    //创建子节点
                    sb_TreeNode.Append(GetTreeNode(entity.OrganizationId, list));
                    sb_TreeNode.Append("</li>");
                }
                sb_TreeNode.Append("</ul>");
            }
            return sb_TreeNode.ToString();
        }
        public string CategoryToImg(string Category)
        {
            string img = "";
            if (Category == "区域")
            {
                img = "house_star.png";
            }
            if (Category == "公司")
            {
                img = "chart_organisation.png";
            }
            if (Category == "子公司")
            {
                img = "flag_green.png";
            }
            if (Category == "部门")
            {
                img = "wand.png";
            }
            if (Category == "工作组")
            {
                img = "users.png";
            }
            return img;
        }
    }
}