using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.UserPermission
{
    public partial class UserPermissionList : System.Web.UI.Page
    {
        BPMS_UserIBLL bpms_useribll = new BPMS_UserBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAction();
            }
        }
        public void LoadAction()
        {
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AddHeader("Pragma", "No-Cache");
            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string Category = HttpContext.Current.Request["Category"];                                      //机构分类
            string OrganizationId = HttpContext.Current.Request["OrganizationId"];                          //机构主键
            switch (active)
            {
                case "InitUser"://加载用户列表
                    StringBuilder strHtml = new StringBuilder();
                    IList list = bpms_useribll.GetDataTableByOrganizationId(Category, OrganizationId);
                    int index = 0;
                    string strclass = "";
                    foreach (BPMS_User entity in list)
                    {
                        if (index == 0)
                        {
                            strclass = "collapsableselected";
                        }
                        else
                            strclass = "";
                        string Genderimg = "user_red.png";
                        if (entity.Gender == "男")
                        {
                            Genderimg = "user_mature.png";
                        }
                        strHtml.Append("<li><div class='" + strclass + "' id='" + entity.UserId + "'><img src='/Themes/images/16/" + Genderimg + "' style='vertical-align: middle;' alt=''/><span>" + entity.RealName + "(" + entity.Code + ")" + "</span></div></li>");
                        index++;
                    }
                    if (index ==0)
                    {
                        strHtml.Append("<li><div><span style='color:red;'>暂无用户</span></div>");
                    }
                    Response.Write(strHtml);
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}