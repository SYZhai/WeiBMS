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

namespace BPMS.WEB.CommonModule.Button
{
    public partial class ButtonList : PageBase
    {
        BPMS_ButtonIBLL bpms_buttonibll = new BPMS_ButtonBLL();
        BPMS_Button bpms_button = new BPMS_Button();
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
            string Parm_Key_Value = HttpContext.Current.Request["Parm_Key_Value"];                          //搜索条件键值
            switch (active)
            {
                case "GridBindList"://加载列表
                    Hashtable parm = HashtableHelper.String_Key_ValueToHashtable(Parm_Key_Value);
                    Response.Write(JsonHelper.PqGridJson<BPMS_Button>(bpms_buttonibll.GetListWhere(parm), pqGrid_Sort));
                    Response.End();
                    break;
                case "Delete":    //删除数据
                    Response.Write(bpms_buttonibll.Delete(key));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}