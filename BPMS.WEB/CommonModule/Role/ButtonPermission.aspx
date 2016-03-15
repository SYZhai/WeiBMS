<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ButtonPermission.aspx.cs" Inherits="BPMS.WEB.CommonModule.Role.ButtonPermission" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>角色按钮权限</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        var RoleId = GetQuery('RoleId');                        //角色主键
        $(function () {
            iframeresize(79);
            divresize('.div-body', 109);
            divresize('.ScrollBar', 154);
            treeAttrCss();
            GetClickValue();
        })
        function GetClickValue() {
            $(".strTree li div").click(function () {
                $('.ModuleButton').hide();
                $("#Module_" + $(this).attr('id')).show();
                $("#checkAllOn").attr('title', '全选');
                $("#checkAllOn").text('全选');
                $("#checkAllOn").attr('id', 'checkAllOff');
                CheckAllLinestatus = 0;
            });
        }
        /**********复选框 全选/反选**************/
        var CheckAllLinestatus = 0;
        function CheckAllLine() {
            if (CheckAllLinestatus == 0) {
                CheckAllLinestatus = 1;
                $("#checkAllOff").attr('title', '反选');
                $("#checkAllOff").text('反选');
                $("#checkAllOff").attr('id', 'checkAllOn');
                $("#Module_" + $('.collapsableselected').attr('id')).find('.panelcheck').each(function () {
                    $(this).attr('class', 'checkbuttonOk panelcheck');
                    $(this).find('.triangleNo').attr('class', 'triangleOk');
                });
            } else {
                CheckAllLinestatus = 0;
                $("#checkAllOn").attr('title', '全选');
                $("#checkAllOn").text('全选');
                $("#checkAllOn").attr('id', 'checkAllOff');
                $("#Module_" + $('.collapsableselected').attr('id')).find('.panelcheck').each(function () {
                    $(this).attr('class', 'checkbuttonNo panelcheck');
                    $(this).find('.triangleOk').attr('class', 'triangleNo');
                });
            }
        }
        //重置按钮权限
        function AcceptReset() {
            if (IsNullOrEmpty(GetQuery('RoleId'))) {
                showConfirmMsg("注：重置操作将会清空用户的所有按钮权限，是否继续？", function (r) {
                    if (r) {
                        var parm = 'action=AddButtonPermission&RoleId=' + GetQuery('RoleId');
                        getAjax('ButtonPermission.ashx', parm, function (rs) {
                            if (rs.toLocaleLowerCase() == 'true') {
                                Loading(true);
                                showTipsMsg("重置成功。", 2000, 4);
                                windowload();
                            } else if (rs.toLocaleLowerCase() == 'false') {
                                showTipsMsg("很抱歉，操作失败。", 4000, 5);
                            } else {
                                showTipsMsg(rs, 4000, 3);
                            }
                        });
                    }
                });
            }
        }
        //授权事件
        function Authorization() {
            if (IsNullOrEmpty(GetQuery('RoleId'))) {
                var item = "";
                $('#ButtonList div').find(".checkbuttonOk").each(function () {
                    item += $(this).find('.checktext').attr('id') + "≌";
                });
                var parm = 'action=AddButtonPermission&RoleId=' + GetQuery('RoleId') + '&ButtonId=' + item;
                getAjax('ButtonPermission.ashx', parm, function (rs) {
                    if (rs.toLocaleLowerCase() == 'true') {
                        Loading(true);
                        showTipsMsg("授权成功。", 2000, 4);
                        windowload();
                    } else if (rs.toLocaleLowerCase() == 'false') {
                        showTipsMsg("很抱歉，操作失败。", 4000, 5);
                    } else {
                        showTipsMsg(rs, 4000, 3);
                    }
                });
            }
        }
    </script>
    <style>
        .checktext {
            width: 70px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div class="WarmPrompt">
            温馨提示：设置后请点击【授权】按钮授权当前设置
        </div>
        <div id="iframeMainContent">
            <div class="iframeleft" style="padding-bottom: 0px; width: 300px;">
                <div class="btnbartitle">
                    <div>
                        系统对象
                    </div>
                </div>
                <div class="line"></div>
                <div class="div-body">
                    <ul class="black strTree">
                        <%=sbModule %>
                    </ul>
                </div>
            </div>
            <div class="iframeContent">
                <div class="btnbartitle">
                    <div style="float: left">
                        想拥有权限按钮（请点击勾选）
                    </div>
                    <div style="float: right">
                        <label id="checkAllOff" onclick="CheckAllLine()" title="全选">全选</label>
                    </div>
                </div>
                <div class="div-body" id="ButtonList">
                    <%=sbButton %>
                </div>
            </div>
        </div>
        <div class="line"></div>
    </form>
</body>
</html>
