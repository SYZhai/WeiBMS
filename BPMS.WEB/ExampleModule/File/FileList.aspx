<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileList.aspx.cs" Inherits="BPMS.WEB.ExampleModule.File.FileList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>文件列表</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        $(function () {
            divresize(".div-body", 48);
            $(".Fileshortcuticons").click(function () {
                $("#hiddenFile_ID").val($(this).attr("id"));
                $('.Fileshortcuticons').removeClass("Fileselected")
                $(this).addClass("Fileselected");
            }).hover(function () {
                if ($(this).attr("Class") != "Fileshortcuticons Fileselected") {
                    $(this).addClass("FilenavHover");
                }
            }, function () {
                $(this).removeClass("FilenavHover");
            });
        })
        //上传
        function Uploadify() {
            var url = "/ExampleModule/File/UploadifyForm.aspx";
            top.openDialog(url, 'UploadifyForm', '文件上传', 450, 310, 50, 50);
        }
        //删除文件
        function Delete() {
            var key = $("#hiddenFile_ID").val();
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('UploadHandler.ashx', delparm)
            }
        }
        //下载
        function download() {
            var key = $("#hiddenFile_ID").val();
            if (IsChecked(key)) {
                var parm = 'UploadHandler.ashx?action=download&key=' + key;
                window.location.href = parm;
            }
        }
    </script>
    <style type="text/css">
        .Fileshortcuticons {
            float: left;
            border: solid 1px #fff;
            width: 112px;
            height: 105px;
            margin: 5px;
            padding: 5px;
            cursor: pointer;
            vertical-align: middle;
            text-align: center;
            word-break: keep-all;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            border: 1px solid #fff;
            -moz-border-radius: 5px;      /* Gecko browsers */
            -webkit-border-radius: 5px;   /* Webkit browsers */
            border-radius:5px;            /* W3C syntax */
        }

        .Fileselected {
            border: 1px solid #ccc;
            background-color: #c9e7ff;
        }

        .FilenavHover {
            background-color: #e4f6f8;
            filter: alpha(opacity=90); /* IE */
            -moz-opacity: 0.9; /* Moz + FF */
            opacity: 0.9;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <input type="hidden" id="hiddenFile_ID" runat="server" />
        <div class="div-body">
            <%=sb_File %>
        </div>
    </form>
</body>
</html>
