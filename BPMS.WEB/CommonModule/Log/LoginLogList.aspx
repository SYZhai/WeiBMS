<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginLogList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Log.LoginLogList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>登录日志</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            ListGrid();
        });
        /**加载表格函数**/
        function ListGrid() {
            var Parm_Key_Value = "";
            $(".frm-find tr td").find("[DBField=true]").each(function () {
                var pk_id = $(this).attr('id');
                var pk_value = $("#" + pk_id).val();
                Parm_Key_Value += pk_id + "☻" + pk_value + "≌";
            });
            //url：请求地址
            var url = "LoginLogList.aspx?action=GridBindList&Parm_Key_Value=" + escape(Parm_Key_Value);
            //colM：表头名称
            var colM = [
                { title: "登录系统日志主键", width: 100, align: "left", hidden: true },
                { title: "日期/时间", width: 140, align: "center" },
                { title: "登录账户", width: 100, align: "center" },
                {
                    title: "登录状态", width: 100, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[3];
                        if (value == '登录失败') {
                            return "<span style=' color:red;'>登录失败</span>"
                        }
                        else if (value == '账户锁定') {
                            return "<span style=' color:  orange;'>账户锁定</span>"
                        }
                        return value;
                    }
                },
                { title: "IP地址", width: 100, align: "center" },
                { title: "IP地址所在城市", width: 500, align: "left" }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "SysLoginLogId",
                "CreateDate",
                "Account",
                "Status",
                "IPAddress",
                "IPAddressName"
            ];
            PQLoadGrid("#grid_paging", url, colM, sort, 100, true)
            $("#grid_paging").pqGrid({
                freezeCols: 4,
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />登录日志"
            })
            pqGridResize("#grid_paging", -82, +15);
        }
        //清除日志
        function Empty() {
            var url = "/CommonModule/Log/DeleteLog.aspx?type=1";
            top.openDialog(url, 'DeleteLog', '清除登录日志', 350, 109, 50, 50);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div class="btnbarcontetn" style="margin-top: 1px; background: #fff">
            <div>
                <table border="0" class="frm-find" style="height: 45px;">
                    <tr>
                        <th>日期时间：
                        </th>
                        <td>
                            <input id="start_Date" dbfield="true" runat="server" type="text" class="txt Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 00:00' })" style="width: 120px" />
                            至
                            <input id="end_Date" dbfield="true" runat="server" type="text" class="txt Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 23:59' })" style="width: 120px" />
                        </td>
                        <th>登录账户：
                        </th>
                        <td>
                            <input id="Account" dbfield="true" runat="server" type="text" class="txt" style="width: 120px" />
                        </td>
                        <td>
                            <input id="btnSearch" type="button" class="btnSearch" value="搜 索" onclick="ListGrid()" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>
