<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExceptionFile.aspx.cs" Inherits="BPMS.WEB.CommonModule.ExceptionLog.ExceptionFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统日志文件</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        //初始化
        $(function () {
            divresize('.div-body', 32);
            treeAttrCss();
        })
        //点击事件
        function FileName(FilePath) {
            var path = 'ExceptionText.aspx?FilePath=' + escape(FilePath);
            window.parent.frames["target_right"].location = path;
            Loading(true);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                文件目录
            </div>
        </div>
        <div class="line"></div>
        <div class="div-body">
            <ul class="black strTree">
                <%=strHtml.ToString()%>
            </ul>
        </div>
    </form>
</body>
</html>
