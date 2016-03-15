using BPMS.CodeMatic.Code;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.CodeMatic.Frame
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 验证
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Landing_Click_Click(object sender, EventArgs e)
        {
            string connectstring = "";
            string sql = string.Format("select name from sys.databases");
            if (Authentication.Value =="1")
            {
                connectstring = string.Format(" data source={0}; initial catalog=master;integrated security=sspi", ServerName.Value);
            }
            else
            {
                connectstring = string.Format(" data source={0}; initial catalog=master;user id={1};password={2}", ServerName.Value, LoginName.Value, Password.Value);
            }
            try
            {
                DataTable dt = DataFactory.SqlHelper(connectstring.ToString()).GetDataTableBySQL(new StringBuilder(sql));
                if (dt !=null)
                {
                    Session["connectstring"] = connectstring;
                    Session["DBServerName"] = ServerName.Value;
                    Session["DBLoginName"] = LoginName.Value;
                    Session["DBPassword"] = Password.Value;
                    ShowMsgHelper.ShowScript("Callback()");
                }
                else
                {
                    ShowMsgHelper.Alert_Error("用户登录失败（请检查用户名和密码）");
                }
            }
            catch
            {
                ShowMsgHelper.Alert_Error("用户登录失败（请检查用户名和密码）");
            }
        }
    }
}