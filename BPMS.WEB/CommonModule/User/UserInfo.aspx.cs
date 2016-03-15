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

namespace BPMS.WEB.CommonModule.User
{
    public partial class UserInfo : System.Web.UI.Page
    {
        public StringBuilder PermissionTree = new StringBuilder();
        public StringBuilder sb_RoleList = new StringBuilder();
        BPMS_PermissionIBLL bpms_permissionibll = new BPMS_PermissionBLL();
        BPMS_UserRoleIBLL bpms_userroleibll = new BPMS_UserRoleBLL();
        BPMS_UserIBLL bpms_useribll = new BPMS_UserBLL();
        public string _key, imgGender, strUserInfo;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            if (!IsPostBack)
            {
                InitControl();
                GetPermissionTree();
                GetRoleList();
            }
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public void InitControl()
        {
            if (!string.IsNullOrEmpty(_key))
            {
                foreach (BPMS_User item in bpms_useribll.GetIListById(_key))
                {
                    ControlBindHelper.SetWebControls(this.Page, item);
                    Password.Text = "******";
                    Enabled.Text = item.Enabled.ToString() == "1" ? "是" : "否";
                    if (item.Gender == "男")
                    {
                        imgGender = "man.png";
                    }
                    else
                    {
                        imgGender = "woman.png";
                    }
                    strUserInfo = item.RealName + "（" + item.Account + "）";
                }
            }
        }
        #region 拥有权限
        /// <summary>
        /// 拥有权限列表
        /// </summary>
        public void GetPermissionTree()
        {
            IList list = bpms_permissionibll.GetModulePermission(_key);
            IList listButton = bpms_permissionibll.GetButtonPermission(_key);
            int eRowIndex = 0;
            foreach (BPMS_ModulePermission entity in list)
            {
                if (entity.ParentId == "0")
                {
                    string trID = "node-" + eRowIndex.ToString();
                    PermissionTree.Append("<tr id='" + trID + "'>");
                    PermissionTree.Append("<td style='width: 230px;padding-left:20px;'><img src='/Themes/images/32/" + entity.Img + "' style='width:20px; height:20px;vertical-align: middle;' alt=''/><span style='padding-left:8px;'>" + entity.FullName + "</span></td>");
                    PermissionTree.Append("<td>" + entity.Description + "</td>");
                    PermissionTree.Append("</tr>");
                    //创建子节点
                    PermissionTree.Append(GetTableTreeNode(entity.MenuId, list, trID, listButton));
                    eRowIndex++;
                }
            }
            if (eRowIndex == 0)
            {
                PermissionTree.Append("<tr><td colspan='2' style=\"text-align: left;color:Red\">没有找到您要的相关数据...</td></tr>");
            }
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="ParentId">父节点主键</param>
        /// <param name="list">菜单集合</param>
        /// <param name="listButton">按钮集合</param>
        /// <returns></returns>
        public string GetTableTreeNode(string ParentId, IList list, string parentTRID, IList listButton)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            int i = 1;
            foreach (BPMS_ModulePermission entity in list)
            {
                if (entity.ParentId == ParentId)
                {
                    string trID = parentTRID + "-" + i.ToString();
                    sb_TreeNode.Append("<tr id='" + trID + "' class='child-of-" + parentTRID + "'>");
                    sb_TreeNode.Append("<td style='padding-left:20px;'><img src='/Themes/images/32/" + entity.Img + "' style='width:20px; height:20px;vertical-align: middle;' alt=''/><span style='padding-left:8px;'>" + entity.FullName + "</span></td>");
                    sb_TreeNode.Append("<td>" + entity.Description + "</td>");
                    sb_TreeNode.Append("</tr>");
                    //创建子节点
                    sb_TreeNode.Append(GetTableTreeNode(entity.MenuId, list, trID, listButton));
                    //创建操作按钮
                    sb_TreeNode.Append(Button(entity.MenuId, listButton, trID));
                    i++;
                }
            }
            return sb_TreeNode.ToString();
        }
        /// <summary>
        /// 加载权限操作按钮
        /// </summary>
        /// <param name="ParentId"></param>
        /// <param name="list"></param>
        /// <returns></returns>
        public string Button(string ParentId, IList list, string parentTRID)
        {
            StringBuilder sb_Button = new StringBuilder();
            int i = 1;
            foreach (BPMS_ButtonPermission entity in list)
            {
                if (entity.MenuId == ParentId)
                {
                    string trID = parentTRID + "-" + i.ToString();
                    sb_Button.Append("<tr hide='true' id='" + trID + "' class='child-of-" + parentTRID + "'>");
                    sb_Button.Append("<td style='padding-left:20px;'><img src='/Themes/images/16/" + entity.Img + "' style='width:16px; height:16px;vertical-align: middle;' alt=''/><span style='padding-left:8px;'>" + entity.FullName + " - 按钮</span></td>");
                    sb_Button.Append("<td>" + entity.Description + "</td>");
                    sb_Button.Append("</tr>");
                    i++;
                }
            }
            return sb_Button.ToString();
        }
        #endregion

        #region 拥有角色
        /// <summary>
        /// 拥有角色
        /// </summary>
        public void GetRoleList()
        {
            IList list = bpms_userroleibll.GetUserRoleListByUserId(_key);
            int eRowIndex = 0;
            foreach (BPMS_Roles entity in list)
            {
                sb_RoleList.Append("<tr>");
                sb_RoleList.Append("<td style='width: 200px;'>" + entity.FullName + "</span></td>");
                sb_RoleList.Append("<td style=\"width: 100px; text-align: center;\">" + entity.Code + "</td>");
                sb_RoleList.Append("<td style=\"width: 100px; text-align: center;\">" + entity.Category + "</td>");
                sb_RoleList.Append("<td>" + entity.Description + "</td>");
                sb_RoleList.Append("</tr>");
                eRowIndex++;
            }
            if (eRowIndex == 0)
            {
                sb_RoleList.Append("<tr><td colspan='4' style=\"text-align: left;color:Red\">没有找到您要的相关数据...</td></tr>");
            }
        }
        #endregion
    }
}