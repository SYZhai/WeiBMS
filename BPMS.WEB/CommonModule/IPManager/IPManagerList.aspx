<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IPManagerList.aspx.cs" Inherits="BPMS.WEB.CommonModule.IPManager.IPManagerList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统访问控制</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            ListGrid();
        });
        /**加载表格函数**/
        function ListGrid() {
            //url：请求地址
            var url = "IPManagerList.aspx?action=GridBindList";
            //colM：表头名称
            var colM = [
                { title: "IP黑名单主键", hidden: true },
                { title: "起始IP", width: 100, align: "center" },
                { title: "结束IP", width: 100, align: "center" },
                { title: "失效时间", width: 140, align: "center" },
                {
                    title: "规则类型", width: 100, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[4];
                        if (value == '1')
                            return "<label style=\"color:blue\">允许登录</label>";
                        else
                            return "<label style=\"color:red\">不允许登录</label>";
                    }
                },
                {
                    title: "有效", width: 60, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[5];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                    }
                },
                { title: "描述", width: 500, align: "left" }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "IPBlacklistId",
                "StartIp",
                "EndIp",
                "Failuretime",
                "Category",
                "Enabled",
                "Description"
            ];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({ topVisible: false });
            pqGridResizefixed("#grid_paging", $(window).height() - 34, +15);
        }
        //新增
        function add() {
            var url = "/CommonModule/IPManager/IPManagerForm.aspx";
            top.openDialog(url, 'IPManagerForm', 'IP访问规则 - 添加', 450, 330, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/CommonModule/IPManager/IPManagerForm.aspx?key=" + key;
                top.openDialog(url, 'IPManagerForm', 'IP访问规则 - 编辑', 450, 330, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('IPManagerList.aspx', delparm);
            }
        }
        //刷新
        function windowload() {
            $("#grid_paging").pqGrid("refreshDataAndView");
            GetRowIndex = -1;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>
