using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.FlexibleForm
{
    public partial class FlexibleFormForm : System.Web.UI.Page
    {
        BPMS_AppendPropertyIBLL bpms_appendpropertyibll = new BPMS_AppendPropertyBLL();
        BPMS_AppendProperty bpms_appendproperty = new BPMS_AppendProperty();
        string _key, _ParentId;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            _ParentId = Request["ParentId"];//业务类别
            if (!IsPostBack)
            {
                SortCode.Value = bpms_appendpropertyibll.GetMaxCode().ToString();
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
                bpms_appendproperty = bpms_appendpropertyibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_appendproperty);
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
            bpms_appendproperty = ControlBindHelper.GetWebControls<BPMS_AppendProperty>(this.Page);
            bpms_appendproperty.Enabled = Enabled.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_appendproperty.PropertyId = _key;
                bpms_appendproperty.ModifyDate = DateTime.Now;
                bpms_appendproperty.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_appendproperty.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_appendpropertyibll.Update(bpms_appendproperty);
                if (IsOk) { ShowMsgHelper.AlertParmCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_appendproperty.PropertyId = CommonHelper.GetGuid;
                bpms_appendproperty.ParentId = _ParentId;
                bpms_appendproperty.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_appendproperty.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_appendpropertyibll.Insert(bpms_appendproperty);
                if (IsOk) { ShowMsgHelper.AlertParmCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}