using BPMS.Business;
using BPMS.IBusiness;
using BPMS.Service;
using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.DataBase
{
    public partial class DataBaseManag : PageBase
    {
        BPMS_DataBaseIBLL bpms_databaseibll = new BPMS_DataBaseBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAction();
        }
        public void LoadAction()
        {
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AddHeader("Pragma", "No-Cache");
            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string orderField = HttpContext.Current.Request["pqGrid_OrderField"];                           //排序字段
            string orderType = HttpContext.Current.Request["pqGrid_OrderType"];                             //排序类型
            string pqGrid_Sort = HttpContext.Current.Request["pqGrid_Sort"];                                //要显示字段
            string key = HttpContext.Current.Request["key"];                                                //主键
            switch (active)
            {
                case "GridBindList":
                    string str = JsonHelper.PqGridJson(bpms_databaseibll.GetSpaceCase(), pqGrid_Sort);
                    Response.Write(str);
                    Response.End();
                    break;
                case "BackupGridBindList"://备份数据库文件列表
                    Response.Write(JsonHelper.PqGridJson(DbFiles(), pqGrid_Sort));
                    Response.End();
                    break;
                case "backup"://备份数据库
                    BackupDb();
                    break;
                case "download"://下载
                    string Downpath = Server.MapPath("~/Resource/DBBackup/SqlServer/") + key;
                    DownloadFile(Downpath);
                    break;
                case "Delete"://删除
                    string path = Server.MapPath("~/Resource/DBBackup/SqlServer/") + key;
                    DeleteFile(path);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 备份数据库
        /// </summary>
        void BackupDb()
        {
            string dbname = ConfigHelper.GetValue("DBName");
            string dbFileName = Server.MapPath("~/Resource/DBBackup/SqlServer/") + CommonHelper.CreateNo() + ".bak";
            try
            {
                //执行备份
                Response.Write(bpms_databaseibll.BackupDatabase(dbname, dbFileName));
            }
            catch (Exception ex)
            {
                Response.Write(ex.StackTrace);
            }
            Response.End();
        }
        //获取备份文件列表
        DataTable DbFiles()
        {
            string path = Server.MapPath("~/Resource/DBBackup/SqlServer/");
            DirectoryInfo di = new DirectoryInfo(path);
            DataTable dt = new DataTable();
            dt.Columns.Add("FileName", Type.GetType("System.String"));
            dt.Columns.Add("FileSize", Type.GetType("System.String"));
            dt.Columns.Add("CreateDate", Type.GetType("System.String"));
            foreach (var item in di.GetFiles())
            {
                DataRow row = dt.NewRow();
                row["FileName"] = item.Name;
                row["FileSize"] = ((float)item.Length / 1024 / 1024).ToString("N3") + " M";
                row["CreateDate"] = item.CreationTime.ToString("yyyy-MM-dd HH:mm:ss");
                dt.Rows.Add(row);
            }
            dt.DefaultView.Sort = "CreateDate DESC";//DataTable排序
            DataTable dtTemp = dt.DefaultView.ToTable();
            return dtTemp;
        }
        //删除备份文件
        void DeleteFile(string path)
        {
            FileHelper.DeleteFile(path);
            //写入操作日志
            BPMS_SysLogDAL.Instance.AddTaskLog(RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName, "删除备份数据库文件", "数据库备份文件删除成功，文件名：：" + Path.GetFileNameWithoutExtension(path) + ".bak");
            Response.Write(true);
            Response.End();
        }
        //下载备份文件
        void DownloadFile(string path)
        {
            FileHelper.GetDownload(path);
            //写入操作日志
            BPMS_SysLogDAL.Instance.AddTaskLog(RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName, "下载备份数据库文件", "数据库备份文件下载，文件名：：" + Path.GetFileNameWithoutExtension(path) + ".bak");
            Response.Write(true);
            Response.End();
        }
    }
}