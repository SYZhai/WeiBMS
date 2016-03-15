using BPMS.Business;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace BPMS.WEB.CommonModule.Role
{
    /// <summary>
    /// ModulePermission1 的摘要说明
    /// </summary>
    public class ModulePermission1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            context.Response.Expires = 0;
            context.Response.CacheControl = "no-cache";
            context.Response.AddHeader("Pragma", "No-Cache");
            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string RoleId = HttpContext.Current.Request["RoleId"];                                          //角色主键
            string MenuId = HttpContext.Current.Request["MenuId"];                                          //模块菜单主键主键
            BPMS_RoleMenuIBLL bpms_rolemenuibll = new BPMS_RoleMenuBLL();

            switch (active)
            {
                case "AddModulePermission"://分配角色权限
                    string[] array = new string[0];
                    if (!string.IsNullOrEmpty(MenuId))
                    {
                        array = MenuId.Split(',');
                    }
                    string CreateUserId = RequestSession.GetSessionUser().UserId;
                    string CreateUserName = RequestSession.GetSessionUser().UserName;
                    CacheHelper.RemoveAllCache();
                    context.Response.Write(bpms_rolemenuibll.AddModulePermission(array, RoleId, CreateUserId, CreateUserName));
                    context.Response.End();
                    break;
                default:
                    break;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}