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
    public partial class LogList : PageBase
    {
        BPMS_SysLogIBLL bpms_syslogsibll = new BPMS_SysLogBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                start_Date.Value = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd 00:00");
                end_Date.Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
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
            string Parm_Key_Value = HttpContext.Current.Request["Parm_Key_Value"];                          //搜索条件键值
            switch (active)
            {
                case "GridBindList"://加载列表
                    int count = 0;
                    Hashtable parm = HashtableHelper.String_Key_ValueToHashtable(Parm_Key_Value);
                    Response.Write(JsonHelper.PqGridPageJson<BPMS_SysLogs>(bpms_syslogsibll.GetLogList(parm,orderField, orderType, pageIndex, pageSize, ref count), pageIndex, pqGrid_Sort, count));
                    Response.End();
                    break;
                default:
                    break;
            }
        }

    }
}