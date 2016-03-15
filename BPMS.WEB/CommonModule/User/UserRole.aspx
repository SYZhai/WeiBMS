<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRole.aspx.cs" Inherits="BPMS.WEB.CommonModule.User.UserRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>用户分配角色</title>
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
            iframeresize(95);
            divresize('.div-body', 125);
            treeAttrCss();
            GetClickValue();
        })
        function GetClickValue() {
            $("#Role_" + $('.collapsableselected').attr('id')).show();
            $(".strTree li div").click(function () {
                $('.UserRole').hide();
                $("#Role_" + $(this).attr('id')).show();
                $("#checkAllOn").attr('title', '全选');
                $("#checkAllOn").text('全选');
                $("#checkAllOn").attr('id', 'checkAllOff');
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
                $("#Role_" + $('.collapsableselected').attr('id')).find('.panelcheck').each(function () {
                    $(this).attr('class', 'checkbuttonOk panelcheck');
                    $(this).find('.triangleNo').attr('class', 'triangleOk');
                });
            } else {
                CheckAllLinestatus = 0;
                $("#checkAllOn").attr('title', '全选');
                $("#checkAllOn").text('全选');
                $("#checkAllOn").attr('id', 'checkAllOff');
                $("#Role_" + $('.collapsableselected').attr('id')).find('.panelcheck').each(function () {
                    $(this).attr('class', 'checkbuttonNo panelcheck');
                    $(this).find('.triangleOk').attr('class', 'triangleNo');
                });
            }
        }
        //保存事件
        function CommitSave() {
            var item = "";
            $('#RoleList div').find(".checkbuttonOk").each(function () {
                item += $(this).find('.checktext').attr('id') + "≌";
            });
            $("#hiddenRoleId").val(item);
        }
    </script>
    <style>
        .checktext {
            width: 105px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <input id="hiddenRoleId" type="hidden" runat="server" />
        <div class="WarmPrompt-Info">
            <img src="/Themes/Images/32/group_edit.png" style="width: 32px; height: 32px; vertical-align: middle; margin-bottom: 1px;" />
            <%=strUserInfo %>
        </div>
        <div id="iframeMainContent">
            <div class="iframeleft" style="padding-bottom: 0px;">
                <div class="btnbartitle">
                    <div>
                        公司
                    </div>
                </div>
                <div class="line"></div>
                <div class="div-body">
                    <ul class="black strTree">
                        <%=sbCompany %>
                    </ul>
                </div>
            </div>
            <div class="iframeContent">
                <div class="btnbartitle">
                    <div style="float: left">
                        想拥有角色（请点击打钩）
                    </div>
                    <div style="float: right">
                        <label id="checkAllOff" onclick="CheckAllLine()" title="全选">全选</label>
                    </div>
                </div>
                <div class="line"></div>
                <div class="div-body" id="RoleList">
                    <%=sbRole %>
                </div>
            </div>
        </div>
        <div class="line"></div>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return CommitSave();" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
