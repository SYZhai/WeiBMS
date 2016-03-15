using BPMS.Entity;
using BPMS.Business;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace BPMS.WEB.CommonModule.Role
{
    public partial class RoleForm : System.Web.UI.Page
    {
        BPMS_RolesIBLL bpms_rolesibll = new BPMS_RolesBLL();
        BPMS_Roles bpms_roles = new BPMS_Roles();
        string _key, _OrganizationId;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            _OrganizationId = Request["OrganizationId"];   //公司主键
            if (!IsPostBack)
            {
                InitControl();
            }
        }
        
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public void InitControl()
        {
            InitBindDrop();
            if (!string.IsNullOrEmpty(_key))
            {
                bpms_roles = bpms_rolesibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_roles);
            }
            
        }
        /// <summary>
        /// 初始化绑定下拉框
        /// </summary>
        public void InitBindDrop()
        {
            BPMS_ItemDetailsIBLL bpms_itemdetailsibll = new BPMS_ItemDetailsBLL();
            IList List = bpms_itemdetailsibll.GetListByItemsId("5fed1313-7355-4cc4-a7ec-73211a361fa6");
            ControlBindHelper.BindHtmlSelect(List, Category, "ItemName", "ItemCode", "==请选择==");

        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            bool IsOk = false;
            bpms_roles = ControlBindHelper.GetWebControls<BPMS_Roles>(this.Page);
            bpms_roles.Enabled = Enabled.Checked ? 1 : 0;
            bpms_roles.AllowEdit = AllowEdit.Checked ? 1 : 0;
            bpms_roles.AllowDelete = AllowDelete.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_roles.RoleId = _key;
                bpms_roles.ModifyDate = DateTime.Now;
                bpms_roles.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_roles.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_rolesibll.Update(bpms_roles);
                if (IsOk) { ShowMsgHelper.AlertParmCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_roles.OrganizationId = _OrganizationId;
                bpms_roles.RoleId = CommonHelper.GetGuid;
                bpms_roles.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_roles.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_rolesibll.Insert(bpms_roles);
                if (IsOk) { ShowMsgHelper.AlertParmCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}