<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Role.RoleList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统角色列表</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        var OrganizationId = GetQuery('OrganizationId');//公司主键
        var OrganizationName = unescape(GetQuery('FullName'));  //公司名称
        $(function () {
            ListGrid();
            $("#OrganizationName").text(OrganizationName);
        });
        /**加载表格函数**/
        function ListGrid() {
            //url：请求地址
            var url = "RoleList.aspx?action=GridBindList&OrganizationId=" + OrganizationId;
            //colM：表头名称
            var colM = [
                { title: "角色主键", width: 100, align: "left", hidden: true },
                { title: "角色编号", width: 100, align: "center" },
                { title: "角色名称", width: 200, align: "center" },
                { title: "角色分类", width: 100, align: "center" },
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
                {
                    title: "允许编辑", width: 80, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[5];
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
                        var value = rowData[6];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                    }
                },
                { title: "描述", width: 300, align: "left" }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "RoleId",
                "Code",
                "FullName",
                "Category",
                "Enabled",
                "AllowEdit",
                "AllowDelete",
                "Description"
            ];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({ topVisible: false, freezeCols: 6 });
            pqGridResizefixed("#grid_paging", $(window).height() - 63, +15);
        }
        //新增
        function add() {
            var url = "/CommonModule/Role/RoleForm.aspx?OrganizationId=" + OrganizationId;
            top.openDialog(url, 'RoleForm', '角色信息 - 添加', 450, 270, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/CommonModule/Role/RoleForm.aspx?key=" + key;
                top.openDialog(url, 'RoleForm', '角色信息 - 编辑', 450, 270, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('RoleList.aspx', delparm);
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
                角色列表 - <span id="OrganizationName"></span>
            </div>
        </div>
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>
