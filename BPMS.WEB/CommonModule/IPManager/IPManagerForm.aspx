<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IPManagerForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.IPManager.IPManagerForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统访问控制</title>
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
        <div class="WarmPrompt-From">
            温馨提示：IP格式：192.168.0.1
        </div>
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>起始IP：
                </th>
                <td>
                    <input id="StartIp" maxlength="50" class="txt" runat="server" type="text" datacol="yes" err="起始IP" checkexpession="IsIP" style="width: 290px" />
                </td>
            </tr>
            <tr>
                <th>结束IP：
                </th>
                <td>
                    <input id="EndIp" maxlength="50" class="txt" runat="server" type="text" datacol="yes" err="结束IP" checkexpession="IsIP" style="width: 290px" />
                </td>
            </tr>
            <tr>
                <th>失效时间：
                </th>
                <td>
                    <input id="Failuretime" maxlength="23" onfocus="WdatePicker()" class="txt" runat="server" type="text" datacol="yes" err="失效时间" checkexpession="NotNull" style="width: 290px" />
                </td>
            </tr>
            <tr>
                <th>规则类型：
                </th>
                <td>
                    <select id="Category" runat="server" class="select" style="width: 296px">
                        <option value="0" style="color:red">不允许登录</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>有效：
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
                <th>描述：
                </th>
                <td>
                    <textarea id="Description" maxlength="200" runat="server" type="text" class="txtArea" rows="5" style="width: 290px"></textarea>
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
