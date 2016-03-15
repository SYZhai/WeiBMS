using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using BPMS.Service;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.UserControl
{
    public partial class LoadButton : System.Web.UI.UserControl
    {
        /// <summary>
        /// 显示操作按钮过滤条件
        /// </summary>
        public string[] Strconditio { get; set; }//过滤条件
        public StringBuilder sb_ButtonPermission = new StringBuilder();
        public StringBuilder sb_contextmenu = new StringBuilder();
        StringBuilder sb_contextmenuItem = new StringBuilder();
        BPMS_PermissionIBLL bpms_permissionibll = new BPMS_PermissionBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string MenuId = Session["SystemId"].ToString();//模块菜单ID
                string UserId = RequestSession.GetSessionUser().UserId;
                IList list = (IList)StorePermission.Instance.GetButtonPermission(UserId);
                List<BPMS_ButtonPermission> itemNode = IListHelper.IListToList<BPMS_ButtonPermission>(list).FindAll(t => t.MenuId == MenuId);

                sb_ButtonPermission.Append("<div class=\"tools_bar\">");
                int index = 0;
                if (itemNode.Count > 0)
                {
                    foreach (BPMS_ButtonPermission entity in itemNode)
                    {
                        if (entity.Category == "工具栏")
                        {
                            if (Strconditio != null)
                            {
                                foreach (string item in Strconditio)
                                {
                                    if (item == entity.Control_ID)
                                    {
                                        sb_ButtonPermission.Append("<a title=\"" + entity.Description + "\" onclick=\"" + entity.Event + ";\" class=\"tools_btn\"><span><b style=\"background: url('/Themes/images/16/" + entity.Img + "') 50% 4px no-repeat;\">" + entity.FullName + "</b></span></a>");
                                    }
                                }
                            }
                            else
                            {
                                sb_ButtonPermission.Append("<a title=\"" + entity.Description + "\" onclick=\"" + entity.Event + ";\" class=\"tools_btn\"><span><b style=\"background: url('/Themes/images/16/" + entity.Img + "') 50% 4px no-repeat;\">" + entity.FullName + "</b></span></a>");
                                if (entity.Split == "1")
                                {
                                    sb_ButtonPermission.Append("<div class=\"tools_separator\"></div>");
                                }
                            }
                        }
                        else if (entity.Category == "右击菜单栏")
                        {
                            sb_contextmenuItem.Append("{");
                            sb_contextmenuItem.Append("text: '" + entity.FullName + "',");
                            sb_contextmenuItem.Append("icon: '/Themes/images/16/" + entity.Img + "',");
                            sb_contextmenuItem.Append("action: function (target) {");
                            sb_contextmenuItem.Append(entity.Event);
                            sb_contextmenuItem.Append("}");
                            sb_contextmenuItem.Append("},");
                            index++;
                        }
                    }
                    if (index > 0)
                    {
                        sb_contextmenu.Append("$('#grid_paging').contextmenu({ items: [");
                        sb_contextmenu.Append(sb_contextmenuItem.ToString());
                        sb_contextmenu = sb_contextmenu.Remove(sb_contextmenu.Length - 1, 1);
                        sb_contextmenu.Append("] });");
                    }
                }
                else
                {
                    sb_ButtonPermission.Append("<a title=\"刷新当前页面\" onclick=\"Replace();\" class=\"tools_btn\"><span><b style=\"background: url('/Themes/images/16/arrow_refresh.png') 50% 4px no-repeat;\">刷新</b></span></a>");
                }
                sb_ButtonPermission.Append("</div>");
            }
        }
    }
}