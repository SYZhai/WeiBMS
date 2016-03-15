<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IAuthorizationForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.InterfaceManage.IAuthorizationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统接口访问授权-表单</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        $(function () {
            UserNameAutocomplete();
            if (GetQuery('key')) {
                var array = $('#AuthorizationCode').val().split(';');
                for (var i = 0; i < array.length; i++) {
                    var Key_Value = array[i].split(':');
                    var Key = Key_Value[0];
                    var Value = Key_Value[1];
                    if (Value == "true") {
                        $("#" + Key).attr('checked', 'checked');
                    } else {
                        $("#" + Key).removeAttr('checked');
                    }
                }
            }
        })
        //授权用户自动补全
        function UserNameAutocomplete() {
            $("#AuthorizationUserName").bind("keyup", function (e) {
                if (e.which != 13 && e.which != 40 && e.which != 38) {
                    var parm = "action=autocomplete&search=" + escape($(this).val());
                    LoadUserName(parm);
                }
            }).focus(function () {
                var parm = "action=autocomplete&search=" + escape($(this).val());
                LoadUserName(parm);
                $(this).select();
            });
            function LoadUserName(parm) {
                getAjax('../User/UserList.aspx', parm, function (data) {
                    var json = eval("(" + data + ")");
                    var html = "";
                    for (var i = 0; i < json.JSON.length; i++) {
                        var list = json.JSON[i];
                        html += "<tr>";
                        html += '<td style="display:none">' + list.UserId + '</td>';
                        html += '<td style="width: 80px;">' + list.Code + '</td>';
                        html += '<td style="width: 130px;">' + list.RealName + '</td>';
                        html += "</tr>";
                    }
                    //点击事件回调
                    autocomplete("AuthorizationUserName", "200px", "220px", html, function (r) {
                        var array = new Array();
                        array = r.split('≌');
                        $("#AuthorizationUserId").val(array[0]);
                        $("#AuthorizationUserName").val(array[2] + "|" + array[1]);
                    });
                });
            }
            //上，下键盘回调
            autocompletekeydown("AuthorizationUserName", function (r) {
                var array = new Array();
                array = r.split('≌');
                $("#AuthorizationUserId").val(array[0]);
                $("#AuthorizationUserName").val(array[2] + "|" + array[1]);
            });
        }
        //保存事件
        function Commit_Save() {
            if (!CheckDataValid('#form1')) {
                return false;
            }
            if ($("#AuthorizationUserId").val() == "") {
                ChangeCss("#AuthorizationUserName", "授权用户");
                return false;
            }
            var Key_Value = "";
            $("#authorizationmodule").find("input").each(function () {
                var pk_id = $(this).attr('id');
                var pk_value = $("#" + pk_id).attr("checked");
                if (pk_value == 'checked') {
                    pk_value = true
                } else {
                    pk_value = false;
                }
                Key_Value += pk_id + ":" + pk_value + ";";
            });
            $("#AuthorizationCode").val(Key_Value);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="AuthorizationCode" type="hidden" runat="server" />
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>编号：
                </th>
                <td>
                    <input id="Code" maxlength="50" runat="server" type="text" class="txt" datacol="yes" err="编号" checkexpession="NotNull" style="width: 290px" />
                </td>
            </tr>
            <tr>
                <th>授权用户：
                </th>
                <td>
                    <input id="AuthorizationUserId" type="hidden" runat="server" />
                    <input id="AuthorizationUserName" maxlength="50" runat="server" type="text" class="txt" style="width: 290px" />
                </td>
            </tr>
            <tr>
                <th>授权模块：
                </th>
                <td>
                    <div id="authorizationmodule">
                        <span class="item">
                            <input id="Authority" type="checkbox" style="vertical-align: middle;" />
                            <label for="Authority" style="vertical-align: middle;">权限接口</label>
                            &nbsp;&nbsp;
                    </span>
                        <span class="item">
                            <input id="Workflow" type="checkbox" style="vertical-align: middle;" />
                            <label for="Workflow" style="vertical-align: middle;">工作流接口</label>
                            &nbsp;&nbsp;
                    </span>
                        <span class="item">
                            <input id="DataSwap" type="checkbox" style="vertical-align: middle;" />
                            <label for="DataSwap" style="vertical-align: middle;">数据交换接口</label>
                            &nbsp;&nbsp;
                    </span>
                    </div>
                </td>
            </tr>
            <tr>
                <th>生效日期：
                </th>
                <td>
                    <input id="StartDate" maxlength="23" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 00:00' })" class="txt" datacol="yes" err="生效日期" checkexpession="NotNull" runat="server" type="text" style="width: 290px" />
                </td>
            </tr>
            <tr>
                <th>过期日期：
                </th>
                <td>
                    <input id="EndDate" maxlength="23" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 23:59' })" class="txt" datacol="yes" err="过期日期" checkexpession="NotNull" runat="server" type="text" style="width: 290px" />
                </td>
            </tr>
            <tr>
                <th>有效：
                </th>
                <td>
                    <span class="item">
                        <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                        <label for="Enabled" style="vertical-align: middle;">有效</label>
                        &nbsp;&nbsp;
                    </span>
                </td>
            </tr>

            <tr>
                <th>描述：
                </th>
                <td>
                    <textarea id="Description" maxlength="200" runat="server" class="txtArea" type="text" style="width: 296px; height: 70px;"></textarea>
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return Commit_Save();" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
