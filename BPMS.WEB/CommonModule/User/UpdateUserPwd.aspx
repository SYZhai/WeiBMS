<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateUserPwd.aspx.cs" Inherits="BPMS.WEB.CommonModule.User.UpdateUserPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>重新设置新密码</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        function CheckValid() {
            var pwd = $("#txtUserPwd").val();
            var NewPwd = $("#User_NewPwd").val();
            var code = $("#txtCode").val();
            if (pwd == "") {
                $("#txtUserPwd").focus();
                top.showTopMsg("密码不能为空！", 4000, 'error');
                return false;
            }
            if (NewPwd == "") {
                $("#User_NewPwd").focus();
                top.showTopMsg("确认密码不能为空！", 4000, 'error');
                return false;
            }
            if (pwd != NewPwd) {
                $("#User_NewPwd").empty();
                $("#txtUserPwd").empty();
                top.showTopMsg("两次密码不一致，请重新输入！", 4000, 'error');
                return false;
            }
            if (code == "") {
                $("#txtCode").focus();
                top.showTopMsg("验证码不能为空！", 4000, 'error');
                return false;
            }
            return confirm('注：请牢记当前设置密码，您确认要重新设置新密码？');
        }
        //清空
        function resetInput() {
            $("#txtPastUserPwd").val("");
            $("#txtUserPwd").val("");
            $("#User_NewPwd").val("");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" class="niceform">
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>账&nbsp;&nbsp;户：
                </th>
                <td>
                    <input type="text" disabled id="txtUserName" runat="server" class="txt" style="width: 200px;" />
                </td>
            </tr>
            <tr>
                <th>新密码：
                </th>
                <td>
                    <input type="password" id="txtUserPwd" runat="server" class="txt" style="width: 200px;" />
                </td>
            </tr>
            <tr>
                <th>确认密码：
                </th>
                <td>
                    <input id="User_NewPwd" runat="server" type="password" class="txt" style="width: 200px" />
                </td>
            </tr>
            <tr>
                <th>验证码：
                </th>
                <td>
                    <input type="text" id="txtCode" runat="server" class="txt" style="width: 48px;" />
                    <img src="/Frame/VerifyCode.ashx" width="70" height="25" alt="点击切换验证码" title="点击切换验证码"
                        style="margin-top: 0px; vertical-align: top; cursor: pointer;" onclick="alert(1);ToggleCode(this, '/Frame/VerifyCode.ashx');" />
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return CheckValid();" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
