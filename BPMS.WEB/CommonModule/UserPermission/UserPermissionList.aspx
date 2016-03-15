﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPermissionList.aspx.cs" Inherits="BPMS.WEB.CommonModule.UserPermission.UserPermissionList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>用户权限管理</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            iframeresize(1);
            divresize('.div-body', 30);
            divresize('.ScrollBar', 65);
            InitUser();
        });
        //加载用户列表
        var UserId = "";
        var UserName = "";
        function InitUser() {
            $("#UserTree").html("");
            var Category = $("#hiddenCategory").val()
            var OrganizationId = $("#hiddenOrganizationId").val()
            getAjax('UserPermissionList.aspx', "action=InitUser&Category=" + escape(Category) + "&OrganizationId=" + OrganizationId, function (data) {
                $("#UserTree").append(data);
            });
            UserId = $('.collapsableselected').attr('id');
            UserName = $('.collapsableselected').find('span').html();
            $("#UserName").html(UserName);
            Chainingiframe();
            $(".strTree li div").click(function () {
                UserId = $(this).attr('id');
                UserName = $(this).find('span').html();
                $("#UserName").html(UserName);
                Chainingiframe();
            });
            treeAttrCss();
        }
        //链接用户角色页面
        function Chainingiframe() {
            Loading(true);
            $(".tab_list_top").find('div').removeClass('actived');
            $("#tabUserModule").addClass('actived');
            $("#iframeModule").attr("src", "UserModulePermission.aspx?UserId=" + UserId);
            Tabchange('ModulePanel');
        }
        //链接按钮权限页面
        function ChainingiframeButton() {
            Loading(true);
            $("#iframeButton").attr("src", "UserButtonPermission.aspx?UserId=" + UserId);
        }

        //组织机构回调
        function OrganizeTree_Callback(Category, OrganizationId, OrganizationName) {
            $("#OrganizationName").html(OrganizationName);
            $("#hiddenCategory").val(Category)
            $("#hiddenOrganizationId").val(OrganizationId)
            InitUser();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hiddenCategory" />
        <input type="hidden" id="hiddenOrganizationId" />
        <div id="iframeMainContent">
            <div class="iframeleft">
                <div class="btnbartitle">
                    <div>
                        用户列表
                    </div>
                </div>
                <div class="line"></div>
                <div class="div-body">
                    <ul class="black strTree">
                        <li>
                            <div>
                                <img src='/Themes/images/16/chart_organisation.png' style='vertical-align: middle;' alt='' /><span id="OrganizationName">所有用户</span>
                            </div>
                            <ul id="UserTree"></ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="iframeContent">
                <div class="btnbartitle">
                    <div>
                        用户授权 - <span id="UserName"></span>
                    </div>
                </div>
                <div class="bd">
                    <div class="tipstitle_title settingtable bold bd todayInfoPanelTab rightPanelTitle_normal">
                        <div class="tab_list_top" style="position: absolute">
                            <div id="tabUserModule" class="tab_list bd " onclick="Tabchange('ModulePanel');Chainingiframe()">模块权限</div>
                            <div class="tab_list bd " onclick="Tabchange('ButtonPanel');ChainingiframeButton()">按钮权限</div>
                        </div>
                    </div>
                    <div class="ScrollBar" style="margin-left: 1px; margin-top: 1px;">
                        <div id="ModulePanel" class="tabPanel" style="height: 99.6%">
                            <iframe id="iframeModule" name="iframeModule" scrolling="auto" frameborder="0" scrolling="yes"
                                width="100%" height="100%"></iframe>
                        </div>
                        <div id="ButtonPanel" class="tabPanel" style="height: 99.6%">
                            <iframe id="iframeButton" name="iframeButton" scrolling="auto" frameborder="0" scrolling="yes"
                                width="100%" height="100%"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
