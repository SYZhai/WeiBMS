<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterfaceManageList.aspx.cs" Inherits="BPMS.WEB.CommonModule.InterfaceManage.InterfaceManageList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>动态接口配置</title>
    <link href="/Themes/Styles/Style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script type="text/javascript">
        $(function () {
            ListGrid();
        });
        /**加载表格函数**/
        function ListGrid() {
            var Parm_Key_Value = $("#query").val() + "☻" + $("#keywords").val() + "≌";
            //url：请求地址
            var url = "InterfaceManageList.aspx?action=GridBindList&Parm_Key_Value=" + escape(Parm_Key_Value);
            //colM：表头名称
            var colM = [
                { title: "主键", width: 35, hidden: true },
                { title: "接口编号", width: 100 },
                { title: "接口名称", width: 150 },
                {
                    title: "活动类型", width: 200, render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[3];
                        if (value == 0) {
                            return "新增-ExecuteBySql";
                        }
                        else if (value == 1) {
                            return "修改-ExecuteBySql";
                        }
                        else if (value == 2) {
                            return "删除-ExecuteBySql";
                        }
                        else if (value == 3) {
                            return "查询-DataTableBySQL";
                        }
                        else if (value == 4) {
                            return "存储过程-DataTableProc";
                        }
                        else if (value == 5) {
                            return "存储过程-DataSetProc";
                        }
                        else if (value == 6) {
                            return "存储过程-ExecuteByProc";
                        }
                        else if (value == 7) {
                            return "存储过程-BatchExecuteByProc";
                        }
                    }
                },
                {
                    title: "有效", width: 60, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[4];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                    }
                },
                { title: "接口描述", width: 200 },
                { title: "创建用户", width: 100, align: "center" },
                { title: "创建时间", width: 140, align: "center" },
                { title: "修改用户", width: 100, align: "center" },
                { title: "修改时间", width: 140, align: "center" }
            ];
            //sort：要显示字段,数组对应
            var sort = ["InterfaceId",
                        "Code",
                        "FullName",
                        "Type",
                        "Enabled",
                        "Description",
                        "CreateUserName",
                        "CreateDate",
                        "ModifyUserName",
                        "ModifyDate"];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({
                freezeCols: 7,
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />动态接口配置列表"
            });
            pqGridResizefixed("#grid_paging", $(window).height() - 82, +15);
        }
        //新增
        function add() {
            Urlhref("InterfaceManageForm.aspx");
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                Urlhref("InterfaceManageForm.aspx?key=" + key);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('InterfaceManageList.aspx', delparm)
            }
        }
        //回调
        function windowload() {
            $("#grid_paging").pqGrid("refreshDataAndView");
            GetRowIndex = -1;
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
                        <th>查询条件：
                        </th>
                        <td>
                            <select id="query" class="select" runat="server" style="width: 70px">
                                <option value="Code">编码</option>
                                <option value="FullName">名称</option>
                            </select>
                        </td>
                        <th>关键字：
                        </th>
                        <td>
                            <input id="keywords" runat="server" type="text" class="txt" style="width: 200px" />
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

