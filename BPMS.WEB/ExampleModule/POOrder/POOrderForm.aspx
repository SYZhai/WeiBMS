<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="POOrderForm.aspx.cs" Inherits="BPMS.WEB.ExampleModule.POOrder.POOrderForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>采购订单表单</title>
    <link href="/Themes/Styles/Style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js"></script>
    <script src="POOrderForm.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Load_bills_Page_Location();
        })
        //初始化验证-单据：前一单、后一单、最前、最后 按钮禁用
        function Load_bills_Page_Location() {
            //最前(T)、最后(E)、中间(M)
            var bills_Page_Location = GetQuery('Location');
            switch (bills_Page_Location) {
                case "T":
                    $("#button_first_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    $("#button_prev_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    break;
                case "E":
                    $("#button_next_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    $("#button_last_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    break;
                default:
                    break;
            }
        }
        //最前面单据
        function first_bills() {
            bills_Page("T");
        }
        //前面单单
        function prev_bills() {
            bills_Page("B");
        }
        //后面单单
        function next_bills() {
            bills_Page("A");
        }
        //最后面单据
        function last_bills() {
            bills_Page("E");
        }
        //前一单、后一单、最前、最后 处理
        function bills_Page(parm_Location) {
            alert('该功能就是参考模型，您请联系开发商演示！');
            return false;
            Loading(true);
            var key = GetQuery('key');
            var parm = "action=Get_BillID&Table=WMS_POOrder&Bill_Type=&Bill_Key=POOrder_ID&Bill_ID=" + key + "&Location=" + parm_Location;
            getAjax('/Frame/Utilities.ashx', parm, function (data) {
                var array = new Array();
                array = data.split(',');
                var Bill_ID = array[0];
                var Location = array[1];
                if (Bill_ID == "" && parm_Location == 'T') {
                    $("#button_first_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    $("#button_prev_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    return false;
                } else if (Bill_ID == "" && parm_Location == 'B') {
                    $("#button_first_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    $("#button_prev_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    return false;
                } else if (Bill_ID == "" && parm_Location == 'A') {
                    $("#button_next_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    $("#button_last_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    return false;
                } else if (Bill_ID == "" && parm_Location == 'E') {
                    $("#button_next_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    $("#button_last_bills").attr({ "disabled": "disabled" }).attr('onclick', '');
                    return false;
                }
                var _Location = GetQuery('Location');
                var changeURL = "";
                if (_Location != "") {
                    changeURL = changeURLPar(window.location.href, 'key', Bill_ID);
                    changeURL = changeURLPar(changeURL, 'Location', Location);
                } else {
                    changeURL = changeURLPar(window.location.href, 'key', Bill_ID) + '&Location=' + Location;
                }
                window.location.href = changeURL;
            });
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="Organization_ID" runat="server" type="hidden" />
        <div class="tools_bar">
            <a id="button_first_bills" title="最前面单据" onclick="first_bills()" class="tools_btn"><span><b style="background: url('/Themes/images/16/first.gif') 50% 4px no-repeat;">最前</b></span></a>
            <a id="button_prev_bills" title="前面单单" onclick="prev_bills()" class="tools_btn"><span><b style="background: url('/Themes/images/16/prev.gif') 50% 4px no-repeat;">前单</b></span></a>
            <a id="button_next_bills" title="后面单单" onclick="next_bills()" class="tools_btn"><span><b style="background: url('/Themes/images/16/next.gif') 50% 4px no-repeat;">后单</b></span></a>
            <a id="button_last_bills" title="最后面单据" onclick="last_bills()" class="tools_btn"><span><b style="background: url('/Themes/images/16/last.gif') 50% 4px no-repeat;">最后</b></span></a>
            <span class="tools_btn-btn-separator"></span>
            <a id="button_Commit_Save" title="保存单据" onclick="Commit_Save()" class="tools_btn"><span><b style="background: url('/Themes/images/16/disk.png') 50% 4px no-repeat;">保存</b></span></a>
            <span class="tools_btn-btn-separator"></span>
            <a title="退出" onclick="ThisCloseTab()" class="tools_btn"><span><b style="background: url('/Themes/images/16/back.png') 50% 4px no-repeat;">离开</b></span></a>
        </div>
        <div class="div-body-From">
            <table id="tb_POOrderFrom" border="0" class="bill-frm">
                <tr>
                    <td align="center" colspan="8">
                        <div style="font-family: 华文楷体; font-size: x-large; height: 60px; line-height: 60px;">
                            采购订单&nbsp; <img src="../../Themes/Images/billstatis1.png" style="vertical-align: middle;" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>供应商[*]：
                    </th>
                    <td>
                        <input dbfield="true" id="Supplier_ID" runat="server" type="hidden" />
                        <input id="Supplier_Name" type="text" runat="server" class="txt " style="width: 95%" />
                    </td>
                    <th>制单日期[*]：
                    </th>
                    <td>
                        <input dbfield="true" id="BillDate" runat="server" type="text" class="txt" datacol="yes" err="制单日期"
                            checkexpession="NotNull" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 00:00:00' })" style="width: 95%" />
                    </td>
                    <th>订单编号[*]：
                    </th>
                    <td>
                        <input dbfield="true" id="BillNo" runat="server" type="text" class="txt" datacol="yes" err="订单编号"
                            checkexpession="NotNull" style="width: 95%" />
                    </td>
                    <th>采购方式[*]：
                    </th>
                    <td>
                        <select dbfield="true" id="Method" class="billselect" runat="server" datacol="yes" err="采购方式"
                            checkexpession="NotNull" style="width: 97%">
                            <option value="">==请选择==</option>
                            <option value="现购">现购</option>
                            <option value="赊购">赊购</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>币别[*]：
                    </th>
                    <td>
                        <input dbfield="true" id="Currency_ID" runat="server" type="hidden" />
                        <input id="Currency_Name" type="text" runat="server" class="txt " style="width: 95%" />
                    </td>
                    <th>汇率[*]：
                    </th>
                    <td>
                        <input dbfield="true" id="ExchangeRate" disabled runat="server" type="text" class="txt" style="width: 95%" />
                    </td>
                    <th>结算方式[*]：
                    </th>
                    <td>
                        <select dbfield="true" id="Clearing_ID" class="billselect" runat="server" style="width: 97%">
                        </select>
                    </td>
                    <th>结算日期：
                    </th>
                    <td>
                        <input dbfield="true" id="Clearing_Date" runat="server" type="text" class="txt" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 00:00:00' })" style="width: 95%" />
                    </td>
                </tr>
                <tr>
                    <th>采购员[*]：
                    </th>
                    <td>
                        <input dbfield="true" id="Salesman_ID" runat="server" type="hidden" />
                        <input dbfield="true" id="Salesman" runat="server" type="text" class="txt " style="width: 95%" />
                    </td>
                    <th>制单员[*]：
                    </th>
                    <td>
                        <input id="CreateUserName" runat="server" type="text" class="txt" style="width: 95%" />
                    </td>
                    <th>变更员：
                    </th>
                    <td>
                        <input id="ModifyUserName" runat="server" type="text" class="txt" style="width: 95%" />
                    </td>
                    <th>变更日期：
                    </th>
                    <td>
                        <input id="ModifyDate" runat="server" type="text" class="txt" style="width: 95%" />
                    </td>
                </tr>
                <tr>
                    <th>备注：
                    </th>
                    <td colspan="7">
                        <input dbfield="true" id="Remark" runat="server" type="text" class="txt" style="width: 99%" />
                    </td>
                </tr>
            </table>
            <table id="tb_POOrderEntry" class="grid" style="width: 100%;">
                <thead>
                    <tr>
                        <td style="width: 50px; text-align: center;">行号
                        </td>
                        <td style="width: 100px; text-align: center;">物料代码[*]
                        </td>
                        <td style="width: 150px;">物料名称
                        </td>
                        <td style="width: 80px; text-align: center;">规格型号
                        </td>
                        <td style="width: 80px; text-align: center;">单位[*]
                        </td>
                        <td style="width: 80px; text-align: center;">数量[*]
                        </td>
                        <td style="width: 80px; text-align: center;">单价[*]
                        </td>
                        <td style="width: 80px; text-align: center;">含税单价
                        </td>
                        <td style="width: 80px; text-align: center;">金额
                        </td>
                        <td style="width: 80px; text-align: center;">税率(%)
                        </td>
                        <td style="width: 80px; text-align: center;">税额
                        </td>
                        <td style="width: 80px; text-align: center;">价税合计
                        </td>
                        <td style="width: 80px; text-align: center;">交货日期[*]
                        </td>
                        <td style="width: 100px;">备注</td>
                        <td style="width: 11px; text-align: center;"></td>
                    </tr>
                </thead>
                <tbody id="add_Table">
                </tbody>
            </table>
            <div class="line"></div>
            <table class="grid" style="width: 100%;">
                <tfoot>
                    <tr>
                        <td style="width: 50px; text-align: center;">合计
                        </td>
                        <td style="width: 100px;"></td>
                        <td style="width: 150px;"></td>
                        <td style="width: 80px; text-align: center;"></td>
                        <td style="width: 80px; text-align: center;"></td>
                        <td style="width: 80px; text-align: center;">
                            <label id="lbl_TotalSum"></label>
                        </td>
                        <td style="width: 80px; text-align: center;"></td>
                        <td style="width: 80px; text-align: center;"></td>
                        <td style="width: 80px; text-align: center;"></td>
                        <td style="width: 80px; text-align: center;"></td>
                        <td style="width: 80px; text-align: center;">
                            <label id="lbl_TotalCESSAmount"></label>
                        </td>
                        <td style="width: 80px; text-align: center;">
                            <label id="lbl_TotalTotalAmount"></label>
                        </td>
                        <td style="width: 80px; text-align: center;"></td>
                        <td style="width: 100px;"></td>
                        <td style="width: 11px; text-align: center;"></td>
                    </tr>
                </tfoot>
            </table>
            <div class="line"></div>
        </div>
    </form>
</body>
</html>
