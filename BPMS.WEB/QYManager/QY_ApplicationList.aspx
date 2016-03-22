<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QY_ApplicationList.aspx.cs" Inherits="BPMS.WEB.QYManager.QY_ApplicationList" %>
<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>企业号应用列表</title>
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
        /**加载表格函数**/
        function ListGrid() {
            //url：请求地址
            var url = "QY_ApplicationList.aspx?action=GridBindList";
            //colM：表头名称
            var colM = [
                { title: "应用ID", width: 100, align: "left"  },
                { title: "应用名称", width: 100, align: "left"  },
                { title: "应用描述", width: 200, align: "left"  },
                { title: "应用管理组", width: 100, align: "left" ,hidden: true },
                { title: "应用可见范围", width: 100, align: "left" ,hidden: true },
                { title: "接口Url", width: 200, align: "left" ,hidden: true },
                { title: "应用Token", width: 100, align: "left" ,hidden: true },
                { title: "EncodingAESKey", width: 100, align: "left" ,hidden: true },
                { title: "创建日期", width: 200, align: "left"  },
                { title: "是否可用", width: 100, align: "left"  },
                { title: "排序码", width: 10, align: "left"  },
                { title: "创建用户主键", width: 100, align: "left" ,hidden: true },
                { title: "创建用户", width: 100, align: "left" ,hidden: true },
                { title: "修改日期", width: 100, align: "left" ,hidden: true },
                { title: "修改用户主键", width: 100, align: "left" ,hidden: true },
                { title: "修改用户", width: 100, align: "left" ,hidden: true },
                { title: "备注", width: 300, align: "left"  }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "appId",
                "appName",
                "appDescription",
                "appManager",
                "appDepartment",
                "appUrl",
                "appToken",
                "appEncodingAESKey",
                "CreateDate",
                "Enabled",
                "SortCode",
                "CreateUserId",
                "CreateUserName",
                "ModifyDate",
                "ModifyUserId",
                "ModifyUserName",
                "remark"
            ];
            PQLoadGrid("#grid_paging", url, colM, sort, 20)
            $("#grid_paging").pqGrid({ freezeCols: 1 })
            pqGridResize("#grid_paging", -51, -2);
        }
        //新增
        function add() {
            var url = "/QYManager/QY_ApplicationForm.aspx";
            top.openDialog(url, 'QY_ApplicationForm', '企业号应用信息 - 添加', 550, 450, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/QYManager/QY_ApplicationForm.aspx?key=" + key;
                top.openDialog(url, 'QY_ApplicationForm', '企业号应用信息 - 编辑', 750, 450, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('QY_ApplicationList.aspx', delparm);
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
        <div id="grid_paging" style="margin-top: 1px;"></div>
    </form>
</body>
</html>

