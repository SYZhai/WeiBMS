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
    public partial class ModuleConfigList : System.Web.UI.Page
    {
        BPMS_TableColumnsIBLL bpms_tablecolumnsibll = new BPMS_TableColumnsBLL();
        BPMS_TableColumns bpms_tablecolumns = new BPMS_TableColumns();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAction();
            }
        }
        public void LoadAction()
        {
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AddHeader("Pragma", "No-Cache");

            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string pqGrid_Sort = HttpContext.Current.Request["pqGrid_Sort"];                                //要显示字段
            string key = HttpContext.Current.Request["key"];                                                //主键
            string MenuId = HttpContext.Current.Request["MenuId"];                                          //模块菜单主键
            switch (active)
            {
                case "GridBindList"://加载列表
                    Response.Write(JsonHelper.PqGridJson<BPMS_TableColumns>(bpms_tablecolumnsibll.GetList(MenuId), pqGrid_Sort));
                    Response.End();
                    break;
                case "Delete":    //删除数据
                    Response.Write(bpms_tablecolumnsibll.Delete(key));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}