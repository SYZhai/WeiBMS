<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleIcon.aspx.cs" Inherits="BPMS.WEB.CommonModule.Module.ModuleIcon" %>

<%@ Register Src="~/UserControl/PageControl.ascx" TagPrefix="uc1" TagName="PageControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>模块(菜单)图标</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            divresize('.div-body', 32);
            $(".divicons").click(function () {
                if (GetQuery('Size') == '32') {
                    top.ModuleForm.Set_Menu_Img($(this).attr('title'));
                } else {
                    top.ButtonForm.Set_Menu_Img($(this).attr('title'));
                }
            }).dblclick(function () {
                OpenClose();
            });
        })

    </script>
    <style type="text/css">
        .divicons {
            float: left;
            border: solid 1px #fff;
            margin: 5px;
            padding-top: 3px;
            padding-left: 5px;
            padding-right: 5px;
            text-align: center;
            cursor: pointer;
            -moz-border-radius: 5px; /* Gecko browsers */
            -webkit-border-radius: 5px; /* Webkit browsers */
            border-radius: 5px; /* W3C syntax */
        }
        .divicons:hover {
            color: #FFF;
            border: solid 1px #ccc;
            background: #F7F7F7;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <input id="hidden_Size" type="hidden" runat="server" />
        <div class="div-body">
            <%=strImg.ToString() %>
        </div>
        <uc1:PageControl runat="server" ID="PageControl" />
    </form>
</body>
</html>
