using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.ExceptionLog
{
    public partial class ExceptionText : System.Web.UI.Page
    {
        public string _FilePath;
        protected void Page_Load(object sender, EventArgs e)
        {
            _FilePath = Server.UrlDecode(Request["FilePath"]);
            if (!IsPostBack)
            {
                if (_FilePath != null)
                {
                    _FilePath = DESEncrypt.Decrypt(_FilePath);
                    GetTxtValue();
                    LblFile.Text = System.IO.Path.GetFileName(_FilePath);
                }
            }
        }
        public void GetTxtValue()
        {
            string filepath = _FilePath;
            if (System.IO.File.Exists(filepath))
            {
                StreamReader sr = new StreamReader(filepath, Encoding.GetEncoding("UTF-8"));//取得这txt文件的编码
                string txtvalue = sr.ReadToEnd().ToString();
                sr.Close();
                txtLog.InnerText = txtvalue;
            }
        }
        /// <summary>
        /// 清空txt数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void hlkempty_Click1(object sender, EventArgs e)
        {
            string filepath = _FilePath;
            FileStream fs = new FileStream(filepath, FileMode.Create, FileAccess.Write); fs.Close();
            ShowMsgHelper.ShowScript("Alert_Ok()");
        }
    }
}