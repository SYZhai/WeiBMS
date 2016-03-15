<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemDetailsList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Dictionary.ItemDetailsList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>辅助资料明细列表</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        var ItemsId = GetQuery('ItemsId');//字段类别主键
        var FullName = unescape(GetQuery('FullName'));//字段类别
        $(function () {
            ListGrid();
            $("#ItemName").text(FullName);
        })
        /**加载表格函数**/
        function ListGrid() {
            //url：请求地址
            var url = "ItemDetailsList.aspx?action=GridBindList&ItemsId=" + ItemsId;
            //colM：表头名称
            var colM = [
                { title: "明细表主键", hidden: true },
                { title: "代码(值)", width: 100 },
                { title: "名称", width: 150 },
                {
                    title: "有效", width: 60, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[3];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                    }
                },
                {
                    title: "允许编辑", width: 80, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[4];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                    }
                },
                {
                    title: "允许删除", width: 80, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[5];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                    }
                },
                { title: "排序", width: 60, align: "center" },
                { title: "描述", width: 400, align: "left" }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "ItemDetailsId",
                "ItemCode",
                "ItemName",
                "Enabled",
                "AllowEdit",
                "AllowDelete",
                "SortCode",
                "Description"
            ];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({ topVisible: false, freezeCols: 6 });
            pqGridResizefixed("#grid_paging", $(window).height() - 63, +15);
        }
        //新增
        function add() {
            var url = "/CommonModule/Dictionary/ItemDetailsForm.aspx?ItemsId=" + ItemsId;
            top.openDialog(url, 'ItemDetailsForm', '辅助资料明细 - 添加', 400, 235, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/CommonModule/Dictionary/ItemDetailsForm.aspx?key=" + key;
                top.openDialog(url, 'ItemDetailsForm', '辅助资料明细 - 编辑', 400, 235, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('ItemDetailsList.aspx', delparm);
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
        <div class="btnbartitle">
            <div>
                辅助资料明细 - <span id="ItemName"></span>
            </div>
        </div>
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>
