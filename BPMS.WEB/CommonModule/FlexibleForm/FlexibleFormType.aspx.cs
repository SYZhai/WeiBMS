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

namespace BPMS.WEB.CommonModule.FlexibleForm
{
    public partial class FlexibleFormType : System.Web.UI.Page
    {
        public StringBuilder strHtml = new StringBuilder();
        BPMS_ItemDetailsIBLL bpms_itemdetailsibll = new BPMS_ItemDetailsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTree();
            }
        }
        /// <summary>
        /// 加载类别
        /// </summary>
        public void GetTree()
        {
            IList list = bpms_itemdetailsibll.GetListByItemsId("4d0abda4-9059-4f45-946a-8a237bc606c1");//ID是固定的，
            int index = 0;
            string strclass = "";
            foreach (BPMS_ItemDetails entity in list)
            {
                if (index == 0)
                    strclass = "collapsableselected";
                else
                    strclass = "";
                strHtml.Append("<li>");
                strHtml.Append("<div class='" + strclass + "' id='" + entity.ItemCode + "'><img src='/Themes/images/16/award_star_silver_3.png' style='vertical-align: middle;' alt=''/><span>" + entity.ItemName + "</span></div>");
                strHtml.Append("</li>");
                index++;
            }
        }
    }
}