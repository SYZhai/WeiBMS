using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Dictionary
{
    public partial class ItemDetailsForm : System.Web.UI.Page
    {
        BPMS_ItemDetailsIBLL bpms_itemdetailsibll = new BPMS_ItemDetailsBLL();
        BPMS_ItemDetails bpms_itemdetails = new BPMS_ItemDetails();
        string _key, _ItemsId;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            _ItemsId = Request["ItemsId"];                  //字典类别主键
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
            if (!string.IsNullOrEmpty(_key))
            {
                bpms_itemdetails = bpms_itemdetailsibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_itemdetails);
            }
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            bool IsOk = false;
            bpms_itemdetails = ControlBindHelper.GetWebControls<BPMS_ItemDetails>(this.Page);
            bpms_itemdetails.Enabled = Enabled.Checked ? 1 : 0;
            bpms_itemdetails.AllowEdit = AllowEdit.Checked ? 1 : 0;
            bpms_itemdetails.AllowDelete = AllowDelete.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_itemdetails.ItemDetailsId = _key;
                bpms_itemdetails.ModifyDate = DateTime.Now;
                bpms_itemdetails.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_itemdetails.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_itemdetailsibll.Update(bpms_itemdetails);
                if (IsOk) { ShowMsgHelper.AlertParmCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_itemdetails.ItemDetailsId = CommonHelper.GetGuid;
                bpms_itemdetails.ItemsId = _ItemsId;
                bpms_itemdetails.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_itemdetails.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_itemdetailsibll.Insert(bpms_itemdetails);
                if (IsOk) { ShowMsgHelper.AlertParmCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}