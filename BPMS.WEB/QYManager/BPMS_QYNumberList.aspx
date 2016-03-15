<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BPMS_QYNumberList.aspx.cs" Inherits="BPMS.WEB.QYManager.BPMS_QYNumberList" %>
<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>企业号列表</title>
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
            var url = "BPMS_QYNumberList.aspx?action=GridBindList";
            //colM：表头名称
            var colM = [
                { title: "企业号ID", width: 100, align: "left" ,hidden: true },
                { title: "logo", width: 100,height:100, align: "left"  },
                { title: "名称", width: 150, align: "left"  },
                { title: "描述", width: 250, align: "left"  },
                { title: "二维码", width: 100, align: "left"  },
                { title: "CorpID", width: 150, align: "left"  },
                {
                      title: "有效", width: 60, align: "center",
                      render: function (ui) {
                          var rowData = ui.rowData;
                          var value = rowData[6];
                          if (value == '0') {
                              return "<img src='/Themes/Images/checknomark.gif'/>";
                          }
                          if (value == '1') {
                              return "<img src='/Themes/Images/checkmark.gif'/>";
                          }
                      }
                  },
                { title: "SortCode", width: 100, align: "left" ,hidden: true },
                { title: "创建日期", width: 150, align: "left"  },
                { title: "创建用户id", width: 100, align: "left" ,hidden: true },
                { title: "创建用户", width: 150, align: "left"  },
                { title: "备注", width: 200, align: "left"  }
            ];
            //sort：要显示字段,数组对应
            var sort = [
                "QYId",
                "QYLogo",
                "QYName",
                "QYDescription",
                "QYEwm",
                "CorpID",
                "Enabled",
                "SortCode",
                "CreateDate",
                "CreateUserId",
                "CreateUserName",
                "remark"
            ];
            PQLoadGrid("#grid_paging", url, colM, sort, 20)
            $("#grid_paging").pqGrid({ freezeCols: 1 })
            pqGridResize("#grid_paging", -51, -2);
        }
        //新增
        function add() {
            var url = "/QYManager/BPMS_QYNumberForm.aspx";
            top.openDialog(url, 'BPMS_QYNumberForm', '企业号信息 - 添加', 550, 450, 50, 50);
        }
        //编辑
        function edit() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsEditdata(key)) {
                var url = "/QYManager/BPMS_QYNumberForm.aspx?key=" + key;
                top.openDialog(url, 'BPMS_QYNumberForm', '企业号信息 - 编辑', 750, 450, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = GetPqGridRowValue("#grid_paging", 0);
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('BPMS_QYNumberList.aspx', delparm);
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

