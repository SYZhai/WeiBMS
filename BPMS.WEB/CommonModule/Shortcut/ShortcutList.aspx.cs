using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Shortcut
{
    public partial class ShortcutList : System.Web.UI.Page
    {
        BPMS_PermissionIBLL bpms_permissionibll = new BPMS_PermissionBLL();
        BPMS_Shortcut bpms_shortcut = new BPMS_Shortcut();
        BPMS_ShortcutIBLL bpms_shortcutibll = new BPMS_ShortcutBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAction();
        }

        #region 主功能项
        /// <summary>
        /// 主功能项
        /// </summary>
        public string GetMenuTree()
        {
            string UserId = RequestSession.GetSessionUser().UserId;
            StringBuilder sbModule = new StringBuilder();
            IList list = bpms_permissionibll.GetModulePermission(UserId);
            List<BPMS_ModulePermission> itemNode = IListHelper.IListToList<BPMS_ModulePermission>(list).FindAll(t => t.ParentId == "0");
            foreach (BPMS_ModulePermission entity in itemNode)
            {
                sbModule.Append("<li>");
                sbModule.Append("<div id=''><img src='/Themes/images/32/" + entity.Img + "' style='width:18px; height:18px;vertical-align: middle;' alt=''/><span>" + entity.FullName + "</span></div>");
                //创建子节点
                sbModule.Append(GetTreeNode(entity.MenuId, list));
                sbModule.Append("</li>");
            }
            return sbModule.ToString();
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
            List<BPMS_ModulePermission> itemNode = IListHelper.IListToList<BPMS_ModulePermission>(list).FindAll(t => t.ParentId == ParentId);
            int index = 0;
            string strclass = "";
            if (itemNode.Count > 0)
            {
                sb_TreeNode.Append("<ul>");
                foreach (BPMS_ModulePermission entity in itemNode)
                {
                    if (index == 0)
                        strclass = "collapsableselected";
                    else
                        strclass = "";
                    sb_TreeNode.Append("<li>");
                    sb_TreeNode.Append("<div class='" + strclass + "' id='" + entity.MenuId + "'><img src='/Themes/images/32/" + entity.Img + "' style='width:18px; height:18px;vertical-align: middle;' alt=''/><span>" + entity.FullName + "</span></div>");
                    sb_TreeNode.Append("</li>");
                    index++;
                }
                sb_TreeNode.Append("</ul>");
            }
            return sb_TreeNode.ToString();
        }
        #endregion

        #region 子功能项
        /// <summary>
        /// 子功能项
        /// </summary>
        /// <param name="ParentId">上级菜单主键</param>
        /// <returns></returns>
        public string Submenu(string ParentId)
        {
            StringBuilder sb_Submenu = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId;

            IList shortcut = bpms_shortcutibll.GetList(UserId);

            IList list = bpms_permissionibll.GetModulePermission(UserId);
            List<BPMS_ModulePermission> itemNode = IListHelper.IListToList<BPMS_ModulePermission>(list).FindAll(t => t.ParentId == ParentId);
            foreach (BPMS_ModulePermission entity in itemNode)
            {
                List<BPMS_ModulePermission> Isshortcut = IListHelper.IListToList<BPMS_ModulePermission>(shortcut).FindAll(t => t.MenuId == entity.MenuId);
                if (Isshortcut.Count == 0)
                {
                    sb_Submenu.Append("<div onclick=\"AddMenu('" + entity.MenuId + "')\" " + entity.Description + " class=\"shortcuticons\">");
                    sb_Submenu.Append("<img src=\"/Themes/Images/32/" + entity.Img + "\" alt=\"\" /><br />");
                    sb_Submenu.Append("" + entity.FullName + "");
                    sb_Submenu.Append("</div>");
                }
            }
            return sb_Submenu.ToString(); ;
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
            switch (active)
            {
                case "GetMenuTree"://主功能项
                    Response.Write(GetMenuTree());
                    Response.End();
                    break;
                case "Submenu"://子功能项
                    Response.Write(Submenu(key));
                    Response.End();
                    break;
                case "AddMenu"://添加菜单到首页快捷
                    bpms_shortcut.MenuId = key;
                    bpms_shortcut.UserId = RequestSession.GetSessionUser().UserId;
                    Response.Write(bpms_shortcutibll.Insert(bpms_shortcut));
                    Response.End();
                    break;
                case "Delete"://移除
                    Response.Write(bpms_shortcutibll.Delete(key, RequestSession.GetSessionUser().UserId));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}