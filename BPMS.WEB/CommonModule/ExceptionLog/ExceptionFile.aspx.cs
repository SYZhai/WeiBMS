using DotNet.Kernel;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.ExceptionLog
{
    public partial class ExceptionFile : System.Web.UI.Page
    {
        public StringBuilder strHtml = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string path = ConfigHelper.GetValue("LogFilePath");
                StringCollection s = GetAllFiles(path);
            }
        }
        /// <summary>
        /// 遍历 rootdir目录下的所有文件
        /// </summary>
        /// <param name="rootdir">目录名称</param>
        /// <returns>该目录下的所有文件</returns>
        public StringCollection GetAllFiles(string rootdir)
        {
            StringCollection result = new StringCollection();
            GetAllFiles(rootdir, result);
            return result;
        }
        /// <summary>
        /// 作为遍历文件函数的子函数
        /// </summary>
        /// <param name="parentDir">目录名称</param>
        /// <param name="result">该目录下的所有文件</param>
        public void GetAllFiles(string parentDir, StringCollection result)
        {
            //获取目录parentDir下的所有的子文件夹
            string[] dir = Directory.GetDirectories(parentDir);
            strHtml.Append("<ul>");
            for (int i = 0; i < dir.Length; i++)
            {
                strHtml.Append("<li>");
                strHtml.Append("<div><img src='/Themes/images/16/folder_bug.png' style='vertical-align: middle;' alt=''/>" + System.IO.Path.GetFileName(dir[i]) + "");
                strHtml.Append("</div>");
                GetAllFiles(dir[i], result);
                strHtml.Append("</li>");
            }
            strHtml.Append("</ul>");
            //获取目录parentDir下的所有的文件，并过滤得到所有的文本文件
            string[] file = Directory.GetFiles(parentDir);
            strHtml.Append("<ul style='display:none'>");
            for (int i = 0; i < file.Length; i++)
            {
                strHtml.Append("<li title='" + System.IO.Path.GetFileName(file[i]) + "'>");
                strHtml.Append("<div onclick=\"FileName('" + DESEncrypt.Encrypt(file[i].ToString()) + "')\"><img src='/Themes/images/16/page_white_error.png' style='vertical-align: middle;' alt=''/>" + System.IO.Path.GetFileName(file[i]) + "");
                strHtml.Append("</div>");
                //创建子节点
                strHtml.Append("</li>");
                result.Add(file[i]);
            }
            strHtml.Append("</ul>");
        }
    }
}