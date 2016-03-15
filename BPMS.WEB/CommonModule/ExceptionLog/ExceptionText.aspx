<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExceptionText.aspx.cs" Inherits="BPMS.WEB.CommonModule.ExceptionLog.ExceptionText" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统异常日志文件内容</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            divresize();
        })
        /**自应表格高度**/
        function divresize() {
            resizeU();
            $(window).resize(resizeU);
            function resizeU() {
                $("#divtxt").css("height", $(window).height() - 32);
                $("#txtLog").css("height", $(window).height() - 35).css("width", $(window).width() - 6)
            }
        }
        //提示
        function Alert_Ok() {
            showTipsMsg("清空成功！", 2000, 4);
            $("#txtLog").val("");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div style="float: left">
                <asp:Label ID="LblFile" runat="server" Text="未选择文件目录"></asp:Label>
                - 记事本
            </div>
            <div style="text-align: right; ">
                <asp:LinkButton ID="hlkempty" ToolTip="清空当前数据" Style="cursor: pointer; text-decoration: underline; color: Blue;"
                    runat="server" OnClick="hlkempty_Click1" OnClientClick="return confirm('确认要清空当前数据吗？')">清空数据</asp:LinkButton>
            </div>
        </div>
        <div class="line"></div>
        <div id="divtxt" class="div-body" runat="server">
            <textarea id="txtLog" readonly="readonly" runat="server" style="border: 0px solid #A8A8A8;"></textarea>
        </div>
    </form>
</body>
</html>
