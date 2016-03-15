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

namespace BPMS.WEB.CommonModule.User
{
    public partial class UserRole : System.Web.UI.Page
    {
        public StringBuilder sbCompany = new StringBuilder();
        public StringBuilder sbRole = new StringBuilder();
        BPMS_OrganizationIBLL bpms_organizationibll = new BPMS_OrganizationBLL();
        BPMS_UserRoleIBLL bpms_userroleibll = new BPMS_UserRoleBLL();
        string _UserId;
        public string strUserInfo;
        protected void Page_Load(object sender, EventArgs e)
        {
            _UserId = Request["UserId"];//用户主键
            strUserInfo = Server.UrlDecode(Request["RealName"]);//用户信息
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
            DataTable dt = bpms_userroleibll.GetUserRoleList(_UserId);
            IList list = bpms_organizationibll.GetList();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == "0");
            foreach (BPMS_Organization entity in itemNode)
            {
                sbCompany.Append("<li>");
                sbCompany.Append("<div id='" + entity.OrganizationId + "'><img src='/Themes/images/16/house.png' style='vertical-align: middle;' alt=''/>" + entity.FullName + "</div>");
                //创建子节点
                sbCompany.Append(GetTreeNode(list, dt));
                sbCompany.Append("</li>");
            }
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="list">list</param>
        /// <param name="dt">list</param>
        /// <returns></returns>
        public string GetTreeNode(IList list, DataTable dt)
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
                    sb_TreeNode.Append("<div class='" + strclass + "' id='" + entity.OrganizationId + "'><img src='/Themes/images/16/chart_organisation.png' style='vertical-align: middle;' alt=''/>" + entity.FullName + "</div>");
                    sb_TreeNode.Append("</li>");
                    NodeRole(dt, entity.OrganizationId);
                    index++;
                }
                sb_TreeNode.Append("</ul>");
            }
            return sb_TreeNode.ToString();
        }
        /// <summary>
        /// 加载角色
        /// </summary>
        /// <param name="ListNotMember"></param>
        /// <param name="DepartmentId"></param>
        public void NodeRole(DataTable RoleList, string OrganizationId)
        {
            DataView dv = new DataView(RoleList);
            dv.RowFilter = " OrganizationId = '" + OrganizationId + "'";
            sbRole.Append("<div id='Role_" + OrganizationId + "' class='UserRole'  style='display:none;'>");
            if (dv.Count > 0)
            {
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
                    sbRole.Append("<div class=\"" + checkbuttonNo + "  panelcheck\">");
                    sbRole.Append("<div id=\"" + drv["RoleId"] + "\" class=\"checktext\">");
                    sbRole.Append("<img src=\"../../Themes/Images/16/AllotRole.png\" />" + drv["FullName"] + "");
                    sbRole.Append("</div>");
                    sbRole.Append("<div class=\"" + triangleNo + "\"></div>");
                    sbRole.Append("</div>");
                }
            }
            else
            {
                sbRole.Append(" <span style='color:red;'>暂无角色</span>");
            }
            sbRole.Append("</div>");
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            string[] array = new string[0];
            if (!string.IsNullOrEmpty(hiddenRoleId.Value))
            {
                array = hiddenRoleId.Value.Split('≌');
            }
            bool IsOk = false;
            string CreateUserId = RequestSession.GetSessionUser().UserId;
            string CreateUserName = RequestSession.GetSessionUser().UserName;
            IsOk = bpms_userroleibll.BatchAddUserRole(array, _UserId, CreateUserId, CreateUserName);
            if (IsOk)
            {
                ShowMsgHelper.AlertCallback(MessageHelper.MSG0007);
            }
            else
            {
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
            }
        }
    }
}