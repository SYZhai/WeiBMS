<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BPMS_QYNumberForm.aspx.cs" Inherits="BPMS.WEB.QYManager.BPMS_QYNumberForm" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>企业号表单</title>
      <link href="/Themes/Scripts/Uploadify/example/css/default.css" rel="stylesheet" type="text/css" />
    <link href="/Themes/Scripts/Uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Themes/Scripts/Uploadify/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Themes/Scripts/Uploadify/swfobject.js"></script>
    <script type="text/javascript" src="/Themes/Scripts/Uploadify/jquery.uploadify.v2.1.0.min.js"></script>

    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>

      <script type="text/javascript">
        $(document).ready(function () {
            $("#uploadify").uploadify({
                'uploader': '/Themes/Scripts/Uploadify/uploadify.swf',
                'script': 'UploadHandler.ashx?action=Uploadify',
                'cancelImg': '/Themes/Scripts/Uploadify/cancel.png',
                'folder': '/Resource/UploadFile',
                'queueID': 'fileQueue',
                'auto': false,
                'multi': true,
                'onAllComplete': function (event, data) {
                    showTipsMsg('上传成功。', '4000', '4'); top.$('#' + Current_iframeID())[0].contentWindow.windowload();
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server" class="niceform">
         <div id="demo" class="demo"></div>
        <table border="0" cellpadding="0" cellspacing="0" class="frm" >
            <tr>
                <th>企业号ID：
                </th>
                <td>
                    <input id="QYId" maxlength="50" runat="server" type="text"  datacol="yes" err="企业号ID" checkexpession="NotNull" class="txt" style="width: 290px;height:25px;" />
                </td>
            </tr>
            <tr>
                <th>企业号名称：
                </th>
                <td>
                    <input id="QYName" maxlength="50" runat="server" type="text"  datacol="yes" err="企业号名称" checkexpession="NotNull" class="txt" style="width: 290px;height:25px;" />
                </td>
            </tr>
            <tr>
                <th>企业号描述：
                </th>
                <td>

                    <textarea id="QYDescription"  maxlength="200" runat="server" class="txtArea" type="text"  datacol="yes" err="企业号描述" style="width: 290px;height:60px;"  ></textarea>
                </td>
            </tr>
            <tr>
                <th>企业号logo：
                </th>
                <td>
                     <input type="file" name="uploadify" id="uploadify" />
                     <div id="fileQueue"></div>
                    <label id="QYLogo"/>
                </td>
            </tr>
            <tr>
                <th>企业号二维码：
                </th>
                <td>
                    <label id="QYEwm"/>
                </td>
            </tr>
            <tr>
                <th>CorpID：
                </th>
                <td>
                    <input id="CorpID" maxlength="50" runat="server" type="text"  datacol="yes" err="CorpID" checkexpession="NotNull" class="txt" style="width: 290px; height:25px;" />
                </td>
            </tr>
            <tr>
                <th>状态：
                </th>
                <td>
                    <span class="item">
                    <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                    <label for="Enabled" style="vertical-align: middle;">是否可用</label>
                    &nbsp;&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
                <th>备注：
                </th>
                <td>
                    <textarea id="remark"  maxlength="100" runat="server" class="txtArea" type="text" style="width: 290px;height:60px;"  ></textarea>
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
