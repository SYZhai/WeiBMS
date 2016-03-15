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

namespace BPMS.WEB.CommonModule.Role
{
    public partial class MemberForm : System.Web.UI.Page
    {
        public StringBuilder sbBranch = new StringBuilder();
        public StringBuilder sbMember = new StringBuilder();
        BPMS_UserRoleIBLL bpms_userroleibll = new BPMS_UserRoleBLL();
        BPMS_OrganizationIBLL bpms_organizationibll = new BPMS_OrganizationBLL();
        string _RoleId, _OrganizationId;
        public string strRoleName;
        protected void Page_Load(object sender, EventArgs e)
        {
            _RoleId = Request["RoleId"];                  //角色主键
            _OrganizationId = Request["OrganizationId"];  //公司主键
            strRoleName = Server.UrlDecode(Request["RoleName"]);
            if (!IsPostBack)
            {
                loadBind();
            }
        }
        //加载部门
        public void loadBind()
        {
            IList ListNotMember = bpms_userroleibll.GetListNotMember(_RoleId);
            IList list = bpms_organizationibll.GetList();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == _OrganizationId);
            int index = 0;
            string strclass = "";
            foreach (BPMS_Organization item in itemNode)
            {
                if (index == 0)
                {
                    strclass = "collapsableselected";
                }
                else
                {
                    strclass = "";
                }
                sbBranch.Append("<li><div class='" + strclass + "' id='" + item.OrganizationId + "'><img src='/Themes/images/16/wand.png' style='vertical-align: middle;' alt=''/>" + item.FullName + "</div></li>");
                NodeMember(ListNotMember, item.OrganizationId);
                index++;
            }
        }
        //加载部门成员
        public void NodeMember(IList ListNotMember, string DepartmentId)
        {
            List<BPMS_User> itemNode = IListHelper.IListToList<BPMS_User>(ListNotMember).FindAll(t => t.DepartmentId == DepartmentId);
            sbMember.Append("<div id='GroupsMember_" + DepartmentId + "' class='DepartmentMember'  style='display:none;'>");
            if (itemNode.Count > 0)
            {

                foreach (BPMS_User item in itemNode)
                {
                    string Genderimg = "user_red.png";
                    string Gender = item.Gender;
                    if (Gender == "男")
                    {
                        Genderimg = "user_mature.png";
                    }
                    sbMember.Append("<div title='编号：" + item.Code + "\r\n账户：" + item.Account + "' class=\"checkbuttonNo panelcheck\">");
                    sbMember.Append("<div id=\"" + item.UserId + "\" class=\"checktext\">");
                    sbMember.Append("<img src=\"../../Themes/Images/16/" + Genderimg + "\" />" + item.RealName + "");
                    sbMember.Append("</div>");
                    sbMember.Append("<div class=\"triangleNo\"></div>");
                    sbMember.Append("</div>");
                }
            }
            else
            {
                sbMember.Append(" <span style='color:red;'>暂无成员</span>");
            }
            sbMember.Append("</div>");
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            string[] array = new string[0];
            if (!string.IsNullOrEmpty(hiddenUserId.Value))
            {
                array = hiddenUserId.Value.Split('≌');
            }
            bool IsOk = false;
            string CreateUserId = RequestSession.GetSessionUser().UserId;
            string CreateUserName = RequestSession.GetSessionUser().UserName;
            IsOk = bpms_userroleibll.BatchAddMember(array, _RoleId, CreateUserId, CreateUserName);
            if (IsOk)
            {
                ShowMsgHelper.ShowScript("showTipsMsg('" + MessageHelper.MSG0007 + "','4000','4');top.$('#' + Current_iframeID())[0].contentWindow.target_right.iframeRoleMember.windowload();OpenClose();");
            }
            else
            {
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
            }
        }
    }
}