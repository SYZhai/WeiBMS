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

namespace BPMS.WEB.CommonModule.InterfaceManage
{
    public partial class InterfaceManageForm : System.Web.UI.Page
    {
        public StringBuilder Sb_Table_Out = new StringBuilder();
        BASE_InterfaceManageIBLL base_interfacemanageibll = new BASE_InterfaceManageBLL();
        BASE_InterfaceManage base_interfacemanage = new BASE_InterfaceManage();

        string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            if (!IsPostBack)
            {
                Response.Buffer = true;
                Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
                Response.Expires = 0;
                Response.CacheControl = "no-cache";
                Response.AddHeader("Pragma", "No-Cache");
                if (!string.IsNullOrEmpty(_key))
                {
                    SetInitControl();
                    LblState.Text = "【编辑】";
                }
                LoadAction();
            }
        }
        /// <summary>
        /// Ajax动作
        /// </summary>
        public void LoadAction()
        {
            string active = HttpContext.Current.Request["action"];                                          //提交类型
            string key = HttpContext.Current.Request["key"];                                                //主键
            string InterfaceFrom = HttpContext.Current.Request["InterfaceFrom"];                            //接口配置
            string InterfaceDetailsFrom = HttpContext.Current.Request["InterfaceDetailsFrom"];              //接口参数明细
            switch (active)
            {
                case "AddOrEdit"://新增-编辑
                    object[] arrayInterfaceFrom = new object[0];
                    object[] arrayInterfaceDetailsFrom = new object[0];
                    if (!string.IsNullOrEmpty(InterfaceFrom))
                    {
                        arrayInterfaceFrom = InterfaceFrom.Split('≌');
                    }
                    if (!string.IsNullOrEmpty(InterfaceDetailsFrom))
                    {
                        arrayInterfaceDetailsFrom = InterfaceDetailsFrom.Split('≌');
                    }
                    Response.Write(base_interfacemanageibll.AddInterfaceManage(arrayInterfaceFrom, arrayInterfaceDetailsFrom, key));
                    Response.End();
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 获取对象 给控件赋值
        /// </summary>
        public void SetInitControl()
        {
            StringBuilder sbxml = new StringBuilder();
            base_interfacemanage = base_interfacemanageibll.GetEntity(_key);
            ControlBindHelper.SetWebControls(this.Page, base_interfacemanage);
            int rowindex = 1;
            IList List = base_interfacemanageibll.GetListDetails(_key);//获取接口参数列表
            sbxml.Append("<Request>\r\n");
            sbxml.Append("\t<data  code='" + Code.Value + "'>\r\n");
            sbxml.Append("\t\t<no>\r\n");
            if (List.Count > 0)
            {
                foreach (BASE_InterfaceManageDetails item in List)
                {
                    Sb_Table_Out.Append("<tr>");
                    Sb_Table_Out.Append("<td class=\"td-div\" style=\"width: 50px; text-align: left;\"><div style=\"padding-left:5px;\">" + rowindex + "</div></td>");
                    Sb_Table_Out.Append("<td style=\"width: 250px;\"><input value=\"" + item.Field + "\" dbfield=\"true\" id=\"Field➩" + rowindex + "\"  type=\"text\" class=\"txt\" onkeyup=\"CheckingInterfaceDetailse(this.id," + rowindex + ")\" /></td>");
                    Sb_Table_Out.Append("<td style=\"width: 100px;text-align: center;\"><select dbfield=\"true\" id=\"FieldType➩" + rowindex + "\" class=\"txtselect\"  datacol=\"No\" err=\"数据类型\" checkexpession=\"NotNull\"><option value=\"\">==请选择==</option><option value=\"字符串\" " + IsSelected(item.FieldType, "字符串") + ">字符串</option><option value=\"数字\" " + IsSelected(item.FieldType, "数字") + ">数字</option><option value=\"日期\" " + IsSelected(item.FieldType, "日期") + ">日期</option><option value=\"金额\" " + IsSelected(item.FieldType, "金额") + ">金额</option></select></td>");
                    Sb_Table_Out.Append("<td style=\"width: 80px;\"><input value=\"" + item.FieldMaxLength + "\" dbfield=\"true\" id=\"FieldMaxLength➩" + rowindex + "\" type=\"text\" class=\"txt\" style=\"text-align: center;\"  datacol=\"No\" err=\"长度\" checkexpession=\"Num\" onkeyup=\"Keypress(this.id)\"/></td>");
                    Sb_Table_Out.Append("<td style=\"width: 80px;text-align: center;\"><input value=\"" + item.FieldMinLength + "\" dbfield=\"true\" id=\"FieldMinLength➩" + rowindex + "\" type=\"checkbox\" " + IsChecked(item.FieldMinLength.ToString()) + " /></td>");
                    Sb_Table_Out.Append("<td style=\"width: 80px;\"><input value=\"" + item.SortCode + "\" dbfield=\"true\" id=\"SortCode➩" + rowindex + "\" type=\"text\" class=\"txt\" style=\"text-align: center;\" datacol=\"No\" err=\"显示顺序\" checkexpession=\"Num\" value=\"" + rowindex + "\" /></td>");
                    Sb_Table_Out.Append("<td style=\"width: 80px;text-align: center;\"><input dbfield=\"true\" id=\"Enabled➩" + rowindex + "\" type=\"checkbox\" " + IsChecked(item.Enabled.ToString()) + " /></td>");
                    Sb_Table_Out.Append("<td ><input value=\"" + item.FieldMemo + "\" dbfield=\"true\" id=\"FieldMemo➩" + rowindex + "\" type=\"text\" class=\"txt\" /></td>");
                    Sb_Table_Out.Append("</tr>");
                    sbxml.Append("\t\t\t<" + item.Field + ">" + item.FieldMemo + "</" + item.Field + ">\r\n");
                    rowindex++;
                }
            }
            sbxml.Append("\t\t</no>\r\n");
            sbxml.Append("\t</data>\r\n");
            sbxml.Append("</Request>\r\n");
            int j = rowindex;
            for (int i = rowindex; i < 100; i++)
            {
                string IsDisabled = "disabled";
                if (i == j)
                {
                    IsDisabled = "";
                }
                Sb_Table_Out.Append("<tr>");
                Sb_Table_Out.Append("<td class=\"td-div\" style=\"width: 50px; text-align: left;\"><div style=\"padding-left:5px;\">" + rowindex + "</div></td>");
                Sb_Table_Out.Append("<td style=\"width: 250px;\"><input " + IsDisabled + " dbfield=\"true\" id=\"Field➩" + rowindex + "\"  type=\"text\" class=\"txt\" onkeyup=\"CheckingInterfaceDetailse(this.id," + rowindex + ")\" /></td>");
                Sb_Table_Out.Append("<td style=\"width: 100px;text-align: center;\"><select " + IsDisabled + " dbfield=\"true\" id=\"FieldType➩" + rowindex + "\" class=\"txtselect\" datacol=\"No\" err=\"数据类型\" checkexpession=\"NotNull\"><option value=\"\">==请选择==</option><option value=\"字符串\">字符串</option><option value=\"数字\">数字</option><option value=\"日期\">日期</option><option value=\"金额\">金额</option></select></td>");
                Sb_Table_Out.Append("<td style=\"width: 80px;\"><input " + IsDisabled + " dbfield=\"true\" id=\"FieldMaxLength➩" + rowindex + "\" type=\"text\" class=\"txt\" style=\"text-align: center;\"  datacol=\"No\" err=\"长度\" checkexpession=\"Num\" onkeyup=\"Keypress(this.id)\"/></td>");
                Sb_Table_Out.Append("<td style=\"width: 80px;text-align: center;\"><input " + IsDisabled + " dbfield=\"true\" id=\"FieldMinLength➩" + rowindex + "\" type=\"checkbox\" /></td>");
                Sb_Table_Out.Append("<td style=\"width: 80px;\"><input " + IsDisabled + " dbfield=\"true\" id=\"SortCode➩" + rowindex + "\" type=\"text\" class=\"txt\" style=\"text-align: center;\" datacol=\"No\" err=\"显示顺序\" checkexpession=\"Num\" value=\"" + rowindex + "\" /></td>");
                Sb_Table_Out.Append("<td style=\"width: 80px;text-align: center;\"><input " + IsDisabled + " dbfield=\"true\" id=\"Enabled➩" + rowindex + "\" type=\"checkbox\" checked=\"checked\" /></td>");
                Sb_Table_Out.Append("<td ><input " + IsDisabled + " dbfield=\"true\" id=\"FieldMemo➩" + rowindex + "\" type=\"text\" class=\"txt\" /></td>");
                Sb_Table_Out.Append("</tr>");
                rowindex++;
            }
            txtXML.Value = sbxml.ToString();
        }
        public string IsSelected(string data, string obj)
        {
            if (data == obj)//文本
            {
                return "selected";
            }
            return "";
        }
        public string IsChecked(string data)
        {
            if (data == "0")
                return "checked=\"checked\"";
            else
                return "";
        }
    }
}