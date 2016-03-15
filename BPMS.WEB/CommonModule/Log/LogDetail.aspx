<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogDetail.aspx.cs" Inherits="BPMS.WEB.CommonModule.Log.LogDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>操作日志明细</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            if (GetQuery('status') <= 3) {
                ListGrid();
            } else {
                $("#Other").show();
            }
        });
        /**加载表格函数**/
        function ListGrid() {
            //url：请求地址
            var url = "LogDetail.aspx?action=GridBindList&SyslogsId=" + GetQuery('SyslogsId');
            //colM：表头名称
            var colM = [
                { title: "操作日志明细主键", hidden: true },
                { title: "字段", width: 200, align: "left" },
                { title: "字段名", width: 200, align: "left" },
                { title: "旧值", width: 200, align: "left" },
                { title: "新值", width: 200, align: "left" }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "SysLogDetailsId",
                "FieldText",
                "FieldName",
                "OldValue",
                "NewValue"
            ];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({ topVisible: false });
            gridresize();
        }
        function gridresize() {
            resizeU();
            $(window).resize(resizeU);
            function resizeU() {
                var grid1 = $("#grid_paging").pqGrid({
                    width: $(window).width() - 4,
                    height: $(window).height() - 4
                });
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="grid_paging"></div>
        <div id="Other" style="font-size: 18pt; display: none;" runat="server">
        </div>
    </form>
</body>
</html>
