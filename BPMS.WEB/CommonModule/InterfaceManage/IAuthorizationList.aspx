<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IAuthorizationList.aspx.cs" Inherits="BPMS.WEB.CommonModule.InterfaceManage.IAuthorizationList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统接口访问授权</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/jquery-ui.min.js"></script>
    <script src="/Themes/Scripts/PqGrid/pqgrid.min.js" charset="GBK"></script>
    <link href="/Themes/Scripts/PqGrid/pqgrid.min.css" rel="stylesheet" />
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            ListGrid();
        });
        // 给日期类对象添加日期差方法，返回日期与diff参数日期的时间差，单位为天 
        Date.prototype.diff = function (date) {
            return (date.getTime() - this.getTime()) / (24 * 60 * 60 * 1000);
        }
        /**加载表格函数**/
        function ListGrid() {
            var Parm_Key_Value = $("#query").val() + "☻" + $("#keywords").val() + "≌Enabled☻" + escape($("#Enabled").attr("checked") ? 1 : 0) + "≌";
            //url：请求地址
            var url = "IAuthorizationList.aspx?action=GridBindList&Parm_Key_Value=" + escape(Parm_Key_Value);
            //colM：表头名称
            var colM = [
                { title: "系统接口访问主键", width: 100, align: "left", hidden: true },
                { title: "编号", width: 100, align: "center" },
                { title: "授权用户", width: 110, align: "left" },
                { title: "生效日期", width: 140, align: "center" },
                { title: "过期日期", width: 140, align: "center" },
                {
                    title: "剩余天数", width: 70, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[5];
                        var now = new Date();
                        var date = new Date(value);
                        return parseInt(now.diff(date)) + 1
                    }
                },
                {
                    title: "有效", width: 60, align: "center",
                    render: function (ui) {
                        var rowData = ui.rowData;
                        var value = rowData[6];
                        if (value == '0')
                            return "<img src='/Themes/Images/checknomark.gif'/>";
                        else
                            return "<img src='/Themes/Images/checkmark.gif'/>";
                    }
                },
                { title: "授权模块代码", width: 300, align: "left" },
                { title: "描述", width: 300, align: "left" }

            ];
            //sort：要显示字段,数组对应
            var sort = [
                "IAccessId",
                "Code",
                "AuthorizationUserName",
                "StartDate",
                "EndDate",
                "EndDate",
                "Enabled",
                "AuthorizationCode",
                "Description"
            ];
            PQLoadGridNoPage("#grid_paging", url, colM, sort)
            $("#grid_paging").pqGrid({
                freezeCols: 7,
                title: "<img src='/Themes/Images/32/202323.png' width='25' height='25' style=\"vertical-align: middle;\" />系统接口访问授权用户列表"
            });
            pqGridResizefixed("#grid_paging", $(window).height() - 82, +15);
        }
        //新增
        function add() {
            var url = "/CommonModule/InterfaceManage/IAuthorizationForm.aspx";
            top.openDialog(url, 'IAuthorizationForm', '系统接口访问授权 - 添加', 450, 330, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/CommonModule/InterfaceManage/IAuthorizationForm.aspx?key=" + key;
                top.openDialog(url, 'IAuthorizationForm', '系统接口访问授权 - 编辑', 450, 330, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('IAuthorizationList.aspx', delparm);
            }
        }
        //刷新
        function windowload() {
            $("#grid_paging").pqGrid("refreshDataAndView");
            GetRowIndex = -1;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div class="btnbarcontetn" style="margin-top: 1px; background: #fff">
            <div>
                <table border="0" class="frm-find" style="height: 45px;">
                    <tr>
                        <th>查询条件：
                        </th>
                        <td>
                            <select id="query" class="select" runat="server" style="width: 70px">
                                <option value="Code">编号</option>
                                <option value="AuthorizationUserName">授权用户</option>
                            </select>
                        </td>
                        <th>关键字：
                        </th>
                        <td>
                            <input id="keywords" runat="server" type="text" class="txt" style="width: 200px" />
                        </td>
                        <td>
                            <input id="btnSearch" type="button" class="btnSearch" value="搜 索" onclick="ListGrid()" />
                            <span class="item">
                                <input id="Enabled" onclick="ListGrid()" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                                <label for="Enabled" style="vertical-align: middle;" >只显示有效的</label>
                                &nbsp;&nbsp;
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>
