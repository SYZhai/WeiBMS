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

namespace BPMS.WEB.CommonModule.Role
{
    public partial class RolePermission : System.Web.UI.Page
    {
        BPMS_RolesIBLL bpms_rolesibll = new BPMS_RolesBLL();
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
            string OrganizationId = HttpContext.Current.Request["OrganizationId"];                          //公司主键
            string RoleId = HttpContext.Current.Request["RoleId"];                                          //角色主键
            switch (active)
            {
                case "InitRoles"://加载角色列表
                    Response.Write(JsonHelper.ListToJson<BPMS_Roles>(bpms_rolesibll.GetList(OrganizationId), "JSON"));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}