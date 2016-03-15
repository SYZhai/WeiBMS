using BPMS.Business;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.DataBase
{
    public partial class DataBaseList : System.Web.UI.Page
    {
        BPMS_DataBaseIBLL bpms_databaseibll = new BPMS_DataBaseBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAction();
        }
        public void LoadAction()
        {
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AddHeader("Pragma", "No-Cache");
            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string orderField = HttpContext.Current.Request["pqGrid_OrderField"];                           //排序字段
            string orderType = HttpContext.Current.Request["pqGrid_OrderType"];                             //排序类型
            string pqGrid_Sort = HttpContext.Current.Request["pqGrid_Sort"];                                //要显示字段
            string tableCode = HttpContext.Current.Request["tableCode"];                                    //表名
            switch (active)
            {
                case "pqGrid_List":
                    string str = JsonHelper.PqGridJson(bpms_databaseibll.GetSysColumns(tableCode), pqGrid_Sort);
                    Response.Write(str);
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}