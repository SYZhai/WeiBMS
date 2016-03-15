using BPMS.Entity;
using BPMS.IBusiness;
using BPMS.Business;
using DotNet.Utilities;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Dictionary
{
    public partial class ItemDetailsList : System.Web.UI.Page
    {
        BPMS_ItemDetailsIBLL bpms_itemdetailsibll = new BPMS_ItemDetailsBLL();
        BPMS_ItemDetails bpms_itemdetails = new BPMS_ItemDetails();
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
            string ItemsId = HttpContext.Current.Request["ItemsId"];                                        //字段类别主键
            switch (active)
            {
                case "GridBindList"://加载列表
                    Response.Write(JsonHelper.PqGridJson<BPMS_ItemDetails>(bpms_itemdetailsibll.GetListByItemsId(ItemsId), pqGrid_Sort));
                    Response.End();
                    break;
                case "Delete":    //删除数据
                    Response.Write(bpms_itemdetailsibll.Delete(key));
                    Response.End();
                    break;
                case "autocomplete"://自动补全，返回JSON
                    Response.Write(JsonHelper.ListToJson<BPMS_ItemDetails>(bpms_itemdetailsibll.GetListByItemsId(ItemsId), "JSON"));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}