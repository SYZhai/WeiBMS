<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsList.aspx.cs" Inherits="BPMS.WEB.ExampleModule.News.NewsList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新闻列表</title>
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
            var url = "NewsList.aspx?action=GridBindList";
            //colM：表头名称
            var colM = [
                { title: "新闻表主键", hidden: true },
                { title: "内容简介", width: 400, align: "left" },
                { title: "关键字", width: 200, align: "left" },
                { title: "阅读次数", width: 80, align: "center" },
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
                { title: "创建时间", width: 140, align: "center" },
                { title: "创建用户", width: 100, align: "center" },
                { title: "修改时间", width: 140, align: "center" },
                { title: "修改用户", width: 100, align: "center" }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "NewsId",
                "Introduction",
                "Keywords",
                "ReadCount",
                "Enabled",
                "CreateDate",
                "CreateUserName",
                "ModifyDate",
                "ModifyUserName"
            ];
            PQLoadGrid("#grid_paging", url, colM, sort, 20)
            $("#grid_paging").pqGrid({ freezeCols: 1 })
            pqGridResize("#grid_paging", -51, -2);
        }
        //新增
        function add() {
            var url = "/ExampleModule/News/NewsForm.aspx";
            top.openDialog(url, 'NewsForm', '新闻信息 - 添加', 800, 500, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/ExampleModule/News/NewsForm.aspx?key=" + key;
                top.openDialog(url, 'NewsForm', '新闻信息 - 编辑', 800, 500, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('NewsList.aspx', delparm);
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
