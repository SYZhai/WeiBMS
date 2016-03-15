using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Employee
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        BPMS_EmployeeIBLL bpms_employeeibll = new BPMS_EmployeeBLL();
        BPMS_Employee bpms_employee = new BPMS_Employee();
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
                bpms_employee = bpms_employeeibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_employee);
                hiddenCompanyId.Value = bpms_employee.CompanyId;
                hiddenDepartmentId.Value = bpms_employee.DepartmentId;
                hiddenWorkgroupId.Value = bpms_employee.WorkgroupId;
            }
        }
        /// <summary>
        /// 初始化绑定下拉框
        /// </summary>
        public void InitBindDrop()
        {
            BPMS_ItemDetailsIBLL bpms_itemdetailsibll = new BPMS_ItemDetailsBLL();
            IList list = bpms_itemdetailsibll.GetList();
            //最高学历
            IList EducationList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "1559ff6d-8b04-48f7-952c-333305bc526d");
            ControlBindHelper.BindHtmlSelect(EducationList, Education, "ItemName", "ItemCode", "==请选择==");
            //最高学位
            IList DegreeList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "964d6a06-5282-4fcb-b805-f192ae0de922");
            ControlBindHelper.BindHtmlSelect(DegreeList, Degree, "ItemName", "ItemCode", "==请选择==");
            //职称
            IList TitleIdList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "2acba9e8-5fa7-4b6f-8ebd-56e753dd059a");
            ControlBindHelper.BindHtmlSelect(TitleIdList, TitleId, "ItemName", "ItemCode", "==请选择==");
            //职称等级
            IList TitleLevelList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "b65809f0-3b7b-44d1-b2f5-c93ef9afa12d");
            ControlBindHelper.BindHtmlSelect(TitleLevelList, TitleLevel, "ItemName", "ItemCode", "==请选择==");
            //职位
            IList DutyIdList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "137a2d97-d1d9-4752-9c5e-239097e2ed68");
            ControlBindHelper.BindHtmlSelect(DutyIdList, DutyId, "ItemName", "ItemCode", "==请选择==");
            //用工性质
            IList WorkingPropertyList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "0e08fdaa-8e7a-4890-98d5-e2f36f55c512");
            ControlBindHelper.BindHtmlSelect(WorkingPropertyList, WorkingProperty, "ItemName", "ItemCode", "==请选择==");
            //政治面貌
            IList PartyList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "44e210fb-5afd-4511-a56c-a438d947d5bc");
            ControlBindHelper.BindHtmlSelect(PartyList, Party, "ItemName", "ItemCode", "==请选择==");
            //国籍
            IList NationList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "e2e78aec-31f7-4de5-af7b-bb5bc7c09a61");
            ControlBindHelper.BindHtmlSelect(NationList, Nation, "ItemName", "ItemCode", "==请选择==");
            //民族
            IList NationalityList = IListHelper.IListToList<BPMS_ItemDetails>(list).FindAll(t => t.ItemsId == "104bfd21-5bbe-4b96-b5c2-448b84dbe0d8");
            ControlBindHelper.BindHtmlSelect(NationalityList, Nationality, "ItemName", "ItemCode", "==请选择==");
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            bool IsOk = false;
            bpms_employee = ControlBindHelper.GetWebControls<BPMS_Employee>(this.Page);
            bpms_employee.Enabled = Enabled.Checked ? 1 : 0;
            bpms_employee.IsDimission = IsDimission.Checked ? 1 : 0;
            bpms_employee.CompanyId = hiddenCompanyId.Value;
            bpms_employee.DepartmentId = hiddenDepartmentId.Value;
            bpms_employee.WorkgroupId = hiddenWorkgroupId.Value;
            bpms_employee.Spell = PinyinHelper.PinyinString(bpms_employee.RealName);
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_employee.EmployeeId = _key;
                bpms_employee.ModifyDate = DateTime.Now;
                bpms_employee.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_employee.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_employeeibll.Update(bpms_employee);
                if (IsOk) { ShowMsgHelper.AlertParmCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_employee.EmployeeId = CommonHelper.GetGuid;
                bpms_employee.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_employee.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_employeeibll.Insert(bpms_employee);
                if (IsOk) { ShowMsgHelper.AlertParmCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}