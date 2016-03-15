using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace BPMS.WEB.CommonModule.User
{
    /// <summary>
    /// UserList1 的摘要说明
    /// </summary>
    public class UserList1 : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            string active = HttpContext.Current.Request["action"];                                          //提交类型
            BPMS_OrganizationIBLL bpms_organizationibll = new BPMS_OrganizationBLL();
            BPMS_UserIBLL bpms_useribll = new BPMS_UserBLL();
            switch (active)
            {
                case "derive"://导出Excel
                    string[] DataColumn = { "编号:Code", "登录账户:Account", "真实姓名:RealName", "性别:Gender", "手机号码:Mobile", "QQ号码:OICQ", "电子邮件:Email", "岗位:Duty", "职称:Title", "部门名称:DepartmentName", "有效:Enabled", "说明:Description" };
                    ExcelHelper.ExportExcel<BPMS_User>(bpms_useribll.GetList(), DataColumn, "用户信息-" + DateTime.Now.ToString("yyyy-MM-dd"));
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