using DotNet.Utilities.DotNetFile;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Module
{
    public partial class ModuleIcon : System.Web.UI.Page
    {
        public StringBuilder strImg = new StringBuilder();
        string _Size;
        protected void Page_Load(object sender, EventArgs e)
        {
            _Size = Request["Size"];//图标类型，32,16
            this.PageControl.pageHandler += new EventHandler(pager_PageChanged);
            if (!IsPostBack)
            {
                if (_Size != null)
                {
                    hidden_Size.Value = _Size;
                }
            }
        }
        /// <summary>
        /// 绑定数据，分页
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            GetImg();
        }
        public void GetImg()
        {
            int PageSize = 0;
            int PageIndex = this.PageControl.PageIndex;
            DirectoryInfo dir;
            if (hidden_Size.Value == "32")
            {
                PageSize = this.PageControl.PageSize = 100;
                dir = new DirectoryInfo(Server.MapPath("/Themes/Images/32/"));
            }
            else
            {
                PageSize = this.PageControl.PageSize = 200;
                dir = new DirectoryInfo(Server.MapPath("/Themes/Images/16/"));
            }
            int rowCount = 0;
            int rowbegin = (PageIndex - 1) * PageSize;
            int rowend = PageIndex * PageSize;
            FileInfo[] files = dir.GetFiles();
            MyDateSorter.QuickSort(files, 0, files.Length - 1);//按时间排序
            foreach (FileInfo fsi in files)
            {
                if (rowCount >= rowbegin && rowCount < rowend)
                {
                    strImg.Append("<div class=\"divicons\" title='" + fsi.Name + "'>");
                    strImg.Append("<img src=\"/Themes/Images/" + hidden_Size.Value + "/" + fsi.Name + "\" />");
                    strImg.Append("</div>");
                }
                rowCount++;
            }
            this.PageControl.RecordCount = Convert.ToInt32(rowCount);
        }
    }
}