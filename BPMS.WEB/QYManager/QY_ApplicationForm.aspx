<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QY_ApplicationForm.aspx.cs" Inherits="BPMS.WEB.QYManager.QY_ApplicationForm" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>企业号应用表单</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" class="frm" >
            <tr>
                <th>应用名称：
                </th>
                <td>
                    <input id="appName" maxlength="100" runat="server" type="text"  datacol="yes" err="应用名称" checkexpession="NotNull" class="txt" style="width: 290px;height:30px;" />
                </td>
            </tr>
            <tr>
                <th>应用描述：
                </th>
                <td>
                    <textarea id="appDescription"  maxlength="200" runat="server" class="txtArea" type="text" style="width: 290px;height:60px;"  ></textarea>
                </td>
            </tr>
            <tr>
                <th>应用管理组：
                </th>
                <td>
                    <select id="appManager" runat="server" class="select" style="width: 200px;height:30px;" datacol="yes" err="应用管理组" checkexpession="NotNull">
                    </select>
                </td>
            </tr>
            <tr>
                <th>应用可见范围：
                </th>
                <td>
                    <select id="appDepartment" runat="server" class="select" style="width: 200px;height:30px;" datacol="yes" err="应用可见范围" checkexpession="NotNull">
                    </select>
                </td>
            </tr>
            <tr>
                <th>接口Url：
                </th>
                <td>
                    <input id="appUrl" maxlength="100" runat="server" type="text"   class="txt" style="width: 290px;height:30px;" />
                </td>
            </tr>
            <tr>
                <th>应用Token：
                </th>
                <td>
                    <input id="appToken" maxlength="100" runat="server" type="text"   class="txt" style="width: 290px;height:30px;" />
                </td>
            </tr>
            <tr>
                <th>EncodingAESKey：
                </th>
                <td>
                    <input id="appEncodingAESKey" maxlength="100" runat="server" type="text"   class="txt" style="width: 290px;height:30px;" />
                </td>
            </tr>
            <tr>
                <th>是否可用：
                </th>
                <td>
                    <span class="item">
                    <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                    <label for="Enabled" style="vertical-align: middle;"></label>
                    &nbsp;&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
                <th>排序码：
                </th>
                <td>
                    <input id="SortCode" maxlength="10" runat="server" type="text"   class="txt" style="width: 50px;height:30px;" />
                </td>
            </tr>
            <tr>
                <th>备注：
                </th>
                <td>
                    <textarea id="remark"  maxlength="200" runat="server" class="txtArea" type="text" style="width: 290px;height:60px;" ></textarea>
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
