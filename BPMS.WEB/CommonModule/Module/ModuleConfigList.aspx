<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleConfigList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Module.ModuleConfigList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>模块列表表头定义列表</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        var Menu_Id = GetQuery('Menu_Id');      //模块主键;
        var Menu_Name = GetQuery('Menu_Name');  //模块名称;
        $(function () {
            ListGrid();
        });
        /**加载表格函数**/
        function ListGrid() {
            //url：请求地址
            var url = "ModuleConfigList.aspx?action=GridBindList&MenuId=" + Menu_Id;
            //colM：表头名称
            var colM = [
                { title: "主键", hidden: true },
                { title: "列名", width: 150, align: "left" },
                { title: "绑定字段", width: 200, align: "left" },
                { title: "宽度", width: 60, align: "center" },
                {
                    title: "隐藏", width: 60, align: "center", render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[4];
                        if (value == "0") {
                            return "<img src='/Themes/Images/checknomark.gif'/>"
                        }
                        else {
                            return "<img src='/Themes/Images/checkmark.gif'/>"
                        }
                    }
                },
                { title: "对齐", width: 60, align: "center" },
                {
                    title: "公开", width: 60, align: "center", render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[6];
                        if (value == "0") {
                            return "<img src='/Themes/Images/checknomark.gif'/>"
                        }
                        else {
                            return "<img src='/Themes/Images/checkmark.gif'/>"
                        }
                    }
                },
                {
                    title: "有效", width: 60, align: "center", render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[7];
                        if (value == "0") {
                            return "<img src='/Themes/Images/checknomark.gif'/>"
                        }
                        else {
                            return "<img src='/Themes/Images/checkmark.gif'/>"
                        }
                    }
                },
                { title: "排序", width: 60, align: "center" },
                { title: "描述", width: 200, align: "left" },
                { title: "固定数据转换如：1-男;0-女", width: 500, align: "left" }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "TableColumnsId",
                "Title",
                "Field",
                "Width",
                "IsHidden",
                "Align",
                "IsPublic",
                "Enabled",
                "SortCode",
                "Description",
                "Custom",
            ];
            PQLoadGridNoPage("#grid_paging", url, colM, sort);
            $("#grid_paging").pqGrid({
                freezeCols: 9,
                title: "管理模块字段 - " + decodeURI(Menu_Name) + "",
                cellDblClick: function (evt, ui) {
                    GetRowIndex = ui.rowIndxPage;
                }
            });
            pqGridResizefixed("#grid_paging", $(window).height() - 34, +15);
        }
        //新增
        function add() {
            var url = "/CommonModule/Module/ModuleConfigForm.aspx?Menu_Id=" + Menu_Id;
            top.openDialog(url, 'ModuleConfigForm', '定义字段 - 添加', 500, 370, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/CommonModule/Module/ModuleConfigForm.aspx?key=" + key;
                top.openDialog(url, 'ModuleConfigForm', '定义字段 - 编辑', 500, 370, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('ModuleConfigList.aspx', delparm);
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
        <div class="tools_bar">
            <a title="新增" onclick="add();" class="tools_btn"><span><b style="background: url('/Themes/images/16/application_add.png') 50% 4px no-repeat;">新增</b></span></a>
            <a title="编辑" onclick="edit();" class="tools_btn"><span><b style="background: url('/Themes/images/16/application_edit.png') 50% 4px no-repeat;">编辑</b></span></a>
            <a title="删除" onclick="Delete();" class="tools_btn"><span><b style="background: url('/Themes/images/16/application_delete.png') 50% 4px no-repeat;">删除</b></span></a>
        </div>
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>

