<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadifyForm.aspx.cs" Inherits="BPMS.WEB.ExampleModule.File.UploadifyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>上传文件</title>
    <link href="/Themes/Scripts/Uploadify/example/css/default.css" rel="stylesheet" type="text/css" />
    <link href="/Themes/Scripts/Uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Themes/Scripts/Uploadify/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Themes/Scripts/Uploadify/swfobject.js"></script>
    <script type="text/javascript" src="/Themes/Scripts/Uploadify/jquery.uploadify.v2.1.0.min.js"></script>
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
    <input type="file" name="uploadify" id="uploadify" />
    <div id="fileQueue"></div>
    <p>
        <a href="javascript:$('#uploadify').uploadifyUpload()" class="btn">上传</a>&nbsp;<a
            href="javascript:$('#uploadify').uploadifyClearQueue()" class="btn">取消</a>
    </p>
</body>
</html>
