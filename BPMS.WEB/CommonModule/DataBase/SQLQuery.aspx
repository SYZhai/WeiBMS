<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SQLQuery.aspx.cs" Inherits="BPMS.WEB.CommonModule.DataBase.SQLQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>新建查询</title>
    <link href="/Themes/Styles/Style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script type="text/javascript">
        //回车键
        document.onkeydown = function (e) {
            if (!e) e = window.event; //火狐中是 window.event
            if ((e.keyCode || e.which) == 13) {
                var obtnSearch = document.getElementById("ExeOuter");
                obtnSearch.focus(); //让另一个控件获得焦点就等于让文本输入框失去焦点
                obtnSearch.click();
            }
        }
        //初始化
        $(function () {
            divresize();
            $("#txtSql").css("height", "153").css("width", $(window).width() - 4);
        })
        /**自应表格高度**/
        function divresize() {
            resizeU();
            $(window).resize(resizeU);
            function resizeU() {
                $("#divGrid").css("height", $(window).height() - 223);
                $("#divtxt").css("height", "155");
            }
        }
    </script>
    <style>
        .grid {
            margin: 0px;
            border-collapse: collapse;
            table-layout:fixed;
        }
       .grid td{text-overflow:ellipsis;overflow:hidden;white-space: nowrap;padding:2px}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                以下操作建议在软件开发商指导下进行 &nbsp;&nbsp;<span style="color: Red;">注：SQL 查询（最大显示500条）</span>
            </div>
        </div>
        <div class="btnbarcontetn" style="height: 35px; line-height: 35px;">
            执行类型：<select id="Execute_Type" class="select" runat="server">
                <option value="1">查询列表</option>
                <option value="2">更新与删除</option>
            </select>
            &nbsp;&nbsp;
            <asp:Button ID="ExeOuter" runat="server" CssClass="btnSearch" OnClick="ExeOuter_Click" Text="执行" />
        </div>
        <div id="divtxt" class="div-body">
            <textarea id="txtSql" style="border: 0px solid #A8A8A8;" runat="server"></textarea>
        </div>
        <div id="divGrid" class="div-body" style="padding-top: 1px;">
            <asp:GridView ID="Grid" CssClass="grid" runat="server" BorderStyle="None" CellPadding="0"
                GridLines="None">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
