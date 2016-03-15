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

namespace BPMS.WEB.CommonModule.Module
{
    public partial class ModuleConfigForm : System.Web.UI.Page
    {
        BPMS_TableColumnsIBLL bpms_tablecolumnsibll = new BPMS_TableColumnsBLL();
        BPMS_TableColumns bpms_tablecolumns = new BPMS_TableColumns();
        string _key, _Menu_Id;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            _Menu_Id = Request["Menu_Id"];                  //模块菜单主键
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
                bpms_tablecolumns = bpms_tablecolumnsibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_tablecolumns);
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
            bpms_tablecolumns = ControlBindHelper.GetWebControls<BPMS_TableColumns>(this.Page);
            bpms_tablecolumns.MenuId = _Menu_Id;
            bpms_tablecolumns.IsPublic = IsPublic.Checked ? 1 : 0;
            bpms_tablecolumns.IsHidden = IsHidden.Checked ? 1 : 0;
            bpms_tablecolumns.Enabled = Enabled.Checked ? 1 : 0;
            bpms_tablecolumns.AllowEdit = AllowEdit.Checked ? 1 : 0;
            bpms_tablecolumns.AllowDelete = AllowDelete.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_tablecolumns.TableColumnsId = _key;
                bpms_tablecolumns.ModifyDate = DateTime.Now;
                bpms_tablecolumns.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_tablecolumns.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_tablecolumnsibll.Update(bpms_tablecolumns);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_tablecolumns.TableColumnsId = CommonHelper.GetGuid;
                bpms_tablecolumns.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_tablecolumns.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_tablecolumnsibll.Insert(bpms_tablecolumns);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}