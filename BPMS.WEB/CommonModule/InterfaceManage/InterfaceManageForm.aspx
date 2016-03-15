<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterfaceManageForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.InterfaceManage.InterfaceManageForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>动态接口配置表单</title>
    <link href="/Themes/Styles/Style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        //初始化
        $(function () {
            divresize('.ScrollBar', 353);
            var key = GetQuery('key');
            if (!IsNullOrEmpty(key)) {
                add_ColumnName();
            }
            $("#txtXML").css("height", $(window).height() - 357).css("width", "99.8%")
        })
        //初始化100空行
        function add_ColumnName() {
            for (var i = 1; i < 100; i++) {
                var tr = '<tr>';
                var IsDisabled = "disabled";
                if (i == 1) {
                    IsDisabled = "";
                }
                tr += '<td class="td-div" style="width: 50px; text-align: center;"><div style="padding-left:5px;">' + i + '</div></td>'
                tr += '<td style="width: 250px;"><input ' + IsDisabled + ' dbfield="true" id="Field➩' + i + '"  type="text" class="txt" onkeyup="CheckingInterfaceDetailse(this.id,' + i + ')" /></td>'
                tr += '<td style="width: 100px;"><select ' + IsDisabled + ' dbfield="true" id="FieldType➩' + i + '"  class="txtselect" datacol="No" err="数据类型" checkexpession="NotNull"><option value="">==请选择==</option><option value="字符串">字符串</option><option value="数字">数字</option><option value="日期">日期</option><option value="金额">金额</option></select></td>'
                tr += '<td style="width: 80px;"><input ' + IsDisabled + ' dbfield="true" id="FieldMaxLength➩' + i + '" type="text" class="txt" style="text-align: center;"  datacol="No" err="长度" checkexpession="Num" onkeyup="Keypress(this.id)"/></td>'
                tr += '<td style="width: 80px;text-align: center;"><input ' + IsDisabled + ' dbfield="true" id="FieldMinLength➩' + i + '" type="checkbox" /></td>'
                tr += '<td style="width: 80px;"><input ' + IsDisabled + ' dbfield="true" id="SortCode➩' + i + '" type="text" class="txt" style="text-align: center;" datacol="No" err="显示顺序" checkexpession="Num" value="' + i + '" /></td>'
                tr += '<td style="width: 80px;text-align: center;"><input ' + IsDisabled + ' dbfield="true" id="Enabled➩' + i + '" type="checkbox" checked="checked" /></td>'
                tr += '<td><input ' + IsDisabled + ' dbfield="true" id="FieldMemo➩' + i + '" type="text" class="txt" /></td>'
                tr += '</tr>';
                $(tr).appendTo("#add_Table");
            }
        }
        //验证接口参数表单信息
        function CheckingInterfaceDetailse(obj, No) {
            var index = Number(No) + 1;
            if (IsNullOrEmpty($("#Field➩" + No).val())) {
                $("#Field➩" + index).removeAttr("disabled");
                $("#FieldType➩" + No).removeAttr("disabled").attr("datacol", "yes");        //校验
                $("#FieldMaxLength➩" + No).removeAttr("disabled").attr("datacol", "yes");   //校验
                $("#FieldMinLength➩" + No).removeAttr("disabled");                          //校验
                $("#SortCode➩" + No).removeAttr("disabled");                                //校验
                $("#Enabled➩" + No).removeAttr("disabled");                               //校验
                $("#FieldMemo➩" + No).removeAttr("disabled");                               //校验
            } else {
                $("#Field➩" + index).attr("disabled", "disabled");
                $("#FieldType➩" + No).attr("disabled", "disabled").attr("datacol", "No");         //校验
                $("#FieldMaxLength➩" + No).attr("disabled", "disabled").attr("datacol", "No");    //校验
                $("#FieldMinLength➩" + No).attr("disabled", "disabled");                          //校验
                $("#SortCode➩" + No).attr("disabled", "disabled");                                //校验
                $("#Enabled➩" + No).attr("disabled", "disabled");                               //校验
                $("#FieldMemo➩" + No).attr("disabled", "disabled");                               //校验
            }
        }
        //获取接口信息
        function GetInterfaceFrom() {
            var item_Key_Value = "";
            $("#tb_InterfaceFrom tr td").each(function () {
                var pk_id = $(this).find('input,select,textarea').attr('id');
                var pk_value = $("#" + pk_id).val();
                if (pk_value != "" && pk_value != undefined) {
                    item_Key_Value += pk_id + "☻" + pk_value + "≌";
                }
            });
            return item_Key_Value;
        }
        //获取接口参数明细
        function GetInterfaceDetailsFrom() {
            var item_Key_Value = "";
            var index = 1;
            $("#tb_InterfaceDetailsFrom #add_Table tr").each(function () {
                var IsNull_Code = $("#Field➩" + index).val();
                if (IsNull_Code != "" && $("#Field➩" + index).attr("disabled") != 'disabled') {
                    $(this).find('td').find('[DBField=true]').each(function () {
                        var pk_id = $(this).attr('id');
                        var pk_value = "";
                        if ($("#" + pk_id).attr('type') == "checkbox") {
                            if ($("#" + pk_id).attr("checked")) {
                                pk_value = "true";
                            } else {
                                pk_value = "false";
                            }
                        } else {
                            pk_value = $("#" + pk_id).val();
                        }
                        if (pk_value != "" && pk_value != undefined) {
                            var array = new Array();
                            array = pk_id.split("➩"); //字符分割
                            item_Key_Value += array[0] + "☻" + pk_value + "☺";
                        }
                    })
                    item_Key_Value += "≌";
                }
                index++;
            });
            return item_Key_Value;
        }
        //保存事件
        function CheckValid_Save() {
            if (!CheckDataValid('#form1')) {
                return false;
            }
            var key = GetQuery('key');
            var parm = 'action=AddOrEdit&InterfaceFrom=' + escape(GetInterfaceFrom()) + '&InterfaceDetailsFrom=' + escape(GetInterfaceDetailsFrom()) + '&key=' + key;
            getAjax('InterfaceManageForm.aspx', parm, function (rs) {
                if (parseInt(rs) > 0) {
                    showTipsMsg("操作成功", 2000, 4);
                    Urlhref("InterfaceManageList.aspx");
                } else {
                    showTipsMsg("操作失败，请稍后重试", 4000, 5);
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                接口信息 - 
                <asp:Label ID="LblState" runat="server" Text="【新增】"></asp:Label>
            </div>
        </div>
        <div class="tools_bar">
            <a id="button_Save" title="保存" onclick="CheckValid_Save();" class="tools_btn">
                <span><b style="background: url('/Themes/images/16/disk.png') 50% 4px no-repeat;">保存</b></span>
            </a>
            <a id="button_Back" title="返回" onclick="bntback();" class="tools_btn">
                <span><b style="background: url('/Themes/images/16/back.png') 50% 4px no-repeat;">返回</b></span>
            </a>
        </div>

        <table id="tb_InterfaceFrom" border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th style="width: 80px;">接口编号：
                </th>
                <td>
                    <input id="Code" runat="server" type="text" class="txt" datacol="yes" err="接口编号"
                        checkexpession="NotNull" style="width: 98%" />
                </td>
            </tr>
            <tr>
                <th style="width: 80px;">接口名称：
                </th>
                <td>
                    <input id="FullName" runat="server" type="text" class="txt" datacol="yes" err="接口名称"
                        checkexpession="NotNull" style="width: 98%" />
                </td>
            </tr>
            <tr>
                <th style="width: 80px;">动作类型：
                </th>
                <td>
                    <select id="Type" class="select" runat="server" datacol="yes" err="动作类型"
                        checkexpession="NotNull" style="width: 98.5%">
                        <option value="">==请选择==</option>
                        <option value="0">新增-ExecuteBySql</option>
                        <option value="1">修改-ExecuteBySql</option>
                        <option value="2">删除-ExecuteBySql</option>
                        <option value="3">查询-DataTableBySQL</option>
                        <option value="4">存储过程-DataTableProc</option>
                        <option value="5">存储过程-DataSetProc</option>
                        <option value="6">存储过程-ExecuteByProc</option>
                        <option value="7">存储过程-BatchExecuteByProc</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th style="width: 80px;">是否有效：
                </th>
                <td>
                    <select id="Enabled" class="select" runat="server" style="width: 98.5%">
                        <option value="1">启动</option>
                        <option value="0">停用</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th style="width: 80px;">约束达式：
                </th>
                <td>
                    <textarea id="PermissionConstraint" class="txtArea" runat="server" style="width: 98%; height: 100px;"></textarea>
                </td>
            </tr>
        </table>

        <div class="bd">
            <div class="tipstitle_title settingtable bold bd todayInfoPanelTab rightPanelTitle_normal">
                <div class="tab_list_top" style="position: absolute">
                    <div id="basicTab" class="tab_list bd actived" onclick="$('#tb_InterfaceDetailsFrom').show();$('#divtxt').hide();">视图参数</div>
                    <div id="workTab" class="tab_list bd " onclick="$('#divtxt').show();$('#tb_InterfaceDetailsFrom').hide()">XML格式</div>
                </div>
            </div>
            <div class="ScrollBar">
                <table id="tb_InterfaceDetailsFrom" class="grid" style="margin-top: 1px; width: 100%;">
                    <thead>
                        <tr>
                            <td style="width: 50px; text-align: center;">行号</td>
                            <td style="width: 250px;">参数
                            </td>
                            <td style="width: 100px; text-align: center;">参数类型
                            </td>
                            <td style="width: 80px; text-align: center;">长度
                            </td>
                            <td style="width: 80px; text-align: center;">允许空
                            </td>
                            <td style="width: 80px; text-align: center;">显示顺序
                            </td>
                            <td style="width: 80px; text-align: center;">有效
                            </td>
                            <td>说明
                            </td>
                        </tr>
                    </thead>
                    <tbody id="add_Table">
                             <%=Sb_Table_Out.ToString() %>
                    </tbody>
                </table>
                <div id="divtxt" style="display: none">
                    <textarea id="txtXML" readonly="readonly" runat="server" style="border: 0px solid #A8A8A8;"></textarea>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
