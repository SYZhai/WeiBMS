<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Employee.EmployeeList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>员工、职员列表</title>
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
            var Category = $("#hiddenCategory").val()
            var OrganizationId = $("#hiddenOrganizationId").val()
            var Parm_Key_Value = $("#query").val() + "☻" + $("#keywords").val() + "≌Enabled☻" + escape($("#Enabled").attr("checked") ? 1 : 0) + "≌";
            //url：请求地址
            var url = "EmployeeList.aspx?action=GridBindList&Category=" + escape(Category) + '&OrganizationId=' + OrganizationId + '&Parm_Key_Value=' + escape(Parm_Key_Value);
            //colM：表头名称
            var colM = [
                { title: "员工/职员主键", hidden: true },
                { title: "工号", width: 80, align: "center" },
                { title: "姓名", width: 80, align: "center" },
                { title: "性别", width: 20, align: "center" },
                { title: "电子邮件", width: 100, align: "center" },
                { title: "手机", width: 100, align: "center" },
                { title: "办公电话", width: 100, align: "center" },
                { title: "职位", width: 80, align: "center" },
                { title: "职称", width: 80, align: "center" },
                {
                    title: "离职", width: 60, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[9];
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
                        var value = rowData[10];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                    }
                },
                { title: "描述", width: 300 }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "EmployeeId",
                "Code",
                "RealName",
                "Gender",
                "Email",
                "Mobile",
                "OfficePhone",
                "DutyId",
                "TitleId",
                "IsDimission",
                "Enabled",
                "Description"
            ];
            PQLoadGrid("#grid_paging", url, colM, sort, 50, true);
            $("#grid_paging").pqGrid({
                freezeCols: 8,
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />职员信息列表"
            })
            pqGridResize("#grid_paging", -111, +15);
        }
        //新增
        function add() {
            var url = "/CommonModule/Employee/EmployeeForm.aspx";
            top.openDialog(url, 'EmployeeForm', '职员信息 - 添加', 750, 450, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/CommonModule/Employee/EmployeeForm.aspx?key=" + key;
                top.openDialog(url, 'EmployeeForm', '职员信息 - 编辑', 750, 450, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('EmployeeList.aspx', delparm);
            }
        }
        //引出
        function derive() {
            var parm = 'UserList.ashx?action=derive';
            window.location.href = parm;
        }
        //刷新
        function windowload() {
            $("#grid_paging").pqGrid("refreshDataAndView");
            GetRowIndex = -1;
        }
        //组织机构回调
        function OrganizeTree_Callback(Category, OrganizationId, OrganizationName) {
            $("#OrganizationName").html(OrganizationName);
            $("#hiddenCategory").val(Category)
            $("#hiddenOrganizationId").val(OrganizationId)
            ListGrid();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hiddenCategory" />
        <input type="hidden" id="hiddenOrganizationId" />
        <div class="btnbartitle">
            <div>
                职员信息 - <span id="OrganizationName">所有员工</span>
            </div>
        </div>
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div class="btnbarcontetn" style="margin-top: 1px; background: #fff">
            <div>
                <table border="0" class="frm-find" style="height: 45px;">
                    <tr>
                        <th>查询条件：
                        </th>
                        <td>
                            <select id="query" class="select" runat="server" style="width: 70px">
                                <option value="Code">工号</option>
                                <option value="RealName">姓名</option>
                                <option value="Mobile">手机</option>
                            </select>
                        </td>
                        <th>关键字：
                        </th>
                        <td>
                            <input id="keywords" runat="server" type="text" class="txt" style="width: 200px" />
                        </td>
                        <td>
                            <input id="btnSearch" type="button" class="btnSearch" value="搜 索" onclick="ListGrid()" />
                            <span class="item">
                                <input id="Enabled" onclick="ListGrid()" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                                <label for="Enabled" style="vertical-align: middle;">只显示有效的</label>
                                &nbsp;&nbsp;
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>
