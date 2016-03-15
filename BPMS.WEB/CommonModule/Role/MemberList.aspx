<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Role.MemberList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>角色成员</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        var RoleId = GetQuery('RoleId');//角色主键
        var RoleName = GetQuery('RoleName');
        $(function () {
            InitRolesMember();
        });
        /**加载角色成员**/
        function InitRolesMember() {
            var Parm_Key_Value = $("#query").val() + "☻" + $("#keywords").val() + "≌";
            //url：请求地址
            var url = "MemberList.aspx?action=InitRolesMember&Parm_Key_Value=" + escape(Parm_Key_Value) + '&RoleId=' + GetQuery('RoleId');
            //colM：表头名称
            var colM = [
                { title: "用户主键", width: 100, align: "left", hidden: true },
                {
                    title: "", width: 20, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[0];
                        return "<input type=\"checkbox\" value='" + value + "' />";
                    }
                },
                { title: "编号", width: 100, align: "center" },
                { title: "登录账户", width: 100, align: "center" },
                { title: "姓名", width: 100, align: "center" },
                { title: "性别", width: 60, align: "center" },
                { title: "手机号码", width: 100, align: "center" },
                { title: "职位", width: 100, align: "center" },
                { title: "职称", width: 100, align: "center" },
                { title: "部门", width: 100, align: "center" },
                { title: "说明", width: 500 }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "UserId",
                "UserId",
                "Code",
                "Account",
                "RealName",
                "Gender",
                "Email",
                "DutyId",
                "TitleId",
                "DepartmentId",
                "Description"
            ];
            PQLoadGridNoPage("#grid_paging", url, colM, sort, 50, true);
            $("#grid_paging").pqGrid({
                freezeCols: 7,
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />角色成员列表"
            })
            pqGridResizefixed("#grid_paging", $(window).height() - 82, +15);
        }
        //添加成员
        function AddMember() {
            if (RoleId != "") {
                var url = "/CommonModule/Role/MemberForm.aspx?RoleName=" + RoleName + "&OrganizationId=" + GetQuery('OrganizationId') + '&OrganizationName=' + GetQuery('FullName') + '&RoleId=' + RoleId;
                top.openDialog(url, 'MemberForm', '添加用户到角色', 850, 600, 50, 50);
            }
        }
        //删除成员
        function DeleteMember() {
            if (RoleId != "") {
                var id = CheckboxValue();
                if (IsDelData(id)) {
                    var delparm = 'action=DeleteMember&RoleId=' + RoleId + '&UserId=' + id;
                    delConfig('MemberList.aspx', delparm, id.split(",").length);
                }
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
                            </select>
                        </td>
                        <th>关键字：
                        </th>
                        <td>
                            <input id="keywords" runat="server" type="text" class="txt" style="width: 200px" />
                        </td>
                        <td>
                            <input id="btnSearch" type="button" class="btnSearch" value="搜 索" onclick="InitRolesMember()" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>
