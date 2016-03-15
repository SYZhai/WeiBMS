<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.User.UserForm" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>用户、帐户表单</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            LoadBindDrop();
            if (IsNullOrEmpty(GetQuery('key'))) {
                $("#Password").val("******");
            }
        })
        //绑定下拉框，公司，部门，工作组，角色bigen
        var datajson = "";
        function LoadBindDrop() {
            $("#RoleId").append("<option value=''>" + "==请选择==" + "</option>");
            $("#CompanyId").append("<option value=''>" + "==请选择==" + "</option>");
            $("#DepartmentId").append("<option value=''>" + "==请选择==" + "</option>");
            $("#WorkgroupId").append("<option value=''>" + "==请选择==" + "</option>");
            getAjax("../Organize/OrganizeList.aspx", "action=LoadBindDrop", function (data) {
                datajson = eval("(" + data + ")");
                $.each(datajson, function (i) {
                    if (datajson[i].Category == '公司') {
                        $("#CompanyId").append($("<option></option>").val(datajson[i].OrganizationId).html(datajson[i].FullName));
                    }
                });
            })
            if (IsNullOrEmpty(GetQuery('key'))) {
                $("#Password").val("******");
                var hiddenCompanyId = $("#hiddenCompanyId").val();
                $("#CompanyId").val(hiddenCompanyId);
                CompanyClick("CompanyId");
            }
        }
        function CompanyClick(id) {
            $("#DepartmentId").empty();
            $("#DepartmentId").append("<option value=''>" + "==请选择==" + "</option>");
            InitRoles($('#' + id).val());
            $.each(datajson, function (i) {
                if (datajson[i].ParentId == $('#' + id).val()) {
                    $("#DepartmentId").append("<option value='" + datajson[i].OrganizationId + "'>" + datajson[i].FullName + "</option>");
                }
            });
            if (IsNullOrEmpty(GetQuery('key'))) {
                var hiddenDepartmentId = $("#hiddenDepartmentId").val();
                $("#DepartmentId").val(hiddenDepartmentId);
                DepartmentClick("DepartmentId");
            }
        }
        function DepartmentClick(id) {
            $("#WorkgroupId").empty();
            $("#WorkgroupId").append("<option value=''>" + "==请选择==" + "</option>");
            $.each(datajson, function (i) {
                if (datajson[i].ParentId == $('#' + id).val()) {
                    $("#WorkgroupId").append("<option value='" + datajson[i].OrganizationId + "'>" + datajson[i].FullName + "</option>");
                }
            });
            if (IsNullOrEmpty(GetQuery('key'))) {
                var hiddenWorkgroupId = $("#hiddenWorkgroupId").val();
                $("#WorkgroupId").val(hiddenWorkgroupId);
            }
        }
        //加载默认角色
        function InitRoles(OrganizationId) {
            $("#RoleId").empty();
            $("#RoleId").append("<option value=''>" + "==请选择==" + "</option>");
            getAjax('../Role/RoleList.aspx', "action=InitRoles&OrganizationId=" + OrganizationId, function (data) {
                var json = eval("(" + data + ")");
                for (var i = 0; i < json.JSON.length; i++) {
                    var list = json.JSON[i];
                    $("#RoleId").append($("<option></option>").val(list.RoleId).html(list.FullName));
                }
            });
            if (IsNullOrEmpty(GetQuery('key'))) {
                var hiddenRoleId = $("#hiddenRoleId").val();
                $("#RoleId").val(hiddenRoleId);
            }
        }
        //绑定下拉框，公司，部门，工作组 角色end

        //保存事件
        function CommitSave() {
            if (!CheckDataValid('#form1')) {
                return false;
            }
            $("#hiddenCompanyId").val($("#CompanyId").val());
            $("#hiddenDepartmentId").val($("#DepartmentId").val());
            $("#hiddenWorkgroupId").val($("#WorkgroupId").val());
            $("#hiddenRoleId").val($("#RoleId").val());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" class="niceform">
        <input id="hiddenCompanyId" type="hidden" runat="server" />
        <input id="hiddenDepartmentId" type="hidden" runat="server" />
        <input id="hiddenWorkgroupId" type="hidden" runat="server" />
        <input id="hiddenRoleId" type="hidden" runat="server" />
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>

                <th>编号：
                </th>
                <td>
                    <input id="Code" maxlength="50" runat="server" type="text" class="txt" datacol="yes" err="编号" value="编号不能为空" checkexpession="NotNull" style="width: 220px" />
                </td>
                <th>登录账户：
                </th>
                <td>
                    <input id="Account" maxlength="50" runat="server" type="text" class="txt" datacol="yes" err="登录账户" checkexpession="NotNull" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>姓名：
                </th>
                <td>
                    <input id="RealName" maxlength="50" runat="server" type="text" class="txt" datacol="yes" err="姓名" checkexpession="NotNull" style="width: 220px" />
                </td>
                <th>登录密码：
                </th>
                <td>
                    <input id="Password" maxlength="50" runat="server" type="password" class="txt" datacol="yes" err="登录密码" checkexpession="NotNull" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>性别：
                </th>
                <td>
                    <select id="Gender" class="select" runat="server" style="width: 227px">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
                <th>手机：</th>
                <td>
                    <input id="Mobile" maxlength="11" runat="server" type="text" class="txt" datacol="yes" err="手机" checkexpession="MobileOrNull" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>出生日期：
                </th>
                <td>
                    <input id="Birthday" maxlength="23" onfocus="WdatePicker()" runat="server" type="text" class="txt" style="width: 220px" />
                </td>
                <th>电话：
                </th>
                <td>
                    <input id="Telephone" maxlength="50" runat="server" type="text" class="txt" datacol="yes" err="电话" checkexpession="PhoneOrNull" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>职位：
                </th>
                <td>
                    <select id="DutyId" runat="server" class="select" style="width: 227px">
                    </select>
                </td>
                <th>QQ号码：
                </th>
                <td>
                    <input id="OICQ" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>职称：
                </th>
                <td>
                    <select id="TitleId" runat="server" class="select" style="width: 227px">
                    </select>
                </td>

                <th>电子邮件：
                </th>
                <td>
                    <input id="Email" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                </td>
            </tr>
            <tr>

                <th>公司：
                </th>
                <td>
                    <select id="CompanyId" onchange="CompanyClick(this.id)" runat="server" datacol="yes" err="公司" checkexpession="NotNull" class="select" style="width: 227px">
                    </select>
                </td>
                <th>默认角色：
                </th>
                <td>
                    <select id="RoleId" runat="server" class="select" datacol="yes" err="默认角色" checkexpession="NotNull" style="width: 227px">
                    </select>
                </td>
            </tr>
            <tr>
                <th>部门名称：
                </th>
                <td>
                    <select id="DepartmentId" onchange="DepartmentClick(this.id)" runat="server" datacol="yes" err="部门名称" checkexpession="NotNull" class="select" style="width: 227px">
                    </select>
                </td>
                <th>工作组名称：
                </th>
                <td>
                    <select id="WorkgroupId" runat="server" class="select" style="width: 227px">
                    </select>
                </td>
            </tr>
            <tr>
                <th>有效性：
                </th>
                <td colspan="3">
                    <span class="item">
                        <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="Enabled" style="vertical-align: middle;">有效</label>
                        &nbsp;&nbsp;
                    </span>
                    <label style="vertical-align: middle; color: red;">注意：禁用该用户后，将不能登录。</label>
                </td>
            </tr>
            <tr>
                <th>说明：
                </th>
                <td colspan="3">
                    <textarea id="Description" maxlength="200" runat="server" class="txtArea" type="text" rows="7" style="width: 595px"></textarea>
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return CommitSave();" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
