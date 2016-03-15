using BPMS.Entity;
using BPMS.Service;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace BPMS.WEB
{
    public class PageBase : System.Web.UI.Page
    {
        protected override void OnLoad(EventArgs e)
        {
            #region 当Session过期自动跳出登录画面
            if (RequestSession.GetSessionUser() == null)
            {
                Session.Abandon();  //取消当前会话
                Session.Clear();
                Response.Redirect("/Index.htm");
            }
            #endregion

            IsUrlPermission();

            base.OnLoad(e);
        }
        #region URL权限验证,加强安全验证防止未授权匿名不合法的请求
        /// <summary>
        /// URL权限验证,加强安全验证防止未授权匿名不合法的请求
        /// </summary>
        public void IsUrlPermission()
        {
            bool IsOK = false;
            //获取当前访问页面地址
            string requestPath = RequestHelper.GetScriptName;
            string[] filterUrl = { "/Frame/HomeIndex.aspx", "/RMBase/SysUser/UpdateUserPwd.aspx" };//过滤特别页面
            for (int i = 0; i < filterUrl.Length; i++)
            {
                if (requestPath == filterUrl[i])
                {
                    IsOK = true;
                    break;
                }
            }
            if (!IsOK)
            {
                string UserId = RequestSession.GetSessionUser().UserId;
                IList list = (IList)StorePermission.Instance.GetModulePermission(UserId);
                IList itemNode = IListHelper.IListToList<BPMS_ModulePermission>(list).FindAll(t => t.NavigateUrl == requestPath);
                if (itemNode.Count == 0)
                {
                    StringBuilder strHTML = new StringBuilder();
                    strHTML.Append("<div><script type=\"text/javascript\">alert('很抱歉！您的权限不足，访问被拒绝！')</script>");
                    strHTML.Append("</div>");
                    HttpContext.Current.Response.Write(strHTML.ToString());
                    HttpContext.Current.Response.End();
                }
            }

        }
        #endregion
    }
}