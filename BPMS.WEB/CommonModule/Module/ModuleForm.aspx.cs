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

namespace BPMS.WEB.CommonModule.Module
{
    public partial class ModuleForm : System.Web.UI.Page
    {
        BPMS_SysMenuIBLL bpms_sysmenuibll = new BPMS_SysMenuBLL();
        BPMS_SysMenu bpms_sysmenu = new BPMS_SysMenu();
        string _key, _ParentId, _ParentName;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                                  //主键
            _ParentId = Request["ParentId"];                        //上级菜单ID
            _ParentName = Server.UrlDecode(Request["ParentName"]);  //上级菜单
            if (!IsPostBack)
            {
                SortCode.Value = bpms_sysmenuibll.GetMaxCode().ToString();
                LoadAction();
                InitControl();
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
                bpms_sysmenu = bpms_sysmenuibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, bpms_sysmenu);
                if (bpms_sysmenu.Img != "")
                {
                    Img_Menu_Img.Src = "/Themes/Images/32/" + bpms_sysmenu.Img;
                }

                //获取上级菜单信息
                bpms_sysmenu = bpms_sysmenuibll.GetEntity(bpms_sysmenu.ParentId);
                ParentName.Value = bpms_sysmenu.FullName;
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
            string active = HttpContext.Current.Request["action"];                                          //提交类型
            switch (active)
            {
                case "LoadTree":
                    IList list = bpms_sysmenuibll.GetList();
                    Response.Write(GetMenuTreeTable(list));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 模块菜单树
        /// </summary>
        public string GetMenuTreeTable(IList list)
        {
            StringBuilder strHtml = new StringBuilder();
            List<BPMS_SysMenu> itemNode = IListHelper.IListToList<BPMS_SysMenu>(list).FindAll(t => t.ParentId == "0");
            strHtml.Append("<li>");
            strHtml.Append("<div id='0'>父节点</div>");
            strHtml.Append("</li>");
            foreach (BPMS_SysMenu entity in itemNode)
            {
                strHtml.Append("<li>");
                strHtml.Append("<div id='" + entity.MenuId + "'>" + entity.FullName + "</div>");
                //创建子节点
                strHtml.Append(GetTreeNode(entity.MenuId, list));
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
            List<BPMS_SysMenu> itemNode = IListHelper.IListToList<BPMS_SysMenu>(list).FindAll(t => t.ParentId == ParentId);
            if (itemNode.Count > 0)
            {
                sb_TreeNode.Append("<ul>");
                foreach (BPMS_SysMenu entity in itemNode)
                {
                    sb_TreeNode.Append("<li>");
                    sb_TreeNode.Append("<div id='" + entity.MenuId + "'>" + entity.FullName + "</div>");
                    //创建子节点
                    sb_TreeNode.Append(GetTreeNode(entity.MenuId, list));
                    sb_TreeNode.Append("</li>");
                }
                sb_TreeNode.Append("</ul>");
            }
            return sb_TreeNode.ToString();
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            bool IsOk = false;
            bpms_sysmenu = ControlBindHelper.GetWebControls<BPMS_SysMenu>(this.Page);
            bpms_sysmenu.Enabled = Enabled.Checked ? 1 : 0;
            bpms_sysmenu.IsUnfold = IsUnfold.Checked ? 1 : 0;
            bpms_sysmenu.AllowEdit = AllowEdit.Checked ? 1 : 0;
            bpms_sysmenu.AllowDelete = AllowDelete.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                bpms_sysmenu.MenuId = _key;
                bpms_sysmenu.ModifyDate = DateTime.Now;
                bpms_sysmenu.ModifyUserId = RequestSession.GetSessionUser().UserId;
                bpms_sysmenu.ModifyUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_sysmenuibll.Update(bpms_sysmenu);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                bpms_sysmenu.MenuId = CommonHelper.GetGuid;
                bpms_sysmenu.CreateUserId = RequestSession.GetSessionUser().UserId;
                bpms_sysmenu.CreateUserName = RequestSession.GetSessionUser().UserName;
                IsOk = bpms_sysmenuibll.Insert(bpms_sysmenu);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}