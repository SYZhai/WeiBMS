using BPMS.Entity;
using BPMS.IBusiness;
using BPMS.Business;
using DotNet.Utilities;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Role
{
    public partial class RoleList : System.Web.UI.Page
    {

        BPMS_RolesIBLL bpms_rolesibll = new BPMS_RolesBLL();
        BPMS_Roles bpms_roles = new BPMS_Roles();
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
            string OrganizationId = HttpContext.Current.Request["OrganizationId"];                          //公司主键
            switch (active)
            {
                case "GridBindList"://加载列表
                    Response.Write(JsonHelper.PqGridJson<BPMS_Roles>(bpms_rolesibll.GetList(OrganizationId), pqGrid_Sort));
                    Response.End();
                    break;
                case "InitRoles"://加载列表
                    Response.Write(JsonHelper.ListToJson<BPMS_Roles>(bpms_rolesibll.GetList(OrganizationId), "JSON"));
                    Response.End();
                    break;
                case "Delete":    //删除数据
                    bpms_roles = bpms_rolesibll.GetEntity(key);
                    if (bpms_roles.AllowDelete == 0)
                    {
                        Response.Write(string.Format(MessageHelper.MSG0009, bpms_roles.FullName));
                        Response.End();
                    }
                    else
                    {
                        Response.Write(bpms_rolesibll.Delete(key));
                        Response.End();
                    }
                    break;
                default:
                    break;
            }
        }
    }
}