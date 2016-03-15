<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Module.ModuleList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>模块(菜单)列表</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/TreeTable/jquery.treeTable.js" type="text/javascript"></script>
    <link href="/Themes/Scripts/TreeTable/css/jquery.treeTable.css" rel="stylesheet"
        type="text/css" />
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script>
        $(function () {
            divresize('.ScrollBar', 48);
            LoadMenuList();
            GetClickTableValue();
        })
        //加载模块菜单列表
        function LoadMenuList() {
            getAjax("ModuleList.aspx", "action=MenuTreeTable", function (data) {
                $("#TableTree").html(data);
            })
            $("#dnd-example").treeTable({
                initialState: "expanded" //collapsed 收缩 expanded展开的
            });
            GetClickTableValue();
            dndexampleCss();
        }
        /**
        获取table TD值
        主键ID
        column:列名
        **/
        var Menu_Id = '';
        var Menu_Name = '';
        var Menu_Img = '';
        function GetClickTableValue() {
            $('#dnd-example tbody tr').not('#td').click(function () {
                $(this).find('td').each(function (i) {
                    if (i == 0) {
                        Menu_Name = $(this).find('span').text();
                    }
                    if (i == 0) {
                        Menu_Img = $(this).find('img').attr('src');
                    }
                    if (i == 8) {
                        Menu_Id = $(this).text();
                    }
                });
            });
        }
        //新增
        function add() {
            var url = "/CommonModule/Module/ModuleForm.aspx?ParentId=" + Menu_Id + '&ParentName=' + escape(Menu_Name);
            top.openDialog(url, 'ModuleForm', '定义模块(菜单) - 添加', 500, 410, 50, 50);
        }
        //编辑
        function edit() {
            if (IsEditdata(Menu_Id)) {
                var url = "/CommonModule/Module/ModuleForm.aspx?key=" + Menu_Id;
                top.openDialog(url, 'ModuleForm', '定义模块(菜单) - 编辑', 500, 410, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = Menu_Id;
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('ModuleList.aspx', delparm);
            }
        }
        //模块定义字段
        function ModuleField() {
            if (IsChecked(Menu_Id)) {
                top.AddTabMenu('ModuleConfigList', '/CommonModule/Module/ModuleConfigList.aspx?Menu_Name=' + encodeURI(Menu_Name) + '&Menu_Id=' + Menu_Id, '模块定义字段', 'true', 'true');
            }
        }
        //模块字段布局
        function ModuleFieldMovable() {
            if (IsChecked(Menu_Id)) {
                var url = "/CommonModule/Module/ModuleConfigMovable.aspx?Menu_Id=" + Menu_Id;
                top.openDialog(url, 'ModuleConfigMovable', '模块字段布局 - ' + Menu_Name, 585, 395, 50, 50);
            }
        }
        //模块按钮
        function ModuleButton() {
            if (IsChecked(Menu_Id)) {
                var url = "/CommonModule/Module/ModuleButton.aspx?Menu_Id=" + Menu_Id + '&Menu_Name=' + escape(Menu_Name) + '&Menu_Img=' + Menu_Img;
                top.openDialog(url, 'ModuleButton.aspx', '模块按钮布局', 700, 455, 50, 50);
            }
        }
        //刷新
        function windowload() {
            LoadMenuList();
            Menu_Id = '';
            Menu_Name = '';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div class="ScrollBar">
            <table class="example" id="dnd-example">
                <thead>
                    <tr>
                        <td style="width: 230px; padding-left: 20px;">模块(菜单)名称
                        </td>
                        <td style="width: 100px;">模块编码
                        </td>
                        <td style="width: 130px; text-align: center;">上级模块
                        </td>
                        <td style="width: 60px; text-align: center;">连接目标
                        </td>
                        <td>Web连接地址
                        </td>
                        <td>WinForm窗体
                        </td>
                        <td style="width: 60px; text-align: center;">有效
                        </td>
                        <td style="width: 60px; text-align: center;">排序
                        </td>
                    </tr>
                </thead>
                <tbody id="TableTree">
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
