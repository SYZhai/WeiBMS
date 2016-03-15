using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using BPMS.Service;
using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace BPMS.WEB.Frame
{
    /// <summary>
    /// Frame 的摘要说明
    /// </summary>
    public class Frame : IHttpHandler, IRequiresSessionState
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
            string Account = context.Request["Account"];          //账户
            string Pwd = context.Request["Pwd"];                    //密码
            string code = context.Request["code"];                          //验证码
            BPMS_UserIBLL bpms_useribll = new BPMS_UserBLL();
            BPMS_User bpms_user = new BPMS_User();
            BPMS_OrganizationIBLL bpms_organizationibll = new BPMS_OrganizationBLL();
            BPMS_Organization bpms_organization = new BPMS_Organization();
            BPMS_SysLogIBLL bpms_syslogibll = new BPMS_SysLogBLL();
            BPMS_IPBlacklistIBLL bpms_ipblacklistibll = new BPMS_IPBlacklistBLL();
            IPScanerHelper objScan = new IPScanerHelper();
            string Msg = "";
            string UserId = "";
            switch (active)
            {
                case "login"://登录
                    #region 登录
                    try
                    {
                        string IPAddress = RequestHelper.GetIPAddress();
                        objScan.IP = IPAddress;
                        objScan.DataPath = context.Server.MapPath("/Themes/IPScaner/QQWry.Dat");
                        string IPAddressName = objScan.IPLocation();
                        if (code.ToLower() != context.Session["dt_session_code"].ToString().ToLower())
                        {
                            Msg = "1";//验证码输入不正确
                        }
                        else
                        {
                            //系统管理
                            if (Account == ConfigHelper.GetValue("CurrentUserName") && Md5Helper.MD5(Pwd, 32) == ConfigHelper.GetValue("CurrentPassword"))
                            {
                                SessionUser user = new SessionUser();
                                user.UserId = "System";
                                user.Account = "System";
                                user.UserName = "超级管理员";
                                user.Gender = "男";
                                user.Password = bpms_user.Password;
                                user.Code = "System";
                                user.DepartmentId = "超级管理员";
                                user.DepartmentName = "超级管理员";
                                RequestSession.AddSessionUser(user);
                                Msg = "3";//验证成功
                                bpms_syslogibll.AddSysLoginLog(bpms_user.Account, "登录成功", IPAddress, IPAddressName);
                            }
                            else
                            {
                                #region 验证
                                bpms_ipblacklistibll.TheIpIsRange(IPAddress);
                                string outmsg;
                                bpms_user = bpms_useribll.UserLogin(Account.Trim(), Pwd.Trim(), out outmsg);
                                if (outmsg != "-1")
                                {
                                    if (outmsg == "succeed")
                                    {
                                        if (bpms_user.Enabled == 1)
                                        {
                                            if (Islogin(context, Account.Trim()))
                                            {
                                                string DepartmentName = "";
                                                bpms_organization = bpms_organizationibll.GetEntity(bpms_user.DepartmentId);
                                                if (bpms_organization != null)
                                                {
                                                    DepartmentName = bpms_organization.FullName;
                                                }
                                                SessionUser user = new SessionUser();
                                                user.UserId = bpms_user.UserId;
                                                user.Account = bpms_user.Account;
                                                user.UserName = bpms_user.RealName;
                                                user.Gender = bpms_user.Gender;
                                                user.Password = bpms_user.Password;
                                                user.Code = bpms_user.Code;
                                                user.Secretkey = bpms_user.Secretkey;
                                                user.DepartmentId = bpms_user.DepartmentId;
                                                user.DepartmentName = DepartmentName;
                                                user.RoleId = bpms_user.RoleId;
                                                RequestSession.AddSessionUser(user);
                                                Msg = "3";//验证成功
                                                bpms_syslogibll.AddSysLoginLog(bpms_user.Account, "登录成功", IPAddress, IPAddressName);
                                            }
                                            else
                                            {
                                                context.Response.Write("6");//该用户已经登录，不允许重复登录
                                                context.Response.End();
                                            }
                                        }
                                        else
                                        {
                                            Msg = "2";//账户锁定
                                            bpms_syslogibll.AddSysLoginLog(bpms_user.Account, "账户锁定", IPAddress, IPAddressName);
                                        }
                                    }
                                    else
                                    {
                                        Msg = "4";//账户或者密码有错误
                                        bpms_syslogibll.AddSysLoginLog(bpms_user.Account, "登录失败", IPAddress, IPAddressName);
                                    }
                                }
                                else
                                {
                                    Msg = DbErrorMsg.ReturnMsg;//服务连接不上
                                }
                                #endregion
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Msg = ex.Message;
                    }
                    context.Response.Write(Msg);
                    context.Response.End();
                    #endregion
                    break;
                case "Outlogin"://安全退出
                    UserId = RequestSession.GetSessionUser().UserId;
                    CacheHelper.RemoveAllCache("Module" + UserId);
                    CacheHelper.RemoveAllCache("Button" + UserId);
                    CacheHelper.RemoveAllCache("Data" + UserId);
                    context.Session.Abandon();  //取消当前会话
                    context.Session.Clear();    //清除当前浏览器所以Session
                    context.Response.Write("1");
                    context.Response.End();
                    break;
                case "LoadFirstMenu":
                    UserId = RequestSession.GetSessionUser().UserId;
                    IList list = (IList)StorePermission.Instance.GetModulePermission(UserId);
                    context.Response.Write(JsonHelper.DropToJson<BPMS_ModulePermission>(list, "JSON"));
                    context.Response.End();
                    break;
                case "SetSystemId"://模块ID、访问模块
                    UserId = RequestSession.GetSessionUser().UserId;
                    string SystemId = context.Request["SystemId"];                    //模块ID
                    List<BPMS_ModulePermission> Modulelist = IListHelper.IListToList<BPMS_ModulePermission>((IList)StorePermission.Instance.GetModulePermission(UserId)).FindAll(t => t.MenuId == SystemId);
                    foreach (BPMS_ModulePermission entity in Modulelist)
                    {
                        BPMS_SysLogDAL.Instance.AddVisitLog(UserId, RequestSession.GetSessionUser().UserName, entity.FullName, "URL:" + entity.NavigateUrl);
                        break;
                    }
                    //写入Session
                    context.Session["SystemId"] = SystemId;
                    context.Response.Write(SystemId);
                    context.Response.End();
                    break;
                case "LeaveModule"://离开模块
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 同账号不允许重复登录
        /// </summary>
        /// <param name="context"></param>
        /// <param name="Account">账户</param>
        /// <returns></returns>
        public bool Islogin(HttpContext context, string Account)
        {
            if (!CommonHelper.GetBool(ConfigHelper.GetValue("CheckOnLine")))
            {
                return true;
            }
            //将Session转换为Arraylist数组
            ArrayList list = context.Session["CheckOnLine_List"] as ArrayList;
            if (list == null)
            {
                list = new ArrayList();
            }
            for (int i = 0; i < list.Count; i++)
            {
                if (Account == (list[i] as string))
                {
                    //已经登录了，提示错误信息 
                    return false; ;
                }
            }
            //将用户信息添加到list数组中
            list.Add(Account);
            //将数组放入Session
            context.Session.Add("CheckOnLine_List", list);
            return true;
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