<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="BPMS.CodeMatic.Frame.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>链接到数据库引擎</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        function Callback() {
            Loading(true);
            window.parent.location.reload();
            OpenClose();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" class="frm" >
            <tr>
                <th>服务器名称（S）：
                </th>
                <td>
                    <input id="ServerName" runat="server" type="text" class="txt"  value="." style="width: 250px" />
                </td>
            </tr>
            <tr>
                <th>身份验证（A）：
                </th>
                <td>
                    <select id="Authentication" class="select" runat="server" style="width: 256px">
                        <option value="2">SQL Server身份验证</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>登录名（L）：
                </th>
                <td>
                    <input id="LoginName" type="text" runat="server" class="txt" value="sa" style="width: 250px" />
                </td>
            </tr>
            <tr>
                <th>密码（P）：
                </th>
                <td>
                    <input id="Password" type="text" runat="server" class="txt" style="width: 250px" value="123qwe" />
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <label>
                        <input type="checkbox" />
                        记住密码</label>
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Landing_Click" runat="server" class="l-btn" OnClick="Landing_Click_Click"><span class="l-btn-left">
            <img src="/Themes/Images/icons/7.png" alt="" />链 接</span></asp:LinkButton>
        </div>
    </form>
</body>
</html>
