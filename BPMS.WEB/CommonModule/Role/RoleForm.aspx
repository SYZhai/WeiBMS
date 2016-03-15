<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.Role.RoleForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统角色表单</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>角色编号：
                </th>
                <td>
                    <input id="Code" maxlength="50" runat="server" type="text" datacol="yes" err="角色编号" checkexpession="NotNull" class="txt" style="width: 290px" />
                </td>
            </tr>
            <tr>
                <th>角色名称：
                </th>
                <td>
                    <input id="FullName" maxlength="50" runat="server" type="text" datacol="yes" err="角色名称" checkexpession="NotNull" class="txt" style="width: 290px" />
                </td>
            </tr>
            <tr>
                <th>角色分类：
                </th>
                <td>
                    <select id="Category" runat="server" class="select" style="width: 297px" datacol="yes" err="角色分类" checkexpession="NotNull">
                    </select>
                </td>
            </tr>
            <tr>
                <th>选项：
                </th>
                <td>
                    <span class="item">
                        <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="Enabled" style="vertical-align: middle;">有效</label>
                        &nbsp;&nbsp;
                    </span>
                    <span class="item">
                        <input id="AllowEdit" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="AllowEdit" style="vertical-align: middle;">允许编辑</label>
                        &nbsp;&nbsp;
                    </span>
                    <span class="item">
                        <input id="AllowDelete" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="AllowDelete" style="vertical-align: middle;">允许删除</label>
                        &nbsp;&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
                <th>描述：
                </th>
                <td>
                    <textarea id="Description" maxlength="200" runat="server" class="txtArea" rows="5" style="width: 296px" type="text"></textarea>
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return CheckDataValid('#form1');" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
