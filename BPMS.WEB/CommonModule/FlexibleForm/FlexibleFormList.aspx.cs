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
    public partial class FlexibleFormList : System.Web.UI.Page
    {
        BPMS_AppendPropertyIBLL bpms_appendpropertyibll = new BPMS_AppendPropertyBLL();
        BPMS_AppendProperty bpms_appendproperty = new BPMS_AppendProperty();
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
            string ParentId = HttpContext.Current.Request["ParentId"];                                      //主键
            switch (active)
            {
                case "GridBindList"://加载列表
                    Response.Write(JsonHelper.PqGridJson<BPMS_AppendProperty>(bpms_appendpropertyibll.GetList(ParentId), pqGrid_Sort));
                    Response.End();
                    break;
                case "Delete":    //删除数据
                    Response.Write(bpms_appendpropertyibll.Delete(key));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}