//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DotNet.Utilities
{
    /// <summary>
    /// 导出Word帮助类
    /// </summary>
    public class WordHelper
    {
        /// <summary>
        /// 创建系统异常日志
        /// </summary>
        protected static LogHelper Logger = new LogHelper("WordHelper");
        /// <summary>
        /// 导出Word
        /// </summary>
        /// <param name="sbHtml">html标签</param>
        /// <param name="fileName">文件名</param>
        public static void ExportWord(StringBuilder sbHtml, string fileName)
        {
            try
            {
                if (sbHtml.Length > 0)
                {
                    HttpContext.Current.Response.ContentType = "application/ms-word";
                    HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
                    HttpContext.Current.Response.Charset = "Utf-8";
                    HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName + ".doc", System.Text.Encoding.UTF8));
                    HttpContext.Current.Response.Write(sbHtml.ToString());
                    HttpContext.Current.Response.End();
                }
            }
            catch (Exception ex)
            {
                Logger.WriteLog(ex.ToString());
            }
        }
    }
}
