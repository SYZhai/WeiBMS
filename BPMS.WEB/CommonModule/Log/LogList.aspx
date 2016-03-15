<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Log.LogList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>操作日志列表</title>
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
            var url = "LogList.aspx?action=GridBindList&Parm_Key_Value=" + escape(Parm_Key_Value);
            //colM：表头名称
            var colM = [
                { title: "操作日志主键", width: 100, align: "center", hidden: true },
                { title: "日期/时间", width: 140, align: "center" },
                {
                    title: "操作类型", width: 70, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[2];
                        if (value == '1') {
                            return "<img src='/Themes/Images/16/application_add.png' style='vertical-align: middle;' alt='' />&nbsp;新 增";
                        }
                        if (value == '2') {
                            return "<img src='/Themes/Images/16/application_edit.png' style='vertical-align: middle;' alt='' />&nbsp;修 改";
                        }
                        if (value == '3') {
                            return "<img src='/Themes/Images/16/application_delete.png' style='vertical-align: middle;' alt='' />&nbsp;删 除";
                        }
                        if (value == '4') {
                            return "<img src='/Themes/Images/16/anchor.png' style='vertical-align: middle;' alt='' />&nbsp;其 他";
                        }
                        if (value == '5') {
                            return "<img src='/Themes/Images/16/world_link.png' style='vertical-align: middle;' alt='' />&nbsp;访 问";
                        }
                        if (value == '6') {
                            return "<img src='/Themes/Images/16/back.png' style='vertical-align: middle;' alt='' />&nbsp;离 开";
                        }
                    }
                },
                { title: "操作数据表", width: 200},
                { title: "对象主键值", width: 280 },
                { title: "操作模块", width: 150 },
                { title: "IP地址", width: 100, align: "center" },
                { title: "操作用户", width: 100, align: "center" },
                {
                    title: "查询详细", width: 80, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var status = rowData[2];
                        var value = rowData[8];
                        return "<img onclick=\"Detail('" + status + "','" + value + "')\" title='点击查看日志详细信息' src='/Themes/Images/16/application_form_magnify.png' style='vertical-align: middle;cursor: pointer;' alt='' />";
                    }
                }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "SyslogsId",
                "CreateDate",
                "OperationType",
                "TableName",
                "Object_ID",
                "BusinessName",
                "OperationIp",
                "CreateUserName",
                "SyslogsId"
            ];
            PQLoadGrid("#grid_paging", url, colM, sort, 100, true)
            $("#grid_paging").pqGrid({
                freezeCols: 4,
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />操作日志"
            })
            pqGridResize("#grid_paging", -82, +15);
        }
        //点击查看日志详细信息
        function Detail(status, id) {
            var url = "/CommonModule/Log/LogDetail.aspx?SyslogsId=" + id + '&status=' + status;
            top.openDialog(url, 'LogDetail', '日志详细信息', 850, 450, 50, 50);
        }
        //清除日志
        function Empty() {
            var url = "/CommonModule/Log/DeleteLog.aspx?type=2";
            top.openDialog(url, 'DeleteLog', '清除操作日志', 350, 109, 50, 50);
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
                        <th>操作类型：
                        </th>
                        <td>
                            <select id="OperationType" dbfield="true" class="select" runat="server" style="width: 70px">
                                <option value="">全部</option>
                                <option value="1">新增</option>
                                <option value="2">修改</option>
                                <option value="3">删除</option>
                                <option value="4">其他</option>
                            </select>
                        </td>
                        <th>操作模块：
                        </th>
                        <td>
                            <input id="BusinessName" dbfield="true" runat="server" type="text" class="txt" style="width: 120px" />
                        </td>
                        <th>操作用户：
                        </th>
                        <td>
                            <input id="CreateUserName" dbfield="true" runat="server" type="text" class="txt" style="width: 120px" />
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
