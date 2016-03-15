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
    public partial class OrganizeChart : System.Web.UI.Page
    {
        public StringBuilder strHtml_OrgChart = new StringBuilder();
        BPMS_OrganizationIBLL bpms_organizationibll = new BPMS_OrganizationBLL();
        BPMS_Organization bpms_organization = new BPMS_Organization();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTreeOrgChart();
            }
        }

        #region 组织架构图
        /// <summary>
        /// 机构列表
        /// </summary>
        public void GetTreeOrgChart()
        {
            IList list = bpms_organizationibll.GetListSys();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == "0");
            foreach (BPMS_Organization entity in itemNode)
            {
                string itemid = "v" + entity.OrganizationId.Replace("-", "");
                strHtml_OrgChart.Append("var " + itemid + " = new OrgNode();");
                strHtml_OrgChart.Append("" + itemid + ".Text = \"" + entity.FullName + "\";");
                strHtml_OrgChart.Append("" + itemid + ".Description = \"" + entity.ShortName + "\";");
                //strHtml_OrgChart.Append("" + itemid + ".Link = \"#\";");
                //创建子节点
                strHtml_OrgChart.Append(GetTreeNodeOrgChart(entity.OrganizationId, list));
            }
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="parentID">父节点主键</param>
        /// <param name="list">菜单集合</param>
        /// <returns></returns>
        public string GetTreeNodeOrgChart(string ParentId, IList list)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == ParentId);
            if (itemNode.Count > 0)
            {
                foreach (BPMS_Organization entity in itemNode)
                {
                    string itemid = "v" + entity.OrganizationId.Replace("-", "");
                    string itemParentId = "v" + ParentId.Replace("-", "");
                    sb_TreeNode.Append("var " + itemid + " = new OrgNode();");
                    sb_TreeNode.Append("" + itemid + ".Text = \"" + entity.FullName + "\";");
                    sb_TreeNode.Append("" + itemid + ".Description = \"" + entity.ShortName + "\";");
                    //sb_TreeNode.Append("" + itemid + ".Link = \"#\";");
                    sb_TreeNode.Append("" + itemParentId + ".Nodes.Add(" + itemid + ");");
                    //创建子节点
                    sb_TreeNode.Append(GetTreeNodeOrgChart(entity.OrganizationId, list));
                }
            }
            return sb_TreeNode.ToString();
        }
        #endregion
    }
}