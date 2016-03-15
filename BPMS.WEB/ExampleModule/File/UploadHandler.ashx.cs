using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace BPMS.WEB.ExampleModule.File
{
    /// <summary>
    /// UploadHandler 的摘要说明
    /// </summary>
    public class UploadHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";
            string active = HttpContext.Current.Request["action"];
            BASE_FileIBLL base_fileibll = new BASE_FileBLL();
            switch (active)
            {
                case "Uploadify": //上传文件
                    HttpPostedFile file = context.Request.Files["Filedata"];
                    string uploadPath = HttpContext.Current.Server.MapPath(@context.Request["folder"]) + "\\";
                    if (file != null)
                    {
                        string _FileName = file.FileName;
                        string _FileSize = FileHelper.CountSize(file.ContentLength);
                        string _Extension = System.IO.Path.GetExtension(file.FileName).ToLower();
                        BASE_File entity = new BASE_File();
                        entity.FileId = CommonHelper.GetGuid;
                        entity.Extensions = _Extension;
                        entity.FileName = _FileName;
                        entity.FileType = "文件";
                        entity.FileSize = _FileSize;
                        entity.CreateUserId = RequestSession.GetSessionUser().UserId;
                        entity.CreateUserName = RequestSession.GetSessionUser().UserName;
                        base_fileibll.Insert(entity);
                        if (!Directory.Exists(uploadPath))
                        {
                            Directory.CreateDirectory(uploadPath);
                        }
                        file.SaveAs(uploadPath + entity.FileId + _Extension);
                        context.Response.Write("1");
                    }
                    else
                    {
                        context.Response.Write("0");
                    }
                    break;
                case "Delete"://删除文件
                    string key = HttpContext.Current.Request["key"];
                    object[] str = key.Split('≌');
                    if (base_fileibll.Delete(str[0].ToString()))
                    {
                        string path = HttpContext.Current.Server.MapPath("~/Resource/UploadFile/");
                        FileHelper.DeleteFile(path + str[0].ToString() + str[1].ToString());
                        context.Response.Write(true);
                    }
                    else
                    {
                        context.Response.Write(false);
                    }
                    break;
                case "download"://下载
                    key = HttpContext.Current.Request["key"];
                    str = key.Split('≌');
                    string Downpath = HttpContext.Current.Server.MapPath("~/Resource/UploadFile/") + str[0].ToString() + str[1].ToString();
                    FileHelper.GetDownload(Downpath);
                    context.Response.Write(true);
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