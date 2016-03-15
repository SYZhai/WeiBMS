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

namespace BPMS.WEB.ExampleModule.News
{
    public partial class NewsList : System.Web.UI.Page
    {
        BASE_NewsIBLL base_newsibll = new BASE_NewsBLL();
        BASE_News base_news = new BASE_News();
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
            int pageIndex = CommonHelper.GetInt(HttpContext.Current.Request["pqGrid_PageIndex"]);           //当前页
            int pageSize = CommonHelper.GetInt(HttpContext.Current.Request["pqGrid_PageSize"]);             //当前页大小
            string orderField = HttpContext.Current.Request["pqGrid_OrderField"];                           //排序字段  
            string orderType = HttpContext.Current.Request["pqGrid_OrderType"];                             //排序类型
            string pqGrid_Sort = HttpContext.Current.Request["pqGrid_Sort"];                                //要显示字段
            string key = HttpContext.Current.Request["key"];                                                //主键
            switch (active)
            {
                case "GridBindList"://加载列表
                    int count = 0;
                    Response.Write(JsonHelper.PqGridPageJson<BASE_News>(base_newsibll.GetPageList(orderField, orderType, pageIndex, pageSize, ref count), pageIndex, pqGrid_Sort, count));
                    Response.End();
                    break;
                case "Delete":    //删除数据
                    Response.Write(base_newsibll.Delete(key));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}