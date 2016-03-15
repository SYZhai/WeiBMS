using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.ExampleModule.File
{
    public partial class FileList : System.Web.UI.Page
    {
        public StringBuilder sb_File = new StringBuilder();
        BASE_FileIBLL base_fileibll = new BASE_FileBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFile();
            }
        }
        #region 加载附件
        /// <summary>
        /// 加载附件
        /// </summary>
        public void LoadFile()
        {
            IList list = base_fileibll.GetList();
            foreach (BASE_File entity in list)
            {
                string strName = entity.FileName.Substring(entity.FileName.LastIndexOf("\\") + 1, (entity.FileName.LastIndexOf(".") - entity.FileName.LastIndexOf("\\") - 1));
                string title = entity.FileName + "\r\n创建时间：" + entity.CreateDate + "\r\n大小：" + entity.FileSize;
                sb_File.Append("<div id='" + entity.FileId + "≌" + entity.Extensions + "' class=\"Fileshortcuticons\" title='" + title + "'>");
                sb_File.Append("<img title='" + title + "' src=\"/Themes/Images/Format/" + ToImg(entity.Extensions) + "\" alt=\"\" width=\"90\" height=\"90\" /><br />" + strName + "</div>");
            }
        }
        public string ToImg(string Extension)
        {
            switch (Extension)
            {
                case ".docx":
                    return "word.png";
                case ".doc":
                    return "word.png";
                case ".xlsx":
                    return "excel.png";
                case ".xls":
                    return "excel.png";
                case ".pptx":
                    return "ppt.png";
                case ".ppt":
                    return "ppt.png";
                case ".txt":
                    return "txt.png";
                case ".pdf":
                    return "pdf.png";
                case ".zip":
                    return "zip.png";
                case ".rar":
                    return "rar.png";
                case ".png":
                    return "img.png";
                case ".gif":
                    return "img.png";
                case ".jpg":
                    return "img.png";
                default:
                    return "else.png";
            }
        }
        #endregion
    }
}