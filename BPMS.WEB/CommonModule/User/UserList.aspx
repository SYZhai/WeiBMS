<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="BPMS.WEB.CommonModule.User.UserList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>用户、帐户列表</title>
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
            var Parm_Key_Value = $("#query").val() + "☻" + $("#keywords").val() + "≌Enabled☻" + escape($("#Enabled").attr("checked") ? 1 : 0) + "≌";
            //url：请求地址
            var url = "UserList.aspx?action=GridBindList&Parm_Key_Value=" + escape(Parm_Key_Value);
            //colM：表头名称
            var colM = [
                { title: "用户主键", width: 100, align: "left", hidden: true },
                { title: "编号", width: 100, align: "center" },
                { title: "登录账户", width: 100, align: "center" },
                { title: "姓名", width: 100, align: "center" },
                { title: "性别", width: 60, align: "center" },
                { title: "手机号码", width: 100, align: "center" },
                { title: "QQ号码", width: 100, align: "center" },
                { title: "电子邮件", width: 100, align: "center" },
                { title: "公司", width: 100, align: "center" },
                { title: "部门", width: 100, align: "center" },
                {
                    title: "有效", width: 60, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[10];
                        if (value == '0') {
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        }
                        if (value == '1') {
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                        }
                    }
                },
                { title: "登录次数", width: 70, align: "center" },
                { title: "最后登录时间", width: 140, align: "center" },
                { title: "说明", width: 500 }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "UserId",
                "Code",
                "Account",
                "RealName",
                "Gender",
                "Mobile",
                "OICQ",
                "Email",
                "CompanyId",
                "DepartmentId",
                "Enabled",
                "LogOnCount",
                "LastVisit",
                "Description"
            ];
            PQLoadGrid("#grid_paging", url, colM, sort, 50, true);
            $("#grid_paging").pqGrid({
                freezeCols: 10,
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />用户列表",
                cellDblClick: function (evt, ui) {
                    GetRowIndex = ui.rowIndxPage;
                    lookup();
                }
            })
            pqGridResize("#grid_paging", -82, +15);
        }
        //新增
        function add() {
            var url = "/CommonModule/User/UserForm.aspx";
            top.openDialog(url, 'UserForm', '用户信息 - 添加', 750, 450, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/CommonModule/User/UserForm.aspx?key=" + key;
                top.openDialog(url, 'UserForm', '用户信息 - 编辑', 750, 450, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('UserList.aspx', delparm);
            }
        }
        //重新设置新密码
        function SetNewPassword() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            var Account = GetPqGridRowValue("#grid_paging", 2);
            if (IsChecked(key)) {
                var url = "/CommonModule/User/UpdateUserPwd.aspx?key=" + key + '&Account=' + Account;
                top.openDialog(url, 'UpdateUserPwd', '重新设置新密码', 370, 185, 50, 50);
            }
        }
        //引出
        function derive() {
            var parm = 'UserList.ashx?action=derive';
            window.location.href = parm;
        }
        //用户分配角色
        function AllotRole() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            var Account = GetPqGridRowValue("#grid_paging", 2);
            var RealName = GetPqGridRowValue("#grid_paging", 3);
            if (IsChecked(key)) {
                var url = "/CommonModule/User/UserRole.aspx?UserId=" + key + '&RealName=' + escape(RealName + "（" + Account + "）");
                top.openDialog(url, 'UserRole', '用户分配角色', 730, 450, 50, 50);
            }
        }
        //查看详细
        function lookup() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsChecked(key)) {
                var url = "/CommonModule/User/UserInfo.aspx?key=" + key;
                top.openDialog(url, 'UserInfo', '用户信息 - 查看详细', 750, 450, 50, 50);
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
                <table border="0" class="frm-find" style="height: 45px;">
                    <tr>
                        <th>查询条件：
                        </th>
                        <td>
                            <select id="query" class="select" runat="server" style="width: 70px">
                                <option value="Code">编号</option>
                                <option value="Account">账户</option>
                                <option value="RealName">姓名</option>
                                <option value="Mobile">手机号码</option>
                                <option value="DepartmentId">部门</option>
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
                                <label for="Enabled" style="vertical-align: middle;" >只显示有效的</label>
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
