<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlpanelIndex.aspx.cs" Inherits="BPMS.WEB.CommonModule.Controlpanel.ControlpanelIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>控制面板</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("html").css("overflow", "hidden");
            $("body").css("overflow", "hidden");
            iframeresize();
            Loading(true);
            $("#target_right").attr("src", "../User/UserInfo.aspx?key=<%=UserId %>");
            divresize('.div-body', 30);
        })
        function ReplaceSrc(url) {
            $("#target_right").attr("src", url + "&key=<%=UserId %>");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="iframeMainContent">
            <div class="iframeleft">
                <div class="btnbartitle">
                    <div>
                        个人信息
                    </div>
                </div>
                <div class="line"></div>
                <div class="div-body">
                    <div class="sub-menu" style="padding: 10px;">
                        <div class="selected" onclick="ReplaceSrc('../User/UserInfo.aspx?')">
                            <img src="/Themes/Images/32/asterisk_orange.png">个人资料
                        </div>
                        <div onclick="ReplaceSrc('../User/UpdateUserPwd.aspx?Account=<%=Account %>&status=1')">
                            <img src="/Themes/Images/32/asterisk_orange.png">修改密码
                        </div>
                        <%--<div onclick="ReplaceSrc('../Log/LoginLogList.aspx?')">
                            <img src="/Themes/Images/32/asterisk_orange.png">登录日志
                        </div>
                        <div onclick="ReplaceSrc('../Log/LogList.aspx?')">
                            <img src="/Themes/Images/32/asterisk_orange.png">操作日志
                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="iframeContent">
                <iframe id="target_right" name="target_right" scrolling="auto" frameborder="0" scrolling="yes"
                    width="100%" height="100%"></iframe>
            </div>
        </div>
    </form>
</body>
</html>
