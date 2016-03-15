using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BPMS.Entity;
using BPMS.Business;
using BPMS.IBusiness;
using DotNet.Utilities;


namespace BPMS.WEB.QYManager
{
    public partial class BPMS_QYNumberForm : System.Web.UI.Page
    {
        BPMS_QYNumberIBLL bpms_qynumberibll = new BPMS_QYNumberBLL();
        BPMS_QYNumber bpms_qynumber = new BPMS_QYNumber();
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
            if (!string.IsNullOrEmpty(_key))
            {
                bpms_qynumber = bpms_qynumberibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_qynumber);
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
            bpms_qynumber = ControlBindHelper.GetWebControls<BPMS_QYNumber>(this.Page);
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_qynumber.QYId = _key;
                //bpms_qynumber.ModifyDate = DateTime.Now;
                //bpms_qynumber.ModifyUserId = RequestSession.GetSessionUser().UserId.ToString();
                //bpms_qynumber.ModifyUserName = RequestSession.GetSessionUser().UserName.ToString();
                IsOk = bpms_qynumberibll.Update(bpms_qynumber);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_qynumber.QYId = CommonHelper.GetGuid;
                bpms_qynumber.CreateUserId = RequestSession.GetSessionUser().UserId.ToString();
                bpms_qynumber.CreateUserName = RequestSession.GetSessionUser().UserName.ToString();
                IsOk = bpms_qynumberibll.Insert(bpms_qynumber);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}



