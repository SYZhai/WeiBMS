<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizeTree.aspx.cs" Inherits="BPMS.WEB.CommonModule.Organize.OrganizeTree" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>组织结构树</title>
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
        function GetClickValue() {
            $(".strTree li .divTree").click(function () {
                var Category = $(this).attr('Category');
                var OrganizationId = $(this).attr('id');
                var FullName = $(this).find('span').html();
                window.parent.frames["target_right"].OrganizeTree_Callback(Category, OrganizationId, FullName);
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                组织机构
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
