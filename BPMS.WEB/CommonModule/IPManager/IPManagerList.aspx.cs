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

namespace BPMS.WEB.CommonModule.IPManager
{
    public partial class IPManagerList : PageBase
    {
        BPMS_IPBlacklistIBLL bpms_ipblacklistibll = new BPMS_IPBlacklistBLL();
        BPMS_IPBlacklist bpms_ipblacklist = new BPMS_IPBlacklist();
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
            string orderField = HttpContext.Current.Request["pqGrid_OrderField"];                           //排序字段  
            string orderType = HttpContext.Current.Request["pqGrid_OrderType"];                             //排序类型
            string pqGrid_Sort = HttpContext.Current.Request["pqGrid_Sort"];                                //要显示字段
            string key = HttpContext.Current.Request["key"];                                                //主键
            switch (active)
            {
                case "GridBindList"://加载列表
                    Response.Write(JsonHelper.PqGridJson<BPMS_IPBlacklist>(bpms_ipblacklistibll.GetList(), pqGrid_Sort));
                    Response.End();
                    break;
                case "Delete":    //删除数据
                    Response.Write(bpms_ipblacklistibll.Delete(key));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}