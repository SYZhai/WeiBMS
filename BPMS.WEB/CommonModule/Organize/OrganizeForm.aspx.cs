using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using QY.API;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.CommonModule.Organize
{
    public partial class OrganizeForm : System.Web.UI.Page
    {
        BPMS_OrganizationIBLL bpms_organizationibll = new BPMS_OrganizationBLL();
        BPMS_Organization bpms_organization = new BPMS_Organization();
        BPMS_DataPermissionIBLL bpms_datapermissionibll = new BPMS_DataPermissionBLL();
        string _key, _ParentId, _ParentName;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                                  //主键
            _ParentId = Request["ParentId"];                        //上级节点ID
            _ParentName = Server.UrlDecode(Request["ParentName"]);  //上级节点
            if (!IsPostBack)
            {
                InitControl();
                LoadAction();
            }
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public void InitControl()
        {
            ParentId.Value = _ParentId;
            ParentName.Value = _ParentName;
            if (!string.IsNullOrEmpty(_key))
            {
                bpms_organization = bpms_organizationibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_organization);

                //获取上级菜单信息
                bpms_organization = bpms_organizationibll.GetEntity(bpms_organization.ParentId);
                ParentName.Value = bpms_organization.FullName;
                if (ParentId.Value == "0")
                {
                    ParentName.Value = "父节点";
                }
            }
        }
        /// <summary>
        /// Ajax操作
        /// </summary>
        public void LoadAction()
        {
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AddHeader("Pragma", "No-Cache");

            string active = HttpContext.Current.Request["action"];                                          //提交类型
            switch (active)
            {
                case "LoadTree":
                    IList list = bpms_organizationibll.GetList();
                    Response.Write(GetTreeList(list));
                    Response.End();
                    break;
                default:
                    break;
            }
        }

        #region 机构列表
        /// <summary>
        /// 机构列表
        /// </summary>
        public string GetTreeList(IList list)
        {
            StringBuilder strHtml = new StringBuilder();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == "0");
            strHtml.Append("<li>");
            strHtml.Append("<div id='0'><img src='/Themes/images/16/house.png' style='vertical-align: middle;' alt=''/><span>父节点</span></div>");
            strHtml.Append("</li>");
            foreach (BPMS_Organization entity in itemNode)
            {
                strHtml.Append("<li>");
                strHtml.Append("<div id='" + entity.OrganizationId + "'><img src='/Themes/images/16/house.png' style='vertical-align: middle;' alt=''/><span>" + entity.FullName + "</span></div>");
                //创建子节点
                strHtml.Append(GetTreeNode(entity.OrganizationId, list));
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
        public string GetTreeNode(string ParentId, IList list)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            List<BPMS_Organization> itemNode = IListHelper.IListToList<BPMS_Organization>(list).FindAll(t => t.ParentId == ParentId);
            if (itemNode.Count > 0)
            {
                sb_TreeNode.Append("<ul>");
                foreach (BPMS_Organization entity in itemNode)
                {
                    sb_TreeNode.Append("<li>");
                    sb_TreeNode.Append("<div id='" + entity.OrganizationId + "'><img src='/Themes/images/16/" + CategoryToImg(entity.Category) + "' style='vertical-align: middle;' alt=''/><span>" + entity.FullName + "</span></div>");
                    //创建子节点
                    sb_TreeNode.Append(GetTreeNode(entity.OrganizationId, list));
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

        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            bool IsOk = false;
            bpms_organization = ControlBindHelper.GetWebControls<BPMS_Organization>(this.Page);
            bpms_organization.Enabled = Enabled.Checked ? 1 : 0;
            bpms_organization.IsInnerOrganize = IsInnerOrganize.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_organization.OrganizationId = _key;
                bpms_organization.ModifyDate = DateTime.Now;
                bpms_organization.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_organization.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_organizationibll.Update(bpms_organization);
                if (IsOk)
                {
                    //保存成功后将数据同步到微信企业号
                    if (!myCommFun.UpdateDepartment(Convert.ToInt32(bpms_organization.Code), bpms_organization.FullName, toQYParentId(bpms_organization.ParentId), Convert.ToInt32(bpms_organization.SortCode)))
                    {
                        ShowMsgHelper.AlertCallback(MessageHelper.MSG0032);
                    }
                    ShowMsgHelper.AlertCallback(MessageHelper.MSG0006);
                }
            }
            else
            {

                bpms_organization.OrganizationId = CommonHelper.GetGuid;
                bpms_organization.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_organization.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_organizationibll.Insert(bpms_organization);
                if (IsOk) 
                {
                    //保存成功后将数据同步到微信企业号
                    
                    if (!myCommFun.CreateDepartment(Convert.ToInt32(bpms_organization.Code), bpms_organization.FullName, toQYParentId(bpms_organization.ParentId), Convert.ToInt32(bpms_organization.SortCode)))
                    {
                        ShowMsgHelper.AlertCallback(MessageHelper.MSG0032);
                    }
                    bpms_datapermissionibll.AddItemDefault(RequestSession.GetSessionUser().RoleId, "Organization", bpms_organization.OrganizationId, RequestSession.GetSessionUser().UserId);
                    ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); 
                }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
        /// <summary>
        /// 将系统ParentId转换为Code作为企业号ParentId
        /// </summary>
        /// <param name="parentId"></param>
        /// <returns></returns>
        public int toQYParentId(string parentId)
        {
            bpms_organization = null;
            bpms_organization = bpms_organizationibll.GetEntity(parentId);
            if (bpms_organization != null)
            {
                return Convert.ToInt32(bpms_organization.Code);
            }
            else
            {
                return 0;
            }
        }

    }
}