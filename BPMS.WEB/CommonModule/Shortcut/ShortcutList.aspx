<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShortcutList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Shortcut.ShortcutList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>应用盒子，首页快捷</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script>
        $(function () {
            iframeresize(2);
            divresize('.div-body', 32);
            GetMenuTree();
        })
        //主功能项
        var MenuId, FullName = '';
        function GetMenuTree() {
            getAjax("ShortcutList.aspx", "action=GetMenuTree", function (data) {
                $("#MenuTree").html(data);
                MenuId = $('.collapsableselected').attr('id');
                FullName = $('.collapsableselected').find('span').html();
                Submenu();
            })
            treeAttrCss();
            $(".strTree li div").click(function () {
                if ($(this).attr('id') != "") {
                    MenuId = $(this).attr('id');
                    FullName = $(this).find('span').html();
                    $("#FullName").html(FullName);
                    Submenu();
                }
            });
            $("#FullName").html(FullName);
        }
        //子功能项
        function Submenu() {
            getAjax("ShortcutList.aspx", "action=Submenu&key=" + MenuId, function (data) {
                $("#SubmenuList").html(data);
            })
        }
        //添加菜单到首页快捷
        function AddMenu(key) {
            getAjax("ShortcutList.aspx", "action=AddMenu&key=" + key, function (data) {
                if (data.toLocaleLowerCase() == 'true') {
                    Submenu();
                    showTipsMsg("应用已添加到当前桌面。", 2000, 4);
                    top.$('#' + Current_iframeID())[0].contentWindow.windowload();
                } else {
                    showTipsMsg("操作失败，请稍后重试！", 4000, 5);
                }
            })
        }
    </script>
    <style type="text/css">
        .shortcuticons {
            float: left;
            border: solid 3px #fff;
            width: 72px;
            height: 55px;
            margin: 6px;
            padding: 6px;
            cursor: pointer;
            vertical-align: middle;
            text-align: center;
            word-break: keep-all;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            -moz-border-radius: 8px; /* Gecko browsers */
            -webkit-border-radius: 8px; /* Webkit browsers */
            border-radius: 8px; /* W3C syntax */
        }

            .shortcuticons:hover {
                border: solid 3px #6699cc;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <input id="hiddenRoleId" type="hidden" runat="server" />
        <div id="iframeMainContent">
            <div class="iframeleft" style="padding-bottom: 0px;">
                <div class="btnbartitle">
                    <div>
                        主功能项
                    </div>
                </div>
                <div class="line"></div>
                <div class="div-body">
                    <ul class="black strTree" id="MenuTree">
                    </ul>
                </div>
            </div>
            <div class="iframeContent">
                <div class="btnbartitle">
                    <div>
                        子功能项 - <span id="FullName"></span>
                    </div>
                </div>
                <div class="line"></div>
                <div class="div-body" id="SubmenuList">
                </div>
            </div>
        </div>
        <div class="line"></div>
    </form>
</body>
</html>
