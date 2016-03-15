<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RolePermission.aspx.cs" Inherits="BPMS.WEB.CommonModule.Role.RolePermission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>角色权限</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        var OrganizationId = GetQuery('OrganizationId');//公司主键
        var OrganizationName = unescape(GetQuery('FullName'));  //公司名称
        $(function () {
            iframeresize(1);
            divresize('.div-body', 30);
            divresize('.ScrollBar', 65);
            InitRoles();
            $("#OrganizationName").text(OrganizationName);
            treeAttrCss();
        });
        //加载角色列表
        var RoleId = "";
        var RoleName = "";
        function InitRoles() {
            getAjax('RolePermission.aspx', "action=InitRoles&OrganizationId=" + OrganizationId, function (data) {
                var json = eval("(" + data + ")");
                var index = 0;
                var strclass = "";
                for (var i = 0; i < json.JSON.length; i++) {
                    var list = json.JSON[i];
                    if (index == 0) {
                        strclass = "collapsableselected";
                        RoleId = list.RoleId;
                        RoleName = list.FullName + "(" + list.Code + ")";
                        Chainingiframe();
                    }
                    else
                        strclass = "";
                    $("#RoleTree").append("<li><div class='" + strclass + "' id='" + list.RoleId + "'><img src='/Themes/images/16/group.png' style='vertical-align: middle;' alt=''/><span>" + list.FullName + "(" + list.Code + ")" + "</span></div></li>");
                    index++;
                }
                if (json.JSON.length == 0) {
                    $("#RoleTree").append("<li><div><span style='color:red;'>暂无角色</span></div>");
                }
            });
            $("#RoleName").html(RoleName);
            $(".strTree li div").click(function () {
                RoleId = $(this).attr('id');
                RoleName = $(this).find('span').html();
                $("#RoleName").html(RoleName);
                Chainingiframe();
            });
        }
        //链接成员页面
        function Chainingiframe() {
            $(".tab_list_top").find('div').removeClass('actived');
            $("#tabRoleMember").addClass('actived');
            $("#iframeRoleMember").attr("src", "MemberList.aspx?RoleId=" + RoleId + '&RoleName=' + escape(RoleName) + '&OrganizationId=' + OrganizationId + '&FullName=' + escape(OrganizationName));
            Tabchange('RoleMemberPanel');
        }
        //链接模块权限页面
        function ChainingiframeModule() {
            $("#iframeModule").attr("src", "ModulePermission.aspx?RoleId=" + RoleId);
        }
        //链接按钮权限页面
        function ChainingiframeButton() {
            $("#iframeButton").attr("src", "ButtonPermission.aspx?RoleId=" + RoleId);
        }
        //链接数据权限页面
        function ChainingiframeData() {
            $("#iframeData").attr("src", "../DataPermission/DataPermissionList.aspx?RoleId=" + RoleId);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="iframeMainContent">
            <div class="iframeleft">
                <div class="btnbartitle">
                    <div>
                        角色
                    </div>
                </div>
                <div class="line"></div>
                <div class="div-body">
                    <ul class="black strTree">
                        <li>
                            <div>
                                <img src='/Themes/images/16/chart_organisation.png' style='vertical-align: middle;' alt='' /><span id="OrganizationName"></span>
                            </div>
                            <ul id="RoleTree"></ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="iframeContent">
                <div class="btnbartitle">
                    <div>
                        角色授权 - <span id="RoleName" ></span>
                    </div>
                </div>
                <div class="bd">
                    <div class="tipstitle_title settingtable bold bd todayInfoPanelTab rightPanelTitle_normal">
                        <div class="tab_list_top" style="position: absolute">
                            <div id="tabRoleMember" class="tab_list bd" onclick="Tabchange('RoleMemberPanel')">角色成员</div>
                            <div class="tab_list bd " onclick="Tabchange('ModulePanel');ChainingiframeModule()">模块权限</div>
                            <div class="tab_list bd " onclick="Tabchange('ButtonPanel');ChainingiframeButton()">按钮权限</div>
                            <div class="tab_list bd " onclick="Tabchange('DataPanel');ChainingiframeData()">数据权限</div>
                            <div class="tab_list bd " onclick="Tabchange('FilePanel')">文件权限</div>
                        </div>
                    </div>
                    <div class="ScrollBar" style="margin-left: 1px; margin-top: 1px;">
                        <div id="RoleMemberPanel" class="tabPanel" style="height: 99.6%">
                            <iframe id="iframeRoleMember" name="iframeRoleMember" scrolling="auto" frameborder="0" scrolling="yes"
                                width="100%" height="100%"></iframe>
                        </div>
                        <div id="ModulePanel" class="tabPanel" style="height: 99.6%">
                            <iframe id="iframeModule" name="iframeModule" scrolling="auto" frameborder="0" scrolling="yes"
                                width="100%" height="100%"></iframe>
                        </div>
                        <div id="ButtonPanel" class="tabPanel" style="height: 99.6%">
                            <iframe id="iframeButton" name="iframeButton" scrolling="auto" frameborder="0" scrolling="yes"
                                width="100%" height="100%"></iframe>
                        </div>
                        <div id="DataPanel" class="tabPanel" style="height: 99.6%">
                            <iframe id="iframeData" name="iframeData" scrolling="auto" frameborder="0" scrolling="yes"
                                width="100%" height="100%"></iframe>
                        </div>
                        <div id="FilePanel" class="tabPanel">
                            文件权限，正在开发
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
