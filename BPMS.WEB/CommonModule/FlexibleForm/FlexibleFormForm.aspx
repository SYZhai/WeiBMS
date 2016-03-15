<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlexibleFormForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.FlexibleForm.FlexibleFormForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>自定义表单信息</title>
    <link href="/Themes/Styles/Style.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="Property_Code" type="hidden" runat="server" />
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>属性名称：
                </th>
                <td>
                    <input id="FullName" runat="server" type="text" class="txt" datacol="yes" err="属性名称"
                        checkexpession="NotNull" style="width: 220px" />
                </td>
                <th>控件名称：
                </th>
                <td>
                    <input id="Control_Id" runat="server" type="text" class="txt" datacol="yes"
                        err="控件名称" checkexpession="NotNull" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>控件类型：
                </th>
                <td>
                    <select id="Type" class="select" runat="server" datacol="yes" err="控件类型" checkexpession="NotNull" style="width: 226px">
                        <option value="">==请选择==</option>
                        <option value="1">文本框</option>
                        <option value="2">下拉框</option>
                        <option value="3">日期框</option>
                        <option value="4">标  签</option>
                        <option value="5">多行文本框</option>
                    </select>
                </td>
                <th>控件宽度：
                </th>
                <td>
                    <input id="Length" runat="server" type="text" class="txt" style="width: 220px"
                        datacol="yes" err="控件宽度" checkexpession="NotNull" value='200px' />
                </td>
            </tr>
            <tr>
                <th>控件高度：
                </th>
                <td>
                    <input id="Height" runat="server" type="text" class="txt" style="width: 220px"
                        value='25' />
                </td>
                <th>控件样式：
                </th>
                <td>
                    <select id="Style" class="select" runat="server" style="width: 226px">
                        <option value="txt">txt</option>
                        <option value="select">select</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>表单验证：
                </th>
                <td>
                    <select id="Validator" class="select" runat="server" style="width: 226px">
                        <option value="">允许为空</option>
                        <option value="NotNull">NotNull - 不能为空</option>
                        <option value="Num">Num - 必须为数字</option>
                        <option value="NumOrNull">NumOrNull - 必须为数字</option>
                        <option value="Phone">Phone - 必须电话格式！</option>
                        <option value="PhoneOrNull">PhoneOrNull - 必须电话格式！</option>
                        <option value="Mobile">Mobile - 必须为手机格式！</option>
                        <option value="MobileOrNull">MobileOrNull - 必须为手机格式！</option>
                        <option value="MobileOrPhoneOrNull">必须为电话格式或手机格式！</option>
                        <option value="Email">Email - 必须为E-mail格式！</option>
                        <option value="isEmailOrNull">EmailOrNull - 必须为E-mail格式！</option>
                        <option value="Date">Date - 必须为日期格式！</option>
                        <option value="DateOrNull">DateOrNull - 必须为日期格式！</option>
                        <option value="IDCard">IDCard - 必须为身份证格式！</option>
                        <option value="IDCardOrNull">IDCardOrNull - 必须为身份证格式！</option>
                        <option value="Double">Double - 必须为小数！</option>
                        <option value="DoubleOrNull">DoubleOrNull - 必须为小数！</option>
                    </select>
                </td>
                <th>最大长度：
                </th>
                <td>
                    <input id="Showlength" runat="server" type="text" class="txt" datacol="yes"
                        err="最大长度" checkexpession="Num" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>触发事件：
                </th>
                <td>
                    <input id="Event" runat="server" type="text" class="txt" style="width: 220px" />
                </td>
                <th>显示顺序：
                </th>
                <td>
                    <input id="SortCode" runat="server" type="text" class="txt" datacol="yes" err="显示顺序"
                        checkexpession="Num" style="width: 220px" />
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <th>有效：</th>
                <td>
                    <span class="item">
                        <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="Enabled" style="vertical-align: middle;">有效</label>
                        &nbsp;&nbsp;
                    </span>
                </td>
                <th>数据源类型：
                </th>
                <td>
                    <select id="DataSourceType" class="select" runat="server" style="width: 226px">
                        <option value="0">0 - 固定</option>
                        <option value="1">1 - 动态</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>数据源：
                </th>
                <td colspan="3">
                    <textarea id="DataSource" maxlength="200" runat="server" type="text" class="txtArea" rows="4" style="width: 594px"></textarea>
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

