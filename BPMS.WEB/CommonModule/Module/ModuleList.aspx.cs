using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BPMS.WEB.CommonModule.Module
{
    public partial class ModuleList : PageBase
    {
        BPMS_SysMenuIBLL bpms_sysmenuibll = new BPMS_SysMenuBLL();
        BPMS_SysMenu bpms_sysmenu = new BPMS_SysMenu();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAction();
        }
        #region 模块菜单列表
        /// <summary>
        /// 模块菜单列表
        /// </summary>
        public string GetMenuTreeTable()
        {
            StringBuilder TableTree_Menu = new StringBuilder();
            IList list = bpms_sysmenuibll.GetList();
            int eRowIndex = 0;
            foreach (BPMS_SysMenu entity in list)
            {
                if (entity.ParentId == "0")
                {
                    string trID = "node-" + eRowIndex.ToString();
                    TableTree_Menu.Append("<tr id='" + trID + "'>");
                    TableTree_Menu.Append("<td style='width: 230px;padding-left:20px;'><img src='/Themes/images/32/" + entity.Img + "' style='width:20px; height:20px;vertical-align: middle;' alt=''/><span style='padding-left:8px;'>" + entity.FullName + "</span></td>");
                    TableTree_Menu.Append("<td style='width: 100px;'>" + entity.Code + "</td>");
                    TableTree_Menu.Append("<td style='width: 130px;text-align:center;'>" + entity.Category + "</td>");
                    TableTree_Menu.Append("<td style='width: 60px;text-align:center;'>" + entity.Target + "</td>");
                    TableTree_Menu.Append("<td>" + entity.NavigateUrl + "</td>");
                    TableTree_Menu.Append("<td>" + entity.FormName + "</td>");
                    TableTree_Menu.Append("<td style='width: 60px;text-align:center;'>" + IsEnabled(entity.Enabled) + "</td>");
                    TableTree_Menu.Append("<td style='width: 60px;text-align:center;'>" + entity.SortCode + "</td>");
                    TableTree_Menu.Append("<td style='display:none'>" + entity.MenuId + "</td>");
                    TableTree_Menu.Append("</tr>");
                    //创建子节点
                    TableTree_Menu.Append(GetTableTreeNode(entity.MenuId, list, trID));
                    eRowIndex++;
                }
            }
            return TableTree_Menu.ToString();
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
            foreach (BPMS_SysMenu entity in list)
            {
                if (entity.ParentId == parentID)
                {
                    string trID = parentTRID + "-" + i.ToString();
                    sb_TreeNode.Append("<tr id='" + trID + "' class='child-of-" + parentTRID + "'>");
                    sb_TreeNode.Append("<td style='padding-left:20px;'><img src='/Themes/images/32/" + entity.Img + "' style='width:20px; height:20px;vertical-align: middle;' alt=''/><span style='padding-left:8px;'>" + entity.FullName + "</span></td>");
                    sb_TreeNode.Append("<td style='width: 100px;'>" + entity.Code + "</td>");
                    sb_TreeNode.Append("<td style='width: 130px;text-align:center;'>" + entity.Category + "</td>");
                    sb_TreeNode.Append("<td style='width: 60px;text-align:center;'>" + entity.Target + "</td>");
                    sb_TreeNode.Append("<td>" + entity.NavigateUrl + "</td>");
                    sb_TreeNode.Append("<td>" + entity.FormName + "</td>");
                    sb_TreeNode.Append("<td style='width: 60px;text-align:center;'>" + IsEnabled(entity.Enabled) + "</td>");
                    sb_TreeNode.Append("<td style='width: 60px;text-align:center;'>" + entity.SortCode + "</td>");
                    sb_TreeNode.Append("<td style='display:none'>" + entity.MenuId + "</td>");
                    sb_TreeNode.Append("</tr>");
                    //创建子节点
                    sb_TreeNode.Append(GetTableTreeNode(entity.MenuId, list, trID));
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
                case "MenuTreeTable"://加载模块菜单列表
                    Response.Write(GetMenuTreeTable());
                    Response.End();
                    break;
                case "Delete"://删除模块菜单
                    bpms_sysmenu = bpms_sysmenuibll.GetEntity(key);
                    if (bpms_sysmenu.AllowDelete == 0)
                    {
                        Response.Write(string.Format(MessageHelper.MSG0009, bpms_sysmenu.FullName));
                        Response.End();
                    }
                    if (bpms_sysmenuibll.IsBelowMenu(key))
                    {
                        Response.Write(string.Format(MessageHelper.MSG0010, bpms_sysmenu.FullName));
                        Response.End();
                    }
                    else
                    {
                        Response.Write(bpms_sysmenuibll.Delete(key));
                        Response.End();
                    }
                    break;
                default:
                    break;
            }
        }
    }
}