<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizeForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.Organize.OrganizeForm" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>组织机构表单</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        $(function () {
            LoadCategory();
            ManagerAutocomplete();
            AssistantManagerAutocomplete();
        })
        //加载上级节点
        function LoadCategory() {
            $("#ParentName").focus(function () {
                var html = "";
                getAjax('OrganizeForm.aspx', 'action=LoadTree', function (rs) {
                    html = rs;
                });
                combotree("ParentName", $("#ParentName").width() + "px", "200px", html);
                $(".strTree li div").click(function () {
                    $("#ParentId").val($(this).attr('id'));
                    $("#ParentName").val($(this).find('span').html());
                    $("#div_treeshow").hide();
                })
            })
        }
        //主负责人自动补全
        function ManagerAutocomplete() {
            $("#Manager").bind("keyup", function (e) {
                if (e.which != 13 && e.which != 40 && e.which != 38) {
                    var parm = "action=autocomplete&search=" + escape($(this).val());
                    LoadManager(parm);
                }
            }).focus(function () {
                var parm = "action=autocomplete&search=" + escape($(this).val());
                LoadManager(parm);
                $(this).select();
            });
            function LoadManager(parm) {
                getAjax('../Employee/EmployeeList.aspx', parm, function (data) {
                    var json = eval("(" + data + ")");
                    var html = "";
                    for (var i = 0; i < json.JSON.length; i++) {
                        var list = json.JSON[i];
                        html += "<tr>";
                        html += '<td style="width: 80px;">' + list.Code + '</td>';
                        html += '<td style="width: 130px;">' + list.RealName + '</td>';
                        html += "</tr>";
                    }
                    //点击事件回调
                    autocomplete("Manager", "200px", "220px", html, function (r) {
                        var array = new Array();
                        array = r.split('≌');
                        $("#Manager").val(array[1]);
                    });
                });
            }
            //上，下键盘回调
            autocompletekeydown("Manager", function (r) {
                var array = new Array();
                array = r.split('≌');
                $("#Manager").val(array[1]);
            });
        }
        //副负责人自动补全
        function AssistantManagerAutocomplete() {
            $("#AssistantManager").bind("keyup", function (e) {
                if (e.which != 13 && e.which != 40 && e.which != 38) {
                    var parm = "action=autocomplete&search=" + escape($(this).val());
                    LoadManager(parm);
                }
            }).focus(function () {
                var parm = "action=autocomplete&search=" + escape($(this).val());
                LoadManager(parm);
                $(this).select();
            });
            function LoadManager(parm) {
                getAjax('../Employee/EmployeeList.aspx', parm, function (data) {
                    var json = eval("(" + data + ")");
                    var html = "";
                    for (var i = 0; i < json.JSON.length; i++) {
                        var list = json.JSON[i];
                        html += "<tr>";
                        html += '<td style="width: 80px;">' + list.Code + '</td>';
                        html += '<td style="width: 130px;">' + list.RealName + '</td>';
                        html += "</tr>";
                    }
                    //点击事件回调
                    autocomplete("AssistantManager", "200px", "220px", html, function (r) {
                        var array = new Array();
                        array = r.split('≌');
                        $("#AssistantManager").val(array[1]);
                    });
                });
            }
            //上，下键盘回调
            autocompletekeydown("AssistantManager", function (r) {
                var array = new Array();
                array = r.split('≌');
                $("#AssistantManager").val(array[1]);
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" class="niceform">
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>编号：
                </th>
                <td>
                    <input id="Code" maxlength="50" runat="server" type="text" class="txt" datacol="yes" err="编号" checkexpession="NotNull" style="width: 220px" />
                </td>
                <th>名称：
                </th>
                <td>
                    <input id="FullName" maxlength="50" runat="server" type="text" class="txt" datacol="yes" err="名称" checkexpession="NotNull" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>简称：
                </th>
                <td>
                    <input id="ShortName" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                </td>
                <th>上级节点：
                </th>
                <td>
                    <input id="ParentId" type="hidden" runat="server" />
                    <input id="ParentName" runat="server" type="text" class="txt" datacol="yes" err="上级节点"
                        checkexpession="NotNull" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>分类：
                </th>
                <td>
                    <select id="Category" class="select" runat="server" datacol="yes" err="分类" checkexpession="NotNull" style="width: 226px">
                        <option value="">请选择分类</option>
                        <option value="集团">集团</option>
                        <option value="公司">公司</option>
                        <option value="部门">部门</option>
                        <option value="工作组">工作组</option>
                    </select>
                </td>
                <th>主负责人：
                </th>
                <td>
                    <input id="Manager" maxlength="50" runat="server" class="txt" type="text" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>副负责人：
                </th>
                <td>
                    <input id="AssistantManager" maxlength="50" runat="server" class="txt" type="text" style="width: 220px" />
                </td>
                <th>电话：
                </th>
                <td>
                    <input id="OuterPhone" maxlength="50" runat="server" class="txt" type="text" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>内线：
                </th>
                <td>
                    <input id="InnerPhone" maxlength="50" runat="server" class="txt" type="text" style="width: 220px" />
                </td>
                <th>传真：
                </th>
                <td>
                    <input id="Fax" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>邮编：
                </th>
                <td>
                    <input id="Postalcode" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                </td>
                <th>网址：
                </th>
                <td>
                    <input id="Web" maxlength="200" runat="server" type="text" class="txt" style="width: 220px" />
                </td>
            </tr>
            <tr>
                <th>地址：
                </th>
                <td colspan="3">
                    <input id="Address" maxlength="200" runat="server" type="text" class="txt" style="width: 595px" />
                </td>
            </tr>
            <tr>
                <th>有效：
                </th>
                <td colspan="3">
                    <span class="item">
                        <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="Enabled" style="vertical-align: middle;">有效</label>
                        &nbsp;&nbsp;
                    </span>
                    <span class="item">
                        <input id="IsInnerOrganize" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="IsInnerOrganize" style="vertical-align: middle;">内部组织</label>
                        &nbsp;&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
                <th>说明：
                </th>
                <td colspan="3">
                    <textarea id="Description" maxlength="200" runat="server" type="text" class="txtArea" rows="8" style="width: 595px"></textarea>
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return CheckDataValid('#form1');" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
