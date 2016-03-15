<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModulePermission.aspx.cs" Inherits="BPMS.WEB.CommonModule.Role.ModulePermission" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>角色模块权限</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/TreeTable/jquery.treeTable.js" type="text/javascript"></script>
    <link href="/Themes/Scripts/TreeTable/css/jquery.treeTable.css" rel="stylesheet"
        type="text/css" />
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script>
        $(function () {
            divresize('.div-body', 78);
            $("#dnd-example").treeTable({
                initialState: "expanded" //collapsed 收缩 expanded展开的
            });
        })
        //重置按钮权限
        function AcceptReset() {
            if (IsNullOrEmpty(GetQuery('RoleId'))) {
                showConfirmMsg("注：重置操作将会清空用户的所有模块权限，是否继续？", function (r) {
                    if (r) {
                        var parm = 'action=AddModulePermission&RoleId=' + GetQuery('RoleId');
                        getAjax('ModulePermission.ashx', parm, function (rs) {
                            if (rs.toLocaleLowerCase() == 'true') {
                                Loading(true);
                                showTipsMsg("重置成功。", 2000, 4);
                                windowload();
                            } else if (rs.toLocaleLowerCase() == 'false') {
                                showTipsMsg("很抱歉，操作失败。", 4000, 5);
                            } else {
                                showTipsMsg(rs, 4000, 3);
                            }
                        });
                    }
                });
            }
        }
        //授权事件
        function Authorization() {
            if (IsNullOrEmpty(GetQuery('RoleId'))) {
                var MenuId = CheckboxValue();
                var parm = 'action=AddModulePermission&MenuId=' + MenuId + '&RoleId=' + GetQuery('RoleId');
                getAjax('ModulePermission.ashx', parm, function (rs) {
                    if (rs.toLocaleLowerCase() == 'true') {
                        Loading(true);
                        showTipsMsg("授权成功。", 2000, 4);
                        windowload();
                    } else if (rs.toLocaleLowerCase() == 'false') {
                        showTipsMsg("很抱歉，操作失败。", 4000, 5);
                    } else {
                        showTipsMsg(rs, 4000, 3);
                    }
                });
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div class="WarmPrompt">
            温馨提示：设置后请点击【授权】按钮授权当前设置
        </div>
        <div class="div-body" style="border-right: #ccc 0px solid;">
            <table class="example" id="dnd-example">
                <thead>
                    <tr>
                        <td style="width: 230px; padding-left: 20px;">
                            <label id="checkAllOff" onclick="CheckAllLine()" title="全选">&nbsp;</label>模块(菜单)名称
                        </td>
                        <td style="width: 100px; text-align: center;">模块编码
                        </td>
                        <td style="width: 60px; text-align: center;">模块分类
                        </td>
                        <td style="width: 60px; text-align: center;">排序
                        </td>
                        <td>说明
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <%=TableTree_Menu.ToString()%>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
