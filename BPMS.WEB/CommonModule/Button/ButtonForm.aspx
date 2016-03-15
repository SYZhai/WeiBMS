<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ButtonForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.Button.ButtonForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>操作按钮表单</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        //选取系统图标
        function SelectOpenImg() {
            var url = "/CommonModule/Module/ModuleIcon.aspx?Size=16";
            top.openDialog(url, 'ModuleIcon', '选取系统图标', 615, 530, 100, 50);
        }
        //选取系统图标，回调
        function Set_Menu_Img(img) {
            $("#Img_Menu_Img").attr("src", '/Themes/Images/16/' + img);
            $("#Img").val(img);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" >
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>按钮编码：
                </th>
                <td>
                    <input id="Control_ID" maxlength="50" runat="server" type="text" datacol="yes" err="按钮编码" checkexpession="NotNull" class="txt" style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>按钮名称：
                </th>
                <td>
                    <input id="FullName" maxlength="50" runat="server" type="text" class="txt" datacol="yes" err="按钮名称" checkexpession="NotNull" style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>按钮图标：
                </th>
                <td>
                    <input id="Img" type="hidden" runat="server" />
                    <img id="Img_Menu_Img" src="/Themes/Images/illustration.png" runat="server" alt=""
                        style="vertical-align: middle; padding-right: 10px; width: 16px; height: 16px;" />
                    <input class="btn" value="图标选取" type="button" onclick="SelectOpenImg();" />
                </td>
            </tr>
            <tr>
                <th>按钮事件：
                </th>
                <td>
                    <input id="Event" maxlength="200" runat="server" type="text" class="txt" style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>按钮分类：
                </th>
                <td>
                    <select id="Category" runat="server" class="select" style="width: 90%">
                        <option value="工具栏">工具栏</option>
                        <option value="右击菜单栏">右击菜单栏</option>
                    </select>
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
                        <input id="Split" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="Split" style="vertical-align: middle;">分开</label>
                        &nbsp;&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
                <th>显示顺序：
                </th>
                <td>
                    <input id="SortCode" runat="server" type="text" class="txt" datacol="yes" err="显示顺序"
                        checkexpession="Num" style="width: 90%" />
                </td>
            </tr>
            <tr>
                <th>描述：
                </th>
                <td>
                    <input id="Description" maxlength="200" runat="server" type="text" class="txt" style="width: 90%" />
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return CheckDataValid('#form1');" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
