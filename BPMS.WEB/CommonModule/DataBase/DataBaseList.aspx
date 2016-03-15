<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBaseList.aspx.cs" Inherits="BPMS.WEB.CommonModule.DataBase.DataBaseList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>表字段说明</title>
    <link href="/Themes/Styles/Style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script type="text/javascript">
        var tableCode = GetQuery('tableCode');//表名
        var tableRemark = GetQuery('tableRemark');//表名称
        $(function () {
            ListGrid();
            $('#FullName').html(tableCode + "，" + unescape(tableRemark));
        });
        //表结构
        function ListGrid() {
            //url：请求地址
            var url = "DataBaseList.aspx?action=pqGrid_List&tableCode=" + escape(tableCode);
            //colM：表头名称
            var colM = [
                { title: "列名", width: 200 },
                { title: "数据类型", width: 100, align: "center" },
                { title: "长度", width: 50, align: "center" },
                {
                    title: "标识", width: 50, align: "center", render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[3];
                        if (value == "") {
                            return "<img src='/Themes/Images/checknomark.gif'/>"
                        }
                        else {
                            return "<img src='/Themes/Images/checkmark.gif'/>"
                        }
                    }
                },
                {
                    title: "主键", width: 50, align: "center", render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[4];
                        if (value == "") {
                            return "<img src='/Themes/Images/checknomark.gif'/>"
                        }
                        else {
                            return "<img src='/Themes/Images/checkmark.gif'/>"
                        }
                    }
                },
                {
                    title: "允许空", width: 60, align: "center", render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[5];
                        if (value == "") {
                            return "<img src='/Themes/Images/checknomark.gif'/>"
                        }
                        else {
                            return "<img src='/Themes/Images/checkmark.gif'/>"
                        }
                    }
                },
                { title: "默认值", width: 100 },
                { title: "说明", width: 300 }
            ];
            //sort：要显示字段,数组对应;
            var sort = ["column",
                        "datatype",
                        "length",
                        "identity",
                        "key",
                        "isnullable",
                        "default",
                        "remark"];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({ topVisible: false, freezeCols: 6 });
            pqGridResizefixed("#grid_paging", $(window).height() - 63, +15);
        }
        //新建查询
        function addSQLQuery() {
            var url = "SQLQuery.aspx?tableCode=" + tableCode;
            Urlhref(url);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                <span id="FullName"></span>
            </div>
        </div>
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>
