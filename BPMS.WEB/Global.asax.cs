using BPMS.Service;
using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BPMS.WEB
{
    public class Global : System.Web.HttpApplication
    {
        /// <summary>
        /// 创建系统异常日志
        /// </summary>
        protected LogHelper Logger = new LogHelper("Global");
        protected void Application_Start(object sender, EventArgs e)
        {
            //设置当前数据库类型
            DataFactory.DbType = (SqlSourceType)Enum.Parse(typeof(SqlSourceType), ConfigHelper.GetValue("ComponentDbType"), true);
            // 计算人数
            Application.Lock();
            Application["CurrentUsers"] = 0;
            Application.UnLock();
            #region 定时器
            System.Timers.Timer myTimer = new System.Timers.Timer(60000);
            myTimer.Elapsed += new System.Timers.ElapsedEventHandler(OnTimedEvent);
            myTimer.Interval = 1000;//
            myTimer.Enabled = true;
            #endregion
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // 计算人数
            Application.Lock();
            Application["CurrentUsers"] = (int)Application["CurrentUsers"] + 1;
            Application.UnLock();
        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["CurrentUsers"] = (int)Application["CurrentUsers"] - 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 错误处理页面
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void Application_Error(object sender, EventArgs e)
        {
            Exception objErr = Server.GetLastError().GetBaseException();
            StringBuilder sberror = new StringBuilder();
            sberror.Append("1.异常页面: " + RequestHelper.GetScriptName + "<br>");
            sberror.Append("2.异常信息: " + objErr.Message + "<br>");
            string Dberror = DbErrorMsg.ReturnMsg;
            if (Dberror != null && Dberror.Length > 0)
            {
                sberror.Append("3.异常信息: " + Dberror + "<br>");
            }
            Server.ClearError();
            Application["error"] = sberror;
            Response.Redirect("~/ErrorPage/Error.aspx");
        }
        protected void Application_End(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 定时器触发事件
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        private void OnTimedEvent(object source, System.Timers.ElapsedEventArgs e)
        {
            BackupsDataTime();
        }
        /// <summary>
        /// 定时自动备份数据库
        /// </summary>
        public void BackupsDataTime()
        {
            if (ConfigHelper.GetValue("IsBackupsData").Equals("true"))//判断是否启动自动备份数据库
            {
                if (DateTime.Now.ToString("HH:mm:ss").Equals(ConfigHelper.GetValue("BackupsDataTime")))
                {
                    Logger.WriteLog("定时自动备份数据库时间到了");
                }
            }
        }
    }
}