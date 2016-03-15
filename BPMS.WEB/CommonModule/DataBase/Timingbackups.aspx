<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timingbackups.aspx.cs" Inherits="BPMS.WEB.CommonModule.DataBase.Timingbackups" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>定时备份数据</title>
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
            温馨提示：是每天自动定时备份数据库设置时间
        </div>
        <br />
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>执行时间：
                </th>
                <td>
                    <select id="Time" runat="server" class="select" style="width: 90%">
                        <option value="00:00:00">00:00:00</option>
                        <option value="01:00:00">01:00:00</option>
                        <option value="02:00:00">02:00:00</option>
                        <option value="03:00:00">03:00:00</option>
                        <option value="04:00:00">04:00:00</option>
                        <option value="05:00:00">05:00:00</option>
                        <option value="06:00:00">06:00:00</option>
                        <option value="07:00:00">07:00:00</option>
                        <option value="08:00:00">08:00:00</option>
                        <option value="09:00:00">09:00:00</option>
                        <option value="10:00:00">10:00:00</option>
                        <option value="11:00:00">11:00:00</option>
                        <option value="12:00:00">12:00:00</option>
                        <option value="13:00:00">13:00:00</option>
                        <option value="14:00:00">14:00:00</option>
                        <option value="15:00:00">15:00:00</option>
                        <option value="16:00:00">16:00:00</option>
                        <option value="17:00:00">17:00:00</option>
                        <option value="18:00:00">18:00:00</option>
                        <option value="19:00:00">19:00:00</option>
                        <option value="20:00:00">20:00:00</option>
                        <option value="21:00:00">21:00:00</option>
                        <option value="22:00:00">22:00:00</option>
                        <option value="23:00:00">23:00:00</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>任务状态：</th>
                <td>
                    <span class="item">
                        <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="Enabled" style="vertical-align: middle;">有效</label>
                        &nbsp;&nbsp;
                    </span>
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
