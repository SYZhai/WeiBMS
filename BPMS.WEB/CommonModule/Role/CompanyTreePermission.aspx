<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyTreePermission.aspx.cs" Inherits="BPMS.WEB.CommonModule.Role.CompanyTreePermission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>角色权限-公司</title>
<link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script>
        $(function () {
            divresize('.div-body', 30);
            treeAttrCss();
            GetClickValue();
        })
        //初始化
        var OrganizationId, FullName = '';
        function GetClickValue() {
            OrganizationId = $('.collapsableselected').attr('id');
            FullName = $('.collapsableselected').find('span').html();
            var path = 'RolePermission.aspx?OrganizationId=' + OrganizationId + '&FullName=' + escape(FullName);
            window.parent.frames["target_right"].location = path;
            Loading(true);

            $(".strTree li div").click(function () {
                ItemsId = $(this).attr('id');
                FullName = $(this).find('span').html();
                var path = 'RolePermission.aspx?OrganizationId=' + ItemsId + '&FullName=' + escape(FullName);
                window.parent.frames["target_right"].location = path;
                Loading(true);
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                公司
            </div>
        </div>
        <div class="line"></div>
        <div class="div-body">
            <ul class="black strTree">
                <%=strHtml %>
            </ul>
        </div>
    </form>
</body>
</html>
