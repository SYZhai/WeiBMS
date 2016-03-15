using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BPMS.WEB.CommonModule.Dictionary
{
    /// <summary>
    /// Dictionary 的摘要说明
    /// </summary>
    public class Dictionary : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";
            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string key = HttpContext.Current.Request["key"];                                                //主键
            BPMS_ItemsIBLL bpms_itemsibll = new BPMS_ItemsBLL();
            BPMS_Items bpms_items = new BPMS_Items();
            switch (active)
            {
                case "Delete"://删除字典类别
                    bpms_items = bpms_itemsibll.GetEntity(key);
                    if (bpms_items.AllowDelete == 0)
                    {
                        context.Response.Write(string.Format(MessageHelper.MSG0009, bpms_items.FullName));
                        context.Response.End();
                    }
                    else if (bpms_itemsibll.IsItemDetails(key))
                    {
                        bpms_items = bpms_itemsibll.GetEntity(key);
                        context.Response.Write(string.Format(MessageHelper.MSG0023, bpms_items.FullName));
                        context.Response.End();
                    }
                    else
                    {
                        context.Response.Write(bpms_itemsibll.Delete(key));
                        context.Response.End();
                    }
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