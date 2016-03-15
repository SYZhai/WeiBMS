using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.User
{
    public partial class UserForm : System.Web.UI.Page
    {
        BPMS_UserIBLL bpms_useribll = new BPMS_UserBLL();
        BPMS_User bpms_user = new BPMS_User();
        string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
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
                bpms_user = bpms_useribll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_user);
                Password.Attributes.Add("disabled", "true");
                hiddenCompanyId.Value = bpms_user.CompanyId;
                hiddenDepartmentId.Value = bpms_user.DepartmentId;
                hiddenWorkgroupId.Value = bpms_user.WorkgroupId;
                hiddenRoleId.Value = bpms_user.RoleId;
            }
        }
        /// <summary>
        /// 初始化绑定下拉框
        /// </summary>
        public void InitBindDrop()
        {
            BPMS_ItemDetailsIBLL bpms_itemdetailsibll = new BPMS_ItemDetailsBLL();
            IList list = bpms_itemdetailsibll.GetList();
            //职称
            IList TitleIdList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "2acba9e8-5fa7-4b6f-8ebd-56e753dd059a");
            ControlBindHelper.BindHtmlSelect(TitleIdList, TitleId, "ItemName", "ItemCode", "==请选择==");
            //职位
            IList DutyIdList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "137a2d97-d1d9-4752-9c5e-239097e2ed68");
            ControlBindHelper.BindHtmlSelect(DutyIdList, DutyId, "ItemName", "ItemCode", "==请选择==");
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            bool IsOk = false;
            bpms_user = ControlBindHelper.GetWebControls<BPMS_User>(this.Page);
            bpms_user.Enabled = Enabled.Checked ? 1 : 0;
            bpms_user.CompanyId = hiddenCompanyId.Value;
            bpms_user.DepartmentId = hiddenDepartmentId.Value;
            bpms_user.WorkgroupId = hiddenWorkgroupId.Value;
            bpms_user.RoleId = hiddenRoleId.Value;
            bpms_user.Spell = PinyinHelper.PinyinString(bpms_user.RealName);
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_user.UserId = _key;
                bpms_user.ModifyDate = DateTime.Now;
                bpms_user.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_user.ModifyUserName = RequestSession.GetSessionUser().UserName;
                bpms_user.Password = null;
                IsOk = bpms_useribll.Update(bpms_user);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_user.UserId = CommonHelper.GetGuid;
                bpms_user.Secretkey = Md5Helper.MD5(CommonHelper.CreateNo(), 16);
                string Password = DESEncrypt.Encrypt(bpms_user.Password, bpms_user.Secretkey);
                bpms_user.Password = Md5Helper.MD5(Password, 32);
                bpms_user.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_user.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_useribll.Insert(bpms_user);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}