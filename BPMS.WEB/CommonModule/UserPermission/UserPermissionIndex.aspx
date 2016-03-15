<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPermissionIndex.aspx.cs" Inherits="BPMS.WEB.CommonModule.UserPermission.UserPermissionIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>用户权限管理</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("html").css("overflow", "hidden");
            $("body").css("overflow", "hidden");
            iframeresize();
            Loading(true);
            $("#target_left").attr("src", "../Organize/OrganizeTree.aspx");
            $("#target_right").attr("src", "UserPermissionList.aspx");
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="iframeMainContent">
            <div class="iframeleft">
                <iframe id="target_left" name="target_left" scrolling="auto" frameborder="0" scrolling="yes"
                    width="100%" height="100%"></iframe>
            </div>
            <div class="iframeContent">
                <iframe id="target_right" name="target_right" scrolling="auto" frameborder="0" scrolling="yes"
                    width="100%" height="100%"></iframe>
            </div>
        </div>
    </form>
</body>
</html>
