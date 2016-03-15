<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleButton.aspx.cs" Inherits="BPMS.WEB.CommonModule.Module.ModuleButton" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>模块按钮</title>
    <link href="../../Themes/Styles/style.css" rel="stylesheet" />
    <script src="../../Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="../../Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="../../Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="../../Themes/Scripts/DragSort.js"></script>
    <script src="../../Themes/Scripts/FunctionJS.js"></script>
    <script>
        $(function () {
            divresize('.ScrollBar', 140);
            $("#div_Application").hide();
            $('.ScrollBar').Sortable({
                accept: 'panelcheck',
                helperclass: 'sortHelper',
                opacity: 0.8,
                floats: true,
                revert: true
            });
        })
        //保存事件
        function CommitSave() {
            var item = "";
            $('.ScrollBar div').find(".checkbuttonOk").each(function () {
                item += $(this).find('.checktext').attr('id') + "≌";
            });
            $("#hiddenButtonId").val(item);
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
        <input id="hiddenButtonId" type="hidden" runat="server" />
        <div class="WarmPrompt-Info">
            <img src="<%=_MenuImg %>" style="width: 32px; height: 32px; vertical-align: middle; margin-bottom: 4px;" />
            <%=_MenuName %> ；想拥有操作按钮（请点击勾选）

        </div>
        <div class="bd">
            <div class="tipstitle_title settingtable bold bd todayInfoPanelTab rightPanelTitle_normal">
                <div class="tab_list_top" style="position: absolute">
                    <div class="tab_list bd actived" onclick="$('#div_toolbar').show();$('#div_Application').hide();">工具栏</div>
                    <div class="tab_list bd " onclick="$('#div_Application').show();$('#div_toolbar').hide();">右击菜单栏</div>
                </div>
            </div>
            <div class="ScrollBar" style="padding: 5px;">
                <div id="div_toolbar">
                    <%=htmlButtontoolbar %>
                </div>
                <div id="div_Application">
                    <%=htmlButtonApplication %>
                </div>
                <div>&nbsp;&nbsp;&nbsp;</div>
            </div>
        </div>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="CommitSave();" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
