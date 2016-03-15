<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.Module.ModuleForm" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>模块(菜单)表单</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        $(function () {
            LoadCategory();
            treeAttrCss()
        })
        //选取系统图标
        function SelectOpenImg() {
            var url = "/CommonModule/Module/ModuleIcon.aspx?Size=32";
            top.openDialog(url, 'ModuleIcon', '选取系统图标', 615, 530, 100, 50);
        }
        //选取系统图标，回调
        function Set_Menu_Img(img) {
            $("#Img_Menu_Img").attr("src", '/Themes/Images/32/' + img);
            $("#Img").val(img);
        }
        //加载菜单分类
        function LoadCategory() {
            $("#ParentName").focus(function () {
                var html = "";
                getAjax('ModuleForm.aspx', 'action=LoadTree', function (rs) {
                    html = rs;
                });
                combotree("ParentName", $("#ParentName").width() + "px", "200px", html);
                $(".strTree li div").click(function () {
                    $("#ParentId").val($(this).attr('id'));
                    $("#ParentName").val($(this).html());
                    $("#div_treeshow").hide();
                })
            })
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>模块名称：
                </th>
                <td>
                    <input id="FullName" runat="server" type="text" class="txt" datacol="yes" err="模块名称"
                        checkexpession="NotNull" style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>模块编号：
                </th>
                <td>
                    <input id="Code" runat="server" type="text" class="txt"  datacol="yes" err="模块编号"
                        checkexpession="NotNull" style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>上级模块：
                </th>
                <td>
                    <input id="ParentId" type="hidden" runat="server" />
                    <input id="ParentName" runat="server" type="text" class="txt"  datacol="yes" err="上级菜单"
                        checkexpession="NotNull" style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>菜单图标：
                </th>
                <td>
                    <input id="Img" type="hidden" runat="server" />
                    <img id="Img_Menu_Img" src="/Themes/Images/illustration.png" runat="server" alt=""
                        style="vertical-align: middle; padding-right: 10px; width: 25px; height: 25px;" />
                    <input class="btn" value="图标选取" type="button" onclick="SelectOpenImg();" />
                </td>
            </tr>
            <tr>
                <th>连接目标：
                </th>
                <td>
                    <select id="Target" class="select" runat="server" style="width: 91.5%">
                        <option value="Click">Click</option>
                        <option value="Iframe">Iframe</option>
                        <option value="Open">Open</option>
                        <option value="href">href</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Web连接地址：
                </th>
                <td>
                    <input id="NavigateUrl" runat="server" type="text" class="txt"  style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>WinForm窗体：
                </th>
                <td>
                    <input id="FormName" runat="server" type="text" class="txt" style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>选项：
                </th>
                <td>
                    <span class="item">
                        <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="Enabled" style="vertical-align: middle;">有效</label>
                        &nbsp;&nbsp;
                    </span>
                    <span class="item">
                        <input id="IsUnfold" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="IsUnfold" style="vertical-align: middle;">展开</label>
                        &nbsp;&nbsp;
                    </span>
                    <span class="item">
                        <input id="AllowEdit" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="AllowEdit" style="vertical-align: middle;">允许编辑</label>
                        &nbsp;&nbsp;
                    </span>
                    <span class="item">
                        <input id="AllowDelete" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="AllowDelete" style="vertical-align: middle;">允许删除</label>
                        &nbsp;&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
                <th>显示顺序：
                </th>
                <td>
                    <input id="SortCode" runat="server" type="text" class="txt"  datacol="yes" err="显示顺序"
                        checkexpession="Num" style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>描述：
                </th>
                <td>
                    <input id="Description" runat="server" type="text" class="txt"  style="width: 90%" />
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return CheckDataValid('#form1');" OnClick="Accept_Click"><span class="l-btn-left"><img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
