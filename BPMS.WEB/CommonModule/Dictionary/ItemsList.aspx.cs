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

namespace BPMS.WEB.CommonModule.Dictionary
{
    public partial class ItemsList : System.Web.UI.Page
    {
        public StringBuilder strHtml = new StringBuilder();
        BPMS_ItemsIBLL bpms_itemsibll = new BPMS_ItemsBLL();
        BPMS_Items bpms_items = new BPMS_Items();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTree();
            }
        }
        int index = 0;
        string strclass = "";
        /// <summary>
        /// 数据字典主表
        /// </summary>
        public void GetTree()
        {
            List<BPMS_Items> list = IListHelper.IListToList<BPMS_Items>(bpms_itemsibll.GetList());
            IList<BPMS_Items> listnew = list.Distinct(new Comparint<BPMS_Items>("Category")).ToList();
            foreach (BPMS_Items entity in listnew)
            {
                strHtml.Append("<li>");
                strHtml.Append("<div>");
                strHtml.Append("<img src='/Themes/images/16/advancedsettings.png' style='vertical-align: middle;' alt=''/>" + entity.Category + "");
                strHtml.Append("</div>");
                strHtml.Append("<ul>");
                //创建子节点
                strHtml.Append(GetTreeNode(entity.Category, list));
                strHtml.Append("</ul>");
                strHtml.Append("</li>");
            }
        }
        /// <summary>
        /// 创建子节点
        /// </summary>
        /// <param name="parentID">父节点主键</param>
        /// <param name="list">菜单集合</param>
        /// <returns></returns>
        public string GetTreeNode(string Category, IList list)
        {
            StringBuilder sb_TreeNode = new StringBuilder();
            List<BPMS_Items> itemNode = IListHelper.IListToList<BPMS_Items>(list).FindAll(t => t.Category == Category);
            foreach (BPMS_Items entity in itemNode)
            {
                if (index == 0)
                    strclass = "collapsableselected";
                else
                    strclass = "";
                sb_TreeNode.Append("<li>");
                sb_TreeNode.Append("<div title='" + entity.Code + "' class='" + strclass + "' id='" + entity.ItemsId + "'><img src='/Themes/images/16/wrench.png' style='vertical-align: middle;' alt=''/><span>" + entity.FullName + "</span></div>");
                sb_TreeNode.Append("</li>");
                index++;
            }
            return sb_TreeNode.ToString();
        }
    }
}