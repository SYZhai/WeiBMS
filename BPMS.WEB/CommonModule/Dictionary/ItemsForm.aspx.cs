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
    public partial class ItemsForm : System.Web.UI.Page
    {
        BPMS_ItemsIBLL bpms_itemsibll = new BPMS_ItemsBLL();
        BPMS_Items bpms_items = new BPMS_Items();
        string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            if (!IsPostBack)
            {
                SortCode.Value = bpms_itemsibll.GetMaxCode().ToString();
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
                bpms_items = bpms_itemsibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_items);
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
            bpms_items = ControlBindHelper.GetWebControls<BPMS_Items>(this.Page);
            bpms_items.Enabled = Enabled.Checked ? 1 : 0;
            bpms_items.AllowEdit = AllowEdit.Checked ? 1 : 0;
            bpms_items.AllowDelete = AllowDelete.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_items.ItemsId = _key;
                bpms_items.ModifyDate = DateTime.Now;
                bpms_items.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_items.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_itemsibll.Update(bpms_items);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_items.ItemsId = CommonHelper.GetGuid;
                bpms_items.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_items.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_itemsibll.Insert(bpms_items);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}