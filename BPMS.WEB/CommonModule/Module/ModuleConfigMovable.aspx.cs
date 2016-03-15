using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Module
{
    public partial class ModuleConfigMovable : System.Web.UI.Page
    {
        BPMS_TableColumnsIBLL bpms_tablecolumnsibll = new BPMS_TableColumnsBLL();
        BPMS_TableColumns bpms_tablecolumns = new BPMS_TableColumns();
        string _Menu_Id;
        protected void Page_Load(object sender, EventArgs e)
        {
            _Menu_Id = Request["Menu_Id"];                  //模块菜单主键
            if (!IsPostBack)
            {
                InitBind();
            }
        }
        /// <summary>
        /// 加载，未选择字段、己选择字段
        /// </summary>
        public void InitBind()
        {
            if (!string.IsNullOrEmpty(_Menu_Id))
            {
                IList list = bpms_tablecolumnsibll.GetList(_Menu_Id);

                //未选择字段
                IList itemfrom_sel = IListHelper.IListToList<BPMS_TableColumns>(list).FindAll(t => t.IsPublic == 0);
                ControlBindHelper.BindHtmlSelect(itemfrom_sel, search_fields_from_sel, "Title", "TableColumnsId", "");
                //己选择字段
                IList itemto_sel = IListHelper.IListToList<BPMS_TableColumns>(list).FindAll(t => t.IsPublic == 1);
                ControlBindHelper.BindHtmlSelect(itemto_sel, search_fields_to_sel, "Title", "TableColumnsId", "");
            }
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            string[] array = new string[0];
            if (!string.IsNullOrEmpty(hidden_allInfo.Value))
            {
                array = hidden_allInfo.Value.Split('≌');
            }
            bool IsOk = false;
            IsOk = bpms_tablecolumnsibll.BatchIsPublic(array, _Menu_Id);
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