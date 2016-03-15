<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBaseManag.aspx.cs" Inherits="BPMS.WEB.CommonModule.DataBase.DataBaseManag" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>数据库管理</title>
    <link href="/Themes/Styles/Style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script>
        $(function () {
            divresize('.ScrollBar', 36);
            ListGrid();
        })
        /**表空间使用情况**/
        function ListGrid() {
            //url：请求地址
            var url = "DataBaseManag.aspx?action=GridBindList";
            //colM：表头名称
            var colM = [
                { title: "表名", width: 200 },
                { title: "记录数", width: 150, align: "center" },
                { title: "使用大小", width: 150, align: "center" },
                { title: "索引所使使用大小", width: 150, align: "center" },
                { title: "未用的空间量", width: 150, align: "center" },
                { title: "表说明", width: 300 }
            ];
            //sort：要显示字段,数组对应
            var sort = ["name",
                        "rows",
                        "data",
                        "index_size",
                        "Unused",
                        "tdescription"];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />表空间使用情况",
                freezeCols: 4
            });
            pqGridResizefixed("#grid_paging", $(window).height() - 21, +13);
        }
        //备份数据库文件列表
        function ListBackupGrid() {
            //url：请求地址
            var url = "DataBaseManag.aspx?action=BackupGridBindList";
            //colM：表头名称
            var colM = [
                { title: "文件名称", width: 200 },
                { title: "文件大小", width: 150, align: "center" },
                { title: "备份日期", width: 150, align: "center" }
            ];
            //sort：要显示字段,数组对应
            var sort = ["FileName",
                        "FileSize",
                        "CreateDate"];
            PQLoadGridNoPage("#backup_paging", url, colM, sort)
            $("#backup_paging").pqGrid({
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />数据库备份文件列表",
                freezeCols: 4
            });
            pqGridResizefixed("#backup_paging", $(window).height() - 69, +13);
        }
        //备份数据库
        function backups() {
            getAjax("DataBaseManag.aspx", "action=backup", function (rs) {
                if (rs.toLocaleLowerCase() == 'true') {
                    showTipsMsg("数据备份成功。", 2000, 4);
                    windowload();
                } else if (rs.toLocaleLowerCase() == 'false') {
                    showTipsMsg("操作失败，请稍后重试</span>", 4000, 5);
                } else {
                    showTipsMsg(rs, 4000, 3);
                }
            })
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#backup_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('DataBaseManag.aspx', delparm);
            }
        }
        //下载
        function download() {
            var key = GetPqGridRowValue("#backup_paging", 0);
            if (IsChecked(key)) {
                var parm = 'DataBaseManag.aspx?action=download&key=' + key;
                window.location.href = parm;
            }
        }
        //定时备份
        function Taskbackups() {
            var url = "/CommonModule/DataBase/Timingbackups.aspx";
            top.openDialog(url, 'DeleteLog', '定时自动备份数据库', 350, 169, 50, 50);
        }
        //刷新
        function windowload() {
            $("#backup_paging").pqGrid("refreshDataAndView");
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="bd" style="border-bottom: 0px solid #ccc">
            <div class="tipstitle_title settingtable bold bd todayInfoPanelTab rightPanelTitle_normal">
                <div class="tab_list_top" style="position: absolute">
                    <div class="tab_list bd actived" onclick="$('#grid_paging').show();$('#div_b').hide();">数据库管理</div>
                    <div class="tab_list bd " onclick="$('#grid_paging').hide();$('#div_b').show();ListBackupGrid();">数据库热备份</div>
                </div>
            </div>
            <div id="grid_paging" style="margin-top: 1px;"></div>
            <div id="div_b" style="margin-top: 1px; display: none;">
                <uc1:LoadButton runat="server" ID="LoadButton" />
                <div id="backup_paging" style="margin-top: 1px;"></div>
            </div>
        </div>
    </form>
</body>
</html>
