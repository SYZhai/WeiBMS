<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataPermissionList.aspx.cs" Inherits="BPMS.WEB.CommonModule.DataPermission.DataPermissionList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>角色数据权限控制</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.4.4.min.js"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        $(function () {
            divresize('.div-body', 97);
            GetAuthorizationItem('Organization');
        });
        //获取授权项目列表
        function GetAuthorizationItem(id) {
            Loading(true);
            $("#strHtml").html("");
            var AuthorizationItemValue = $("#AuthorizationItem").val();
            var parm = "";
            if (id == 'Organization') {
                parm = 'action=LoadOrgTree&RoleId=' + GetQuery('RoleId') + '&AuthorizationItemValue=' + AuthorizationItemValue;
            } else if (id == 'User') {
                parm = 'action=LoadUserList&RoleId=' + GetQuery('RoleId') + '&AuthorizationItemValue=' + AuthorizationItemValue;
            } else if (id == 'Employee') {
                parm = 'action=LoadEmployeeList&RoleId=' + GetQuery('RoleId') + '&AuthorizationItemValue=' + AuthorizationItemValue;
            } else {
                alert("很抱歉！该功能未开发，请参考，组织机构、用户、员工");
            }
            if (parm != "") {
                getAjax('DataPermissionList.aspx', parm, function (data) {
                    $("#strHtml").html(data);
                });
                $("input[type='checkbox'][name='checkbox']").click(function () {
                    //子目录 
                    var c = $(this).parent().find("input");
                    var b = $(this).attr('checked'); c.each(function () {
                        $(this).attr('checked', b);
                    });
                    var m = $(this).parent().parent('ul').find('input');
                    var count = 0; m.each(function () {
                        if ($(this).attr('checked')) { count++; }
                    }); //父目录
                    var p = $(this).parents('li'); //父目录 
                    p.each(function () {
                        var o = $(this).find('input');
                        if (count) {
                            o[0].checked = true;
                        } else {
                            o[0].checked = !o[0].checked;
                        }
                    });
                    $(this).attr('checked', b);
                });
                treeAttrCss();
            }
        }
        //重置按钮权限
        function AcceptReset() {
            var AuthorizationItemText = $("#AuthorizationItem").find("option:selected").text();
            var AuthorizationItemValue = $("#AuthorizationItem").val();
            showConfirmMsg("注：重置操作将会清空【" + AuthorizationItemText + "】数据权限，是否继续？", function (r) {
                if (r) {
                    var parm = 'action=AddDataPermission&itemId=&RoleId=' + GetQuery('RoleId') + '&AuthorizationItemValue=' + AuthorizationItemValue;
                    getAjax('DataPermissionList.aspx', parm, function (rs) {
                        if (rs.toLocaleLowerCase() == 'true') {
                            Loading(true);
                            showTipsMsg("重置成功。", 2000, 4);
                            GetAuthorizationItem(AuthorizationItemValue);
                        } else if (rs.toLocaleLowerCase() == 'false') {
                            showTipsMsg("很抱歉，操作失败。", 4000, 5);
                        } else {
                            showTipsMsg(rs, 4000, 3);
                        }
                    });
                }
            });
        }
        //授权事件
        function Authorization() {
            var itemId = GetCheckboxValue();
            var AuthorizationItemValue = $("#AuthorizationItem").val();
            var parm = 'action=AddDataPermission&itemId=' + itemId + '&RoleId=' + GetQuery('RoleId') + '&AuthorizationItemValue=' + AuthorizationItemValue;
            getAjax('DataPermissionList.aspx', parm, function (rs) {
                if (rs.toLocaleLowerCase() == 'true') {
                    Loading(true);
                    showTipsMsg("授权成功。", 2000, 4);
                    GetAuthorizationItem(AuthorizationItemValue);
                } else if (rs.toLocaleLowerCase() == 'false') {
                    showTipsMsg("很抱歉，操作失败。", 4000, 5);
                } else {
                    showTipsMsg(rs, 4000, 3);
                }
            });
        }
        /**
        获取选中复选框值
        值：1,2,3,4
        **/
        function GetCheckboxValue() {
            var reVal = '';
            $('[type = checkbox]').each(function () {
                if ($(this).attr("checked")) {
                    reVal += "'" + $(this).val() + "',";
                }
            });
            reVal = reVal.substr(0, reVal.length - 1);
            return reVal;
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
                        <th>授权项目列表：
                        </th>
                        <td>
                            <select id="AuthorizationItem" onchange="GetAuthorizationItem(this.value)" class="select" runat="server" style="width: 150px">
                                <option value="Organization">组织机构</option>
<%--                                <option value="User">用户</option>
                                <option value="Employee">员工</option>--%>
                                <option value="Client">客户</option>
                                <option value="Supplier">供应商</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="div-body">
            <ul class="black strTree" id="strHtml">
            </ul>
        </div>
    </form>
</body>
</html>
