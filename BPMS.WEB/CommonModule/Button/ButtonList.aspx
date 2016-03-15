<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ButtonList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Button.ButtonList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>操作按钮列表</title>
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
            var Parm_Key_Value = $("#query").val() + "☻" + $("#keywords").val() + "≌";
            //url：请求地址
            var url = "ButtonList.aspx?action=GridBindList&Parm_Key_Value=" + escape(Parm_Key_Value);
            //colM：表头名称
            var colM = [
                { title: "按钮主键", hidden: true },
                { title: "编码", width: 200 },
                {
                    title: "图标", width: 60, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        return "<img src='/Themes/Images/16/" + rowData[2] + "'/>";

                    }
                },
                { title: "名称", width: 100, align: "center" },
                { title: "事件", width: 200, align: "left" },
                { title: "分类", width: 100, align: "center" },
                {
                    title: "分开", width: 60, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[6];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";

                    }
                },
                {
                    title: "有效", width: 60, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[7];
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
                "ButtonId",
                "Control_ID",
                "Img",
                "FullName",
                "Event",
                "Category",
                "Split",
                "Enabled",
                "SortCode",
                "Description"
            ];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({
                freezeCols: 7,
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />操作按钮列表"
            });
            pqGridResizefixed("#grid_paging", $(window).height() - 82, +15);
        }
        //新增
        function add() {
            var url = "/CommonModule/Button/ButtonForm.aspx";
            top.openDialog(url, 'ButtonForm', '操作按钮 - 添加', 450, 310, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/CommonModule/Button/ButtonForm.aspx?key=" + key;
                top.openDialog(url, 'ButtonForm', '操作按钮 - 编辑', 450, 310, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('ButtonList.aspx', delparm);
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
        <div class="btnbarcontetn" style="margin-top: 1px; background: #fff">
            <div>
                <table border="0" class="frm-find" style="height: 45px; ">
                    <tr>
                        <th>查询条件：
                        </th>
                        <td>
                            <select id="query" class="select" runat="server" style="width: 70px">
                                <option value="Control_ID">编码</option>
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
