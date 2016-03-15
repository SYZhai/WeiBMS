//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Collections;
using System.Web.UI.WebControls;
using System.Threading;
using DotNet.Kernel;

namespace DotNet.Utilities
{
    /// <summary>
    /// Web帮助类
    /// </summary>
    public class WebHelper
    {
        #region 防止刷新重复提交
        /// <summary>
        /// 防止刷新重复提交
        /// </summary>
        /// <param name="btn">按钮控件</param>
        /// <returns></returns>
        public static bool SubmitCheckForm(LinkButton btn)
        {
            if (HttpContext.Current.Request.Form.Get("txt_hiddenToken").Equals(GetToken()))
            {
                SetToken();
                Thread.Sleep(500);////延迟500毫秒
                return true;
            }
            else
            {
                ShowMsgHelper.showWarningMsg("为了保证表单不重复提交，提交无效");
                return false;
            }
        }
        /// <summary>
        /// 获得当前Session里保存的标志
        /// </summary>
        /// <returns></returns>
        public static string GetToken()
        {
            HttpContext rq = HttpContext.Current;
            if (null != rq.Session["Token"])
            {
                return rq.Session["Token"].ToString();
            }
            else
            {
                return string.Empty;
            }
        }
        /// <summary>
        /// 生成标志，并保存到Session
        /// </summary>
        public static void SetToken()
        {
            HttpContext rq = HttpContext.Current;
            rq.Session.Add("Token", Md5Helper.MD5(rq.Session.SessionID + DateTime.Now.Ticks.ToString(), 32));
        }
        #endregion
    }
}
