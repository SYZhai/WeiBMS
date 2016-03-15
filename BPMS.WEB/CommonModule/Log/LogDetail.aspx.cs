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

namespace BPMS.WEB.CommonModule.Log
{
    public partial class LogDetail : System.Web.UI.Page
    {
        BPMS_SysLogIBLL bpms_syslogsibll = new BPMS_SysLogBLL();
        string _SyslogsId, _status;
        protected void Page_Load(object sender, EventArgs e)
        {
            _SyslogsId = Request["SyslogsId"];
            _status = Request["status"];
            if (!IsPostBack)
            {
                LoadAction();
                if (int.Parse(_status) > 3)
                {
                    IList list =  bpms_syslogsibll.GetLogDetailList(_SyslogsId);
                    foreach (BPMS_SysLogDetails item in list)
                    {
                        Other.InnerHtml = item.Remark;
                        break;
                    }
                }
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
            string SyslogsId = HttpContext.Current.Request["SyslogsId"];                                    //主键
            switch (active)
            {
                case "GridBindList"://加载列表
                    Response.Write(JsonHelper.PqGridJson<BPMS_SysLogDetails>(bpms_syslogsibll.GetLogDetailList(SyslogsId), pqGrid_Sort));
                    Response.End();
                    break;
                default:
                    break;
            }
        }

    }
}