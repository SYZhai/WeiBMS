using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Role
{
    public partial class MemberList : System.Web.UI.Page
    {
        BPMS_UserRoleIBLL bpms_userroleibll = new BPMS_UserRoleBLL();
        BPMS_RolesIBLL bpms_rolesibll = new BPMS_RolesBLL();
        BPMS_Roles bpms_roles = new BPMS_Roles();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] ShowButton = { "Replace", "AddMember", "DeleteMember", "Leave" };
                LoadButton.Strconditio = ShowButton;
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
            string orderField = HttpContext.Current.Request["pqGrid_OrderField"];                           //排序字段  
            string orderType = HttpContext.Current.Request["pqGrid_OrderType"];                             //排序类型
            string pqGrid_Sort = HttpContext.Current.Request["pqGrid_Sort"];                                //要显示字段
            string UserId = HttpContext.Current.Request["UserId"];                                          //用户主键
            string RoleId = HttpContext.Current.Request["RoleId"];                                          //角色主键
            string Parm_Key_Value = HttpContext.Current.Request["Parm_Key_Value"];                          //搜索条件键值
            switch (active)
            {
                case "InitRolesMember": //加载角色成员
                    Hashtable parm = HashtableHelper.String_Key_ValueToHashtable(Parm_Key_Value);
                    parm["RoleId"] = RoleId;
                    Response.Write(JsonHelper.PqGridJson<BPMS_User>(bpms_userroleibll.GetListMember(parm), pqGrid_Sort));
                    Response.End();
                    break;
                case "DeleteMember"://删除角色成员
                    string[] array = new string[0];
                    if (!string.IsNullOrEmpty(UserId))
                    {
                        array = UserId.Split(',');
                    }
                    Response.Write(bpms_userroleibll.BatchDeleteMember(RoleId, array));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}