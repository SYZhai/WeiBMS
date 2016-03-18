using BPMS.Entity;
using BPMS.IBusiness;
using BPMS.Business;
using DotNet.Utilities;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using QY.API;

namespace BPMS.WEB.CommonModule.Employee
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        BPMS_EmployeeIBLL bpms_employeeibll = new BPMS_EmployeeBLL();
        BPMS_Employee bpms_employee = new BPMS_Employee();
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
            string Category = HttpContext.Current.Request["Category"];                                      //机构分类
            string OrganizationId = HttpContext.Current.Request["OrganizationId"];                          //机构主键
            string Parm_Key_Value = HttpContext.Current.Request["Parm_Key_Value"];                          //搜索条件键值
            string search = HttpContext.Current.Request["search"];                                          //模糊查询条件
            switch (active)
            {
                case "GridBindList"://加载列表
                    int count = 0;
                    Hashtable parm = HashtableHelper.String_Key_ValueToHashtable(Parm_Key_Value);
                    parm["Category"] = Category;
                    parm["OrganizationId"] = OrganizationId;
                    Response.Write(JsonHelper.PqGridPageJson<BPMS_Employee>(bpms_employeeibll.GetPageList(parm,orderField, orderType, pageIndex, pageSize, ref count), pageIndex, pqGrid_Sort, count));
                    Response.End();
                    break;
                case "Delete":    //删除数据
                    //保存成功后将数据同步到微信企业号
                    bpms_employee = bpms_employeeibll.GetEntity(key);
                    if (!myCommFun.DeleteMember(bpms_employee.Code))
                    {
                        ShowMsgHelper.AlertCallback(MessageHelper.MSG0032);
                    }
                    Response.Write(bpms_employeeibll.Delete(key));
                    Response.End();
                    break;
                case "autocomplete"://员工自动补全，返回JSON
                    Response.Write(JsonHelper.ListToJson<BPMS_Employee>(bpms_employeeibll.autocomplete(search), "JSON"));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}