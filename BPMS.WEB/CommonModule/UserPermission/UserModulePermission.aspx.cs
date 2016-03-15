using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.UserPermission
{
    public partial class UserModulePermission : System.Web.UI.Page
    {
        public StringBuilder TableTree_Menu = new StringBuilder();
        BPMS_UserMenuIBLL bpms_usermenuibll = new BPMS_UserMenuBLL();
        BPMS_SysMenu bpms_sysmenu = new BPMS_SysMenu();
        string _UserId;
        protected void Page_Load(object sender, EventArgs e)
        {
            _UserId = Request["UserId"];//用户主键
            if (!IsPostBack)
            {
                GetMenuTreeTable();
            }
        }
        #region 模块菜单列表
        /// <summary>
        /// 模块菜单列表
        /// </summary>
        public void GetMenuTreeTable()
        {
            DataTable dt = bpms_usermenuibll.GetList(_UserId);
            DataView dv = new DataView(dt);
            dv.RowFilter = " ParentId = '0'";
            int eRowIndex = 0;
            foreach (DataRowView drv in dv)
            {
                string trID = "node-" + eRowIndex.ToString();
                TableTree_Menu.Append("<tr id='" + trID + "'>");
                TableTree_Menu.Append("<td style='width: 230px;padding-left:20px;'><input id='ckb" + trID + "' onclick=\"ckbValueObj(this.id)\" " + GetChecked(drv["IsExist"].ToString()) + " style='vertical-align: middle;margin-bottom:2px;' type=\"checkbox\" value=\"" + drv["MenuId"] + "\" name=\"checkbox\" /><img src='/Themes/images/32/" + drv["Img"] + "' style='width:20px; height:20px;vertical-align: middle;' alt=''/><span style='padding-left:8px;'>" + drv["FullName"] + "</span></td>");
                TableTree_Menu.Append("<td style='width: 100px;text-align: center;'>" + drv["Code"] + "</td>");
                TableTree_Menu.Append("<td style='width: 60px;text-align:center;'>" + drv["Category"] + "</td>");
                TableTree_Menu.Append("<td style='width: 60px;text-align:center;'>" + drv["SortCode"] + "</td>");
                TableTree_Menu.Append("<td>" + drv["Description"] + "</td>");
                TableTree_Menu.Append("</tr>");
                //创建子节点
                TableTree_Menu.Append(GetTableTreeNode(drv["MenuId"].ToString(), dt, trID));
                eRowIndex++;
            }
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="parentID">父节点主键</param>
        /// <param name="list">菜单集合</param>
        /// <returns></returns>
        public string GetTableTreeNode(string parentID, DataTable dt, string parentTRID)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            int i = 1;
            DataView dv = new DataView(dt);
            dv.RowFilter = "ParentId = '" + parentID + "'";
            foreach (DataRowView drv in dv)
            {
                string trID = parentTRID + "-" + i.ToString();
                sb_TreeNode.Append("<tr id='" + trID + "' class='child-of-" + parentTRID + "'>");
                sb_TreeNode.Append("<td style='padding-left:20px;'><input id='ckb" + trID + "' onclick=\"ckbValueObj(this.id)\" " + GetChecked(drv["IsExist"].ToString()) + " style='vertical-align: middle;margin-bottom:2px;' type=\"checkbox\" value=\"" + drv["MenuId"] + "\" name=\"checkbox\" /><img src='/Themes/images/32/" + drv["Img"] + "' style='width:20px; height:20px;vertical-align: middle;' alt=''/><span style='padding-left:8px;'>" + drv["FullName"] + "</span></td>");
                sb_TreeNode.Append("<td style='width: 100px;text-align: center;'>" + drv["Code"] + "</td>");
                sb_TreeNode.Append("<td style='width: 60px;text-align:center;'>" + drv["Category"] + "</td>");
                sb_TreeNode.Append("<td style='width: 60px;text-align:center;'>" + drv["SortCode"] + "</td>");
                sb_TreeNode.Append("<td>" + drv["Description"] + "</td>");
                sb_TreeNode.Append("</tr>");
                //创建子节点
                sb_TreeNode.Append(GetTableTreeNode(drv["MenuId"].ToString(), dt, trID));
                i++;
            }
            return sb_TreeNode.ToString();
        }
        /// <summary>
        /// 验证权限是否存在
        /// </summary>
        /// <param name="IsExist"></param>
        /// <returns></returns>
        public string GetChecked(string IsExist)
        {
            if (!string.IsNullOrEmpty(IsExist))
                return "checked=\"checked\"";
            else
                return "";
        }
        #endregion
    }
}