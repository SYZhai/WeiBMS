<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemsList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Dictionary.ItemsList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>辅助资料类别列表</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script>
        $(function () {
            divresize('.div-body', 76);
            treeAttrCss();
            GetClickValue();
        })
        //初始化
        var ItemsId, FullName = '';
        function GetClickValue() {
            ItemsId = $('.collapsableselected').attr('id');
            FullName = $('.collapsableselected').find('span').html();
            var path = 'ItemDetailsList.aspx?ItemsId=' + ItemsId + '&FullName=' + escape(FullName);
            window.parent.frames["target_right"].location = path;
            Loading(true);

            $(".strTree li div").click(function () {
                ItemsId = $(this).attr('id');
                if (IsNullOrEmpty(ItemsId)) {
                    FullName = $(this).find('span').html();
                    var path = 'ItemDetailsList.aspx?ItemsId=' + ItemsId + '&FullName=' + escape(FullName);
                    window.parent.frames["target_right"].location = path;
                    Loading(true);
                }
            });
        }
        //新增
        function add() {
            var url = "/CommonModule/Dictionary/ItemsForm.aspx";
            top.openDialog(url, 'ItemsForm', '辅助资料类别 - 添加', 400, 215, 50, 50);
        }
        //编辑
        function edit() {
            var key = ItemsId;
            if (IsEditdata(key)) {
                var url = "/CommonModule/Dictionary/ItemsForm.aspx?key=" + key;
                top.openDialog(url, 'ItemsForm', '辅助资料类别 - 编辑', 400, 215, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = ItemsId;
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('Dictionary.ashx', delparm);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                辅助资料类别
            </div>
        </div>
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div class="div-body">
            <ul class="black strTree">
                 <%=strHtml %>
            </ul>
        </div>
    </form>
</body>
</html>
