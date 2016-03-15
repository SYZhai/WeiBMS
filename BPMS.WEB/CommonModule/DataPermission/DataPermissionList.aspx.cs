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

namespace BPMS.WEB.CommonModule.DataPermission
{
    public partial class DataPermissionList : System.Web.UI.Page
    {
        BPMS_DataPermissionIBLL bpms_datapermissionibll = new BPMS_DataPermissionBLL();
        BPMS_DataPermission entity = new BPMS_DataPermission();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] ShowButton = { "Replace", "AcceptReset", "Authorization", "Leave" };
                LoadButton.Strconditio = ShowButton;
                LoadAction();
            }
        }
        #region 组织机构
        /// <summary>
        /// 组织机构
        /// </summary>
        public string GetOrgTree(string RoleId, string AuthorizationItemValue)
        {
            BPMS_DataPermission datapermission = bpms_datapermissionibll.GetEntity(RoleId, AuthorizationItemValue);
            string[] array = new string[0];
            if (!string.IsNullOrEmpty(datapermission.ObjectId))
            {
                array = datapermission.ObjectId.Replace("'", "").Split(',');
            }
            StringBuilder strHtml = new StringBuilder();
            IList list = bpms_datapermissionibll.GetOrganizationList();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == "0");
            foreach (BPMS_Organization entity in itemNode)
            {
                strHtml.Append("<li>");
                bool exists = ((IList)array).Contains(entity.OrganizationId);
                strHtml.Append("<input " + GetChecked(exists) + " style='vertical-align: middle;margin-bottom:2px;' type=\"checkbox\" value=\"" + entity.OrganizationId + "\" name=\"checkbox\" /><img src='/Themes/images/16/house.png' style='vertical-align: middle;' alt=''/>" + entity.FullName + "");
                //创建子节点
                strHtml.Append(GeOrgtTreeNode(entity.OrganizationId, list, array));
                strHtml.Append("</li>");
            }
            return strHtml.ToString();
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="parentID">父节点主键</param>
        /// <param name="list">菜单集合</param>
        /// <returns></returns>
        public string GeOrgtTreeNode(string ParentId, IList list, string[] array)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == ParentId);
            if (itemNode.Count > 0)
            {
                sb_TreeNode.Append("<ul>");
                foreach (BPMS_Organization entity in itemNode)
                {

                    bool exists = ((IList)array).Contains(entity.OrganizationId);
                    sb_TreeNode.Append("<li title='" + entity.Category + "'>");
                    sb_TreeNode.Append("<input " + GetChecked(exists) + " style='vertical-align: middle;margin-bottom:2px;' type=\"checkbox\" value=\"" + entity.OrganizationId + "\" name=\"checkbox\" /><img src='/Themes/images/16/" + CategoryToImg(entity.Category) + "' style='vertical-align: middle;' alt=''/>" + entity.FullName + "");
                    //创建子节点
                    sb_TreeNode.Append(GeOrgtTreeNode(entity.OrganizationId, list, array));
                    sb_TreeNode.Append("</li>");
                }
                sb_TreeNode.Append("</ul>");
            }
            return sb_TreeNode.ToString();
        }
        public string CategoryToImg(string Category)
        {
            string img = "";
            if (Category == "区域")
            {
                img = "house_star.png";
            }
            if (Category == "公司")
            {
                img = "chart_organisation.png";
            }
            if (Category == "子公司")
            {
                img = "flag_green.png";
            }
            if (Category == "部门")
            {
                img = "wand.png";
            }
            if (Category == "工作组")
            {
                img = "users.png";
            }
            return img;
        }
        #endregion

        #region 用户列表
        /// <summary>
        /// 用户列表
        /// </summary>
        /// <returns></returns>
        public string GetUserList(string RoleId, string AuthorizationItemValue)
        {
            BPMS_DataPermission datapermission = bpms_datapermissionibll.GetEntity(RoleId, AuthorizationItemValue);
            string[] array = new string[0];
            if (!string.IsNullOrEmpty(datapermission.ObjectId))
            {
                array = datapermission.ObjectId.Replace("'", "").Split(',');
            }

            StringBuilder strHtml = new StringBuilder();
            IList list = bpms_datapermissionibll.GetUserList();
            strHtml.Append("<li>");
            strHtml.Append("<input style='vertical-align: middle;margin-bottom:2px;' type=\"checkbox\" name=\"checkbox\" /><img src='/Themes/images/16/spellcheck.png' style='vertical-align: middle;' alt=''/>所有用户");
            if (list.Count > 0)
            {
                strHtml.Append("<ul>");
                foreach (BPMS_User entity in list)
                {
                    bool exists = ((IList)array).Contains(entity.UserId);
                    string Genderimg = "user_red.png";
                    var Gender = entity.Gender;
                    if (Gender == "男")
                    {
                        Genderimg = "user_mature.png";
                    }
                    strHtml.Append("<li>");
                    strHtml.Append("<input " + GetChecked(exists) + " style='vertical-align: middle;margin-bottom:2px;' type=\"checkbox\" value=\"" + entity.UserId + "\" name=\"checkbox\" /><img src='/Themes/images/16/" + Genderimg + "' style='vertical-align: middle;' alt=''/>" + entity.Account + " - " + entity.RealName + "");
                    strHtml.Append("</li>");
                }
                strHtml.Append("</ul>");
            }
            else
            {
                strHtml.Append("<li><div><span style='color:red;'>暂无用户</span></div>");
            }
            strHtml.Append("</li>");
            return strHtml.ToString();
        }
        #endregion

        #region 员工列表
        /// <summary>
        /// 员工列表
        /// </summary>
        /// <returns></returns>
        public string GetEmployeeList(string RoleId, string AuthorizationItemValue)
        {
            BPMS_DataPermission datapermission = bpms_datapermissionibll.GetEntity(RoleId, AuthorizationItemValue);
            string[] array = new string[0];
            if (!string.IsNullOrEmpty(datapermission.ObjectId))
            {
                array = datapermission.ObjectId.Replace("'", "").Split(',');
            }

            StringBuilder strHtml = new StringBuilder();
            IList list = bpms_datapermissionibll.GetEmployeeList();
            strHtml.Append("<li>");
            strHtml.Append("<input style='vertical-align: middle;margin-bottom:2px;' type=\"checkbox\" name=\"checkbox\" /><img src='/Themes/images/16/spellcheck.png' style='vertical-align: middle;' alt=''/>所有员工");
            if (list.Count > 0)
            {
                strHtml.Append("<ul>");
                foreach (BPMS_Employee entity in list)
                {
                    bool exists = ((IList)array).Contains(entity.EmployeeId);
                    string Genderimg = "user_red.png";
                    var Gender = entity.Gender;
                    if (Gender == "男")
                    {
                        Genderimg = "user_mature.png";
                    }
                    strHtml.Append("<li>");
                    strHtml.Append("<input " + GetChecked(exists) + " style='vertical-align: middle;margin-bottom:2px;' type=\"checkbox\" value=\"" + entity.EmployeeId + "\" name=\"checkbox\" /><img src='/Themes/images/16/" + Genderimg + "' style='vertical-align: middle;' alt=''/>" + entity.Code + " - " + entity.RealName + "");
                    strHtml.Append("</li>");
                }
                strHtml.Append("</ul>");
            }
            else
            {
                strHtml.Append("<li><div><span style='color:red;'>暂无员工</span></div>");
            }
            strHtml.Append("</li>");
            return strHtml.ToString();
        }
        #endregion

        /// <summary>
        /// 验证权限是否存在
        /// </summary>
        /// <param name="exists"></param>
        /// <returns></returns>
        public string GetChecked(bool exists)
        {
            if (exists)
                return "checked=\"checked\"";
            else
                return "";
        }

        public void LoadAction()
        {
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AddHeader("Pragma", "No-Cache");

            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string RoleId = HttpContext.Current.Request["RoleId"];                                          //角色主键
            string AuthorizationItemValue = HttpContext.Current.Request["AuthorizationItemValue"];          //授权项目
            string itemId = HttpContext.Current.Request["itemId"];                                          //授权项目对象Id
            switch (active)
            {
                case "LoadOrgTree"://组织机构
                    Response.Write(GetOrgTree(RoleId, AuthorizationItemValue));
                    Response.End();
                    break;
                case "LoadUserList"://用户列表
                    Response.Write(GetUserList(RoleId, AuthorizationItemValue));
                    Response.End();
                    break;
                case "LoadEmployeeList"://员工列表
                    Response.Write(GetEmployeeList(RoleId, AuthorizationItemValue));
                    Response.End();
                    break;
                case "AddDataPermission"://添加数据权限
                    bool IsOk = false;
                    entity = bpms_datapermissionibll.GetEntity(RoleId, AuthorizationItemValue);
                    if (entity.DataPermissionId == null)
                    {
                        entity.DataPermissionId = CommonHelper.GetGuid;
                        entity.RoleId = RoleId;
                        entity.ResourceId = AuthorizationItemValue;
                        entity.ObjectId = itemId;
                        entity.CreateUserId = RequestSession.GetSessionUser().UserId;
                        entity.CreateUserName = RequestSession.GetSessionUser().UserName;
                        IsOk = bpms_datapermissionibll.Insert(entity);
                    }
                    else
                    {
                        entity.RoleId = RoleId;
                        entity.ResourceId = AuthorizationItemValue;
                        entity.ObjectId = itemId;
                        entity.CreateUserId = RequestSession.GetSessionUser().UserId;
                        entity.CreateUserName = RequestSession.GetSessionUser().UserName;
                        IsOk = bpms_datapermissionibll.Update(entity);
                    }
                    CacheHelper.RemoveAllCache();
                    Response.Write(IsOk);
                    Response.End();
                    break;
                default:
                    break;
            }
        }
    }
}