<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlexibleFormList.aspx.cs" Inherits="BPMS.WEB.CommonModule.FlexibleForm.FlexibleFormList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>自定义表单信息</title>
    <link href="/Themes/Styles/Style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script type="text/javascript">
        $(function () {
            ListGrid();
            $("#TypeName").html(unescape(GetQuery('TypeName')))
        });
        /**加载表格函数**/
        function ListGrid() {
            var ParentId = GetQuery("ParentId");//接收参数
            //url：请求地址
            var url = "FlexibleFormList.aspx?action=GridBindList&ParentId=" + ParentId;
            //colM：表头名称
            var colM = [
                { title: "主键", width: 35, hidden: true },
                { title: "属性名称", width: 100 },
                { title: "控件名称", width: 150 },
                {
                    title: "控件类型", width: 80, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[3];
                        if (value == 1) {
                            return "文本框";
                        } else if (value == 2) {
                            return "下拉框";
                        } else if (value == 3) {
                            return "日期框";
                        } else if (value == 4) {
                            return "标  签";
                        } else if (value == 5) {
                            return "文本区";
                        }
                    }
                },
                { title: "控件长度", width: 80, align: "center" },
                { title: "控件高度", width: 80, align: "center" },
                { title: "最大长度", width: 80, align: "center" },
                { title: "控件样式", width: 80, align: "center" },
                { title: "排序", width: 80, align: "center" },
                {
                    title: "有效", width: 80, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[9];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                    }
                },
                { title: "默认值", width: 100, align: "center" },
                { title: "描述", width: 200 }
            ];
            //sort：要显示字段,数组对应
            var sort = ["PropertyId",
                        "FullName",
                        "Control_Id",
                        "Type",
                        "Length",
                        "Height",
                        "Showlength",
                        "Style",
                        "SortCode",
                        "Enabled",
                        "Defaults",
                        "Description"];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({ topVisible: false, freezeCols: 8 });
            pqGridResizefixed("#grid_paging", $(window).height() - 93, +15);
        }
        //新增
        function add() {
            var url = "/CommonModule/FlexibleForm/FlexibleFormForm.aspx?ParentId=" + GetQuery('ParentId');
            top.openDialog(url, 'FlexibleFormForm', '表单属性 - 添加', 750, 320, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/CommonModule/FlexibleForm/FlexibleFormForm.aspx?key=" + key;
                top.openDialog(url, 'FlexibleFormForm', '表单属性 - 编辑', 750, 320, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('FlexibleFormList.aspx', delparm)
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
                表单属性 - <span id="TypeName"></span>；<span style="color: Red;">注：该功能谨慎使用！</span>
            </div>
        </div>
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div class="WarmPrompt">
            温馨提示：以下操作建议在软件开发商指导下进行
        </div>
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>
