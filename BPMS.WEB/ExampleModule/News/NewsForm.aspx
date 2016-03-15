<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsForm.aspx.cs" Inherits="BPMS.WEB.ExampleModule.News.NewsForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新闻发布编辑</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/xhEditor/xheditor-1.1.14-zh-cn.min.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>内容简介：
                </th>
                <td>
                    <input id="Introduction" maxlength="200" runat="server" type="text" class="txt" datacol="yes" err="内容简介" checkexpession="NotNull" style="width: 89.2%" />
                </td>
            </tr>
            <tr>
                <th style="vertical-align: top;">文章内容：
                </th>
                <td>
                    <textarea id="Contents" name="elm1" class="xheditor" rows="20" cols="80" runat="server" style="width: 90%">
                        
	</textarea>
                </td>
            </tr>
            <tr>
                <th>关键字：
                </th>
                <td>
                    <input id="Keywords" maxlength="200" runat="server" type="text" class="txt" style="width: 89.2%" />
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
                </td>
            </tr>
            <tr>
                <th>创建时间：
                </th>
                <td>
                    <input id="CreateDate" maxlength="23" onclick="WdatePicker()" runat="server" type="text" datacol="yes" err="创建时间" checkexpession="NotNull" class="txt" style="width: 200px" />
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
