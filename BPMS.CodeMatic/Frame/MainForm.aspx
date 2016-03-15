<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="TryClothes.Web.Frame.MainForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎使用系统</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <link href="/Themes/Styles/Menu.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="../Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="../Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="../Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <link href="/Themes/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="MainFrame.js"></script>
    <script type="text/javascript">
        Loading(true);
        /**初始化**/
        $(document).ready(function () {
            Loading(true);
            iframeresize();
            writeDateInfo();
            readyIndex();
            treeAttrCss();
            AddTabMenu('iframe_Main', 'Home.aspx', '代码生成器', '4963_home.png', 'false');
        });
        function treeAttrCss() {
            $(".black, #gray").treeview({
                control: "#treecontrol",
                persist: "cookie",
                cookieId: "treeview-gray"
            });
            treeCss();
            $(".strTree li div").mousedown(function () {
                $(".strTree li div").removeClass("collapsableselected");
                $(this).addClass("collapsableselected"); //添加选中样式
                tableCode = $(this).find('span').html();
                database = $(this).find('span').attr('database');
                tableRemark = $(this).find('span').attr('tableRemark');
            })
        }
        function LoginForm() {
            var url = "/Frame/LoginForm.aspx";
            top.openDialog(url, 'LoginForm', '链接到数据库引擎', 410, 200, 50, 50);
        }
        var tableCode = "";
        var database = "";
        var tableRemark = "";
        //右击菜单
        $('.ulcontextmenu').contextmenu({
            items: [{
                text: '后台代码生成',
                icon: '/Themes/Images/icons/page_white_csharp.png',
                action: function (target) {
                    var url = "../Build/CodeBuild.aspx?tableCode=" + escape(tableCode) + "&database=" + escape(database) + "&tableRemark=" + tableRemark;
                    menuAction('后台代码生成', url);
                }
            }, {
                text: 'Web表单页面生成',
                icon: '/Themes/Images/icons/20131015062126188.png',
                action: function (target) {
                    var url = "../Build/BuildPageForm.aspx?tableCode=" + escape(tableCode) + "&database=" + escape(database) + "&tableRemark=" + tableRemark;
                    menuAction('Web表单页面生成', url);
                }
            }, {
                text: 'Web列表页面生成',
                icon: '/Themes/Images/icons/application.png',
                action: function (target) {
                    var url = "../Build/BuildPageList.aspx?tableCode=" + escape(tableCode) + "&database=" + escape(database) + "&tableRemark=" + tableRemark;
                    menuAction('Web列表页面生成', url);
                }
            }, {
                text: '重命名',
                action: function (target) {
                    showTipsMsg("很抱歉，该功能正在开发中", 4000, 3);
                }
            }, {
                text: '删除',
                action: function (target) {
                    showTipsMsg("很抱歉，该功能正在开发中", 4000, 3);
                }
            }]
        });
        function menuAction(name, url) {
            var tabid = "CodeBuild";
            if (top.document.getElementById("div_" + tabid) != null) {
                RemoveDiv(tabid);
                RemoveDiv("CodeBuild_Browse");
                RemoveDiv("HtmlPage_Browse");
            }
            AddTabMenu('CodeBuild', url, name, '4968_config.png', 'true');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="Current_iframe" type="hidden" />
        <div id="Container">
            <div id="Header">
                <div id="HeaderLogo">
                    <img src="../Themes/Images/product.png" style="" />
                </div>
                <div id="Headermenu">
                    <ul id="topnav">
                        <li id="metnav_1" class="list">
                            <a href="javascript:;" id="nav_1" class="onnav" onclick="show();" hidefocus="true">
                                <span class="c1"></span>
                                首页信息
                            </a>
                        </li>
                        <li id="metnav_3" class="list">
                            <a href="javascript:;" id="nav_3" hidefocus="true">
                                <span class="c3"></span>
                                使用帮助
                            </a>
                        </li>
                        <li id="metnav_5" class="list" onclick="IndexOut();">
                            <a href="javascript:;" id="nav_4" hidefocus="true">
                                <span class="c4"></span>
                                安全退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="Headerbotton">
                <div id="left_title">
                    <img src="/Themes/Images/clock_32.png" alt="" width="20" height="20" style="vertical-align: middle; padding-bottom: 3px;" />
                    <span id="datetime">1900年01月01日 00:00:00</span>
                </div>
                <div id="dww-menu" class="mod-tab">
                    <div class="mod-hd" style="float: left">
                        <input type="hidden" id="hidden_tabIndex" value="0" />
                        <ul class="tab-nav" id="div_tab">
                        </ul>
                    </div>
                    <div id="toolbar" style="float: right; width: 75px; padding-right: 5px; text-align: right;">
                        <img src="/Themes/Images/icons/arrow_refresh.png" title="刷新当前窗口" alt="" onclick="Loading(true);top.$('#' + Current_iframeID())[0].contentWindow.window.location.reload();return false;"
                            width="16" height="16" style="padding-bottom: 3px; cursor: pointer; vertical-align: middle;" />
                        &nbsp;
                        <img id="full_screen" src="/Themes/Images/icons/arrow_out.gif" title="最大化" alt="" onclick="Maximize();"
                            width="16" height="16" style="padding-bottom: 3px; cursor: pointer; vertical-align: middle;" />
                        &nbsp;
                    </div>
                </div>
            </div>
            <div id="MainContent">
                <div class="navigation">
                    <div class="box-title">
                        对象资源管理器
                    </div>
                    <div id="Sidebar">
                        <%=strHtml %>
                    </div>
                </div>
                <div id="ContentPannel">
                </div>
            </div>

            <div id="botton_toolbar">
                微企业管理系统（Wei-BMS）
            </div>
        </div>
        <!--载进度条start-->
        <div id="loading" onclick="Loading(false);">
            <img src="../Themes/Images/loading.gif" style="padding-bottom: 4px; vertical-align: middle;" />&nbsp;正在处理，请稍待&nbsp;
        </div>
        <div id="Toploading">
        </div>
        <!--载进度条end-->
    </form>
</body>
</html>
