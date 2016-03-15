using BPMS.Business;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace BPMS.WEB.CommonModule.UserPermission
{
    /// <summary>
    /// UserButtonPermission1 的摘要说明
    /// </summary>
    public class UserButtonPermission1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            context.Response.Expires = 0;
            context.Response.CacheControl = "no-cache";
            context.Response.AddHeader("Pragma", "No-Cache");
            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string UserId = HttpContext.Current.Request["UserId"];                                          //用户主键
            string ButtonId = HttpContext.Current.Request["ButtonId"];                                      //按钮主键
            BPMS_UserMenuButtonIBLL bpms_usermenubuttonibll = new BPMS_UserMenuButtonBLL();
            switch (active)
            {
                case "AddButtonPermission"://分配角色权限
                    string[] array = new string[0];
                    if (!string.IsNullOrEmpty(ButtonId))
                    {
                        array = ButtonId.Split('≌');
                    }
                    string CreateUserId = RequestSession.GetSessionUser().UserId;
                    string CreateUserName = RequestSession.GetSessionUser().UserName;
                    CacheHelper.RemoveAllCache();
                    context.Response.Write(bpms_usermenubuttonibll.AddButtonPermission(array, UserId, CreateUserId, CreateUserName));
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