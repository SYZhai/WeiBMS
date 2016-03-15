<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainIndex.aspx.cs" Inherits="BPMS.WEB.Frame.MainIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
    <%--    手风琴导航风格--%>
    <title>微企业管理系统（Wei-BMS）</title>
    <link href="/Themes/Styles/accordion.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <link href="/Themes/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script src="MainIndex.js"></script>
    <script>
        /**初始化**/
        $(document).ready(function () {
            document.onselectstart = function () { return false; }
            $(document).bind("contextmenu", function () {
                return false;
            });
            Loading(true);
            iframeresize();
            AddTabMenu('Imain', 'HomeIndex.aspx', '首页主控台', '4963_home.png', 'false');
            GetAccordionMenu();
            resizeLayout();
            writeDateInfo();
            readyIndex();
        });
        function resizeLayout() {
            resizeU();
            $(window).resize(resizeU);
            function resizeU() {
                var accordion_head = $('.accordion > li > a'),
                 accordion_body = $('.accordion li > .sub-menu');
                $(".sub-menu").css('height', $(".navigation").height() - 19 - accordion_head.length * accordion_head.height() - accordion_head.length + 'px');
                accordion_head.first().addClass('active').next().slideDown('normal');
                accordion_head.on('click', function (event) {
                    event.preventDefault();
                    if ($(this).attr('class') != 'active') {
                        accordion_body.slideUp('normal');
                        $(this).next().stop(true, true).slideToggle('normal');
                        accordion_head.removeClass('active');
                        $(this).addClass('active');
                    }
                });
            }
        }
        //手风琴导航菜单
        var AccordionMenuJson = "";
        function GetAccordionMenu() {
            var index = 0;
            var html = "";
            getAjax("Frame.ashx", "action=LoadFirstMenu", function (data) {
                AccordionMenuJson = eval("(" + data + ")");
                $.each(AccordionMenuJson, function (i) {
                    if (AccordionMenuJson[i].ParentId == '9f8ce93a-fc2d-4914-a59c-a6b49494108f') {
                        if (index == 0) {
                            html += "<li><a style=\"border-top: 0px solid #ccc;\"><img src=\"/Themes/Images/32/" + AccordionMenuJson[i].Img + "\">" + AccordionMenuJson[i].FullName + "</a>";
                        } else {
                            html += "<li><a><img src=\"/Themes/Images/32/" + AccordionMenuJson[i].Img + "\">" + AccordionMenuJson[i].FullName + "</a>";
                        }
                        html += GetSubmenu(AccordionMenuJson[i].MenuId);
                        html += "</li>";
                        index++;
                    }
                });
            })
            $(".accordion").append(html);
        }
        //子菜单
        function GetSubmenu(MenuId) {
            var html = "";
            html += "<div class=\"sub-menu\">";
            $.each(AccordionMenuJson, function (i) {
                if (AccordionMenuJson[i].ParentId == MenuId) {
                    html += "<div onclick=\"AddTabMenu('" + AccordionMenuJson[i].MenuId + "', '" + AccordionMenuJson[i].NavigateUrl + "', '" + AccordionMenuJson[i].FullName + "', '" + AccordionMenuJson[i].Img + "', 'true');\" ><img src=\"/Themes/Images/32/" + AccordionMenuJson[i].Img + "\">" + AccordionMenuJson[i].FullName + "</div>";
                }
            });
            html += "</div>";
            return html;
        }
        //控制面板
        function Controlpanel() {
            AddTabMenu('Controlpanel', '/CommonModule/Controlpanel/ControlpanelIndex.aspx', '控制面板', '5026_settings.png', 'true');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Container">
            <div id="Header">
                <div id="HeaderLogo">
                    <img src="../Themes/Images/product.png" style="" />
                </div>
                <div id="Headermenu">
                    <ul id="topnav">
                        <li id="metnav_1" class="list">
                            <a href="javascript:;" id="nav_1" class="onnav" onclick="Replace();">
                                <span class="c1"></span>
                                首页信息
                            </a>
                        </li>
                        <li id="metnav_3" class="list" onclick="Controlpanel();">
                            <a href="javascript:;" id="nav_3">
                                <span class="c3"></span>
                                控制面板
                            </a>
                        </li>
                        <li id="metnav_5" class="list" onclick="IndexOut();">
                            <a href="javascript:;" id="nav_4">
                                <span class="c4"></span>
                                安全退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="Headerbotton">
                <div id="left_title">
                    <img src="/Themes/Images/32/clock_32.png" alt="" width="20" height="20" style="vertical-align: middle; padding-bottom: 3px;" />
                    <span id="datetime">1900年01月01日 00:00:00</span>
                </div>
                <div id="dww-menu" class="mod-tab">
                    <div class="mod-hd" style="float: left">
                        <ul class="tab-nav" id="tabs_container">
                        </ul>
                    </div>
                    <div id="toolbar" style="float: right; width: 75px; padding-right: 5px; text-align: right;">
                        <img src="/Themes/Images/16/arrow_refresh.png" title="刷新当前窗口" alt="" onclick="Loading(true);top.$('#' + Current_iframeID())[0].contentWindow.window.location.reload();return false;"
                            width="16" height="16" style="padding-bottom: 3px; cursor: pointer; vertical-align: middle;" />
                        &nbsp;
                        <img id="full_screen" src="/Themes/Images/16/arrow_out.gif" title="最大化" alt="" onclick="Maximize();"
                            width="16" height="16" style="padding-bottom: 3px; cursor: pointer; vertical-align: middle;" />
                        &nbsp;
                    </div>
                </div>
            </div>
            <div id="MainContent">
                <div class="navigation">
                    <ul class="accordion">
                    </ul>
                </div>
                <div id="ContentPannel">
                </div>
            </div>
            <div id="botton_toolbar">
                <div style="width: 42%; text-align: left; float: left;">
                    &nbsp;<a title="点击链接公司官网" href="javascript:void()">技术支持：哈沃德技术</a>
                    <span class="south-separator"></span>
                    &nbsp;专业版 V1.1
               
                    <span class="south-separator"></span>
                    &nbsp;<a title="将问题提交给开发商进行解决" target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=uICJioyLiYuPivjJyZbb19U">问题反馈</a>
                    <span class="south-separator"></span>
                </div>
                <div style="width: 16%; text-align: left; float: left;">
                    <a title="微企业管理系统（Wei-BMS）" href="javascript:void()">CopyRight © 2010-2015 By HaWoDe</a>
                </div>
                <div style="width: 42%; text-align: right; float: left;">
                    <span class="south-separator"></span>
                    操作员：<%=UserInfo %>
                    <span class="south-separator"></span>
                    所在部门：<%=DepartmentName %>
                    <span class="south-separator"></span>
                    在线人数：<%=_USERCOUNT %>&nbsp;
                </div>
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
