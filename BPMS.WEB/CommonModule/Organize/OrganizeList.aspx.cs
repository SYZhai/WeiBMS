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
    public partial class OrganizeList : PageBase
    {
        BPMS_OrganizationIBLL bpms_organizationibll = new BPMS_OrganizationBLL();
        BPMS_Organization bpms_organization = new BPMS_Organization();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAction();
        }
        #region 组织架构表
        /// <summary>
        /// 组织架构表
        /// </summary>
        public string GetTreeTable()
        {
            StringBuilder TableTreeList = new StringBuilder();
            IList list = bpms_organizationibll.GetListSys();
            int eRowIndex = 0;
            foreach (BPMS_Organization entity in list)
            {
                if (entity.ParentId == "0")
                {
                    string trID = "node-" + eRowIndex.ToString();
                    TableTreeList.Append("<tr id='" + trID + "'>");
                    TableTreeList.Append("<td style='width: 230px;padding-left:20px;'><img src='/Themes/images/16/house.png' style='vertical-align: middle;' alt=''/><span style='padding-left:8px;'>" + entity.FullName + "</span></td>");
                    TableTreeList.Append("<td style='width: 130px;'>" + entity.Code + "</td>");
                    TableTreeList.Append("<td style='width: 60px;text-align:center;'>" + entity.Category + "</td>");
                    TableTreeList.Append("<td style='width: 120px;text-align:center;'>" + entity.ShortName + "</td>");
                    TableTreeList.Append("<td style='width: 100px;text-align:center;'>" + entity.Manager + "</td>");
                    TableTreeList.Append("<td style='width: 100px;text-align:center;'>" + entity.OuterPhone + "</td>");
                    TableTreeList.Append("<td style='width: 100px;text-align:center;'>" + entity.Manager + "</td>");
                    TableTreeList.Append("<td style='width: 60px;text-align:center;'>" + IsEnabled(entity.Enabled) + "</td>");
                    TableTreeList.Append("<td>" + entity.Description + "</td>");
                    TableTreeList.Append("<td style='display:none'>" + entity.OrganizationId + "</td>");
                    TableTreeList.Append("</tr>");
                    //创建子节点
                    TableTreeList.Append(GetTableTreeNode(entity.OrganizationId, list, trID));
                    eRowIndex++;
                }
            }
            return TableTreeList.ToString();
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="parentID">父节点主键</param>
        /// <param name="list">菜单集合</param>
        /// <returns></returns>
        public string GetTableTreeNode(string parentID, IList list, string parentTRID)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            int i = 1;
            foreach (BPMS_Organization entity in list)
            {
                if (entity.ParentId == parentID)
                {
                    string trID = parentTRID + "-" + i.ToString();
                    sb_TreeNode.Append("<tr id='" + trID + "' class='child-of-" + parentTRID + "'>");
                    sb_TreeNode.Append("<td style='padding-left:20px;'><img src='/Themes/images/16/" + CategoryToImg(entity.Category) + "' style='vertical-align: middle;' alt=''/><span style='padding-left:8px;'>" + entity.FullName + "</span></td>");
                    sb_TreeNode.Append("<td style='width: 130px;'>" + entity.Code + "</td>");
                    sb_TreeNode.Append("<td style='width: 60px;text-align:center;'>" + entity.Category + "</td>");
                    sb_TreeNode.Append("<td style='width: 120px;text-align:center;'>" + entity.ShortName + "</td>");
                    sb_TreeNode.Append("<td style='width: 100px;text-align:center;'>" + entity.Manager + "</td>");
                    sb_TreeNode.Append("<td style='width: 100px;text-align:center;'>" + entity.OuterPhone + "</td>");
                    sb_TreeNode.Append("<td style='width: 100px;text-align:center;'>" + entity.Manager + "</td>");
                    sb_TreeNode.Append("<td style='width: 60px;text-align:center;'>" + IsEnabled(entity.Enabled) + "</td>");
                    sb_TreeNode.Append("<td>" + entity.Description + "</td>");
                    sb_TreeNode.Append("<td style='display:none'>" + entity.OrganizationId + "</td>");
                    sb_TreeNode.Append("</tr>");
                    //创建子节点
                    sb_TreeNode.Append(GetTableTreeNode(entity.OrganizationId, list, trID));
                    i++;
                }
            }
            return sb_TreeNode.ToString();
        }
        /// <summary>
        /// 是否有效
        /// </summary>
        /// <param name="Enabled">是否有效</param>
        /// <returns></returns>
        public string IsEnabled(int? Enabled)
        {
            if (Enabled == 1)
            {
                return "<img src='/Themes/Images/checkmark.gif'/>";
            }
            else
            {
                return "<img src='/Themes/Images/checknomark.gif'/>";
            }
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
        #endregion

        public void LoadAction()
        {
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AddHeader("Pragma", "No-Cache");

            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string key = HttpContext.Current.Request["key"];                                                //主键
            BPMS_SysMenuIBLL bpms_sysmenuibll = new BPMS_SysMenuBLL();
            BPMS_SysMenu bpms_sysmenu = new BPMS_SysMenu();
            switch (active)
            {
                case "OrgTreeList"://加载组织架构列表
                    Response.Write(GetTreeTable());
                    Response.End();
                    break;
                case "Delete":
                    if (bpms_organizationibll.IsBelowMenu(key))
                    {
                        bpms_organization = bpms_organizationibll.GetEntity(key);
                        Response.Write(string.Format(MessageHelper.MSG0010, bpms_organization.FullName));
                        Response.End();
                    }
                    else
                    {
                        Response.Write(bpms_organizationibll.Delete(key));
                        Response.End();
                    }
                    break;
                case "LoadBindDrop"://绑定下拉框，公司，部门，工作组
                    IList list = bpms_organizationibll.GetList();
                    Response.Write(JsonHelper.DropToJson<BPMS_Organization>(bpms_organizationibll.GetList(), "JSON"));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}