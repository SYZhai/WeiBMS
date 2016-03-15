<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.Employee.EmployeeForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>员工、职员表单</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="../../Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        $(function () {
            divresize('.ScrollBar', 90);
            LoadBindDrop();
        })
        //绑定下拉框，公司，部门，工作组bigen
        var datajson = "";
        function LoadBindDrop() {
            $("#CompanyId").append("<option value=''>" + "==请选择==" + "</option>");
            $("#DepartmentId").append("<option value=''>" + "==请选择==" + "</option>");
            $("#WorkgroupId").append("<option value=''>" + "==请选择==" + "</option>");
            getAjax("../Organize/OrganizeList.aspx", "action=LoadBindDrop", function (data) {
                datajson = eval("(" + data + ")");
                $.each(datajson, function (i) {
                    if (datajson[i].Category == '公司') {
                        $("#CompanyId").append($("<option></option>").val(datajson[i].OrganizationId).html(datajson[i].FullName));
                    }
                });
            })
            if (IsNullOrEmpty(GetQuery('key'))) {
                var hiddenCompanyId = $("#hiddenCompanyId").val();
                $("#CompanyId").val(hiddenCompanyId);
                CompanyClick("CompanyId");
            }
        }
        function CompanyClick(id) {
            $("#DepartmentId").empty();
            $("#DepartmentId").append("<option value=''>" + "==请选择==" + "</option>");
            $.each(datajson, function (i) {
                if (datajson[i].ParentId == $('#' + id).val()) {
                    $("#DepartmentId").append("<option value='" + datajson[i].OrganizationId + "'>" + datajson[i].FullName + "</option>");
                }
            });
            if (IsNullOrEmpty(GetQuery('key'))) {
                var hiddenDepartmentId = $("#hiddenDepartmentId").val();
                $("#DepartmentId").val(hiddenDepartmentId);
                DepartmentClick("DepartmentId");
            }
        }
        function DepartmentClick(id) {
            $("#WorkgroupId").empty();
            $("#WorkgroupId").append("<option value=''>" + "==请选择==" + "</option>");
            $.each(datajson, function (i) {
                if (datajson[i].ParentId == $('#' + id).val()) {
                    $("#WorkgroupId").append("<option value='" + datajson[i].OrganizationId + "'>" + datajson[i].FullName + "</option>");
                }
            });
            if (IsNullOrEmpty(GetQuery('key'))) {
                var hiddenWorkgroupId = $("#hiddenWorkgroupId").val();
                $("#WorkgroupId").val(hiddenWorkgroupId);
            }
        }
        //绑定下拉框，公司，部门，工作组end

        //保存事件
        function CommitSave() {
            if (!CheckDataValid('#form1')) {
                return false;
            }
            $("#hiddenCompanyId").val($("#CompanyId").val());
            $("#hiddenDepartmentId").val($("#DepartmentId").val());
            $("#hiddenWorkgroupId").val($("#WorkgroupId").val());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="hiddenCompanyId" type="hidden" runat="server" />
        <input id="hiddenDepartmentId" type="hidden" runat="server" />
        <input id="hiddenWorkgroupId" type="hidden" runat="server" />
        <div class="bd">
            <div class="tipstitle_title settingtable bold bd todayInfoPanelTab rightPanelTitle_normal">
                <div class="tab_list_top" style="position: absolute">
                    <div id="basicTab" class="tab_list bd actived" onclick="Tabchange('tb_basic')">基本信息</div>
                    <div id="workTab" class="tab_list bd " onclick="Tabchange('tb_work')">工作相关</div>
                    <div id="homeTab" class="tab_list bd " onclick="Tabchange('tb_home')">家庭相关</div>
                    <div id="formTab" class="tab_list bd " onclick="Tabchange('tb_custom')">自定义相关</div>
                </div>
            </div>
            <div class="ScrollBar">
                <br />
                <div id="tb_basic" class="tabPanel">
                    <table border="0" cellpadding="0" cellspacing="0" class="frm">
                        <tr>
                            <th>姓名：</th>
                            <td>
                                <input id="RealName" maxlength="50" runat="server" type="text" datacol="yes" err="姓名" checkexpession="NotNull" class="txt" style="width: 220px" />
                            </td>
                            <th>工号：</th>
                            <td>
                                <input id="Code" maxlength="50" runat="server" type="text" datacol="yes" err="编号,工号" checkexpession="NotNull" class="txt" style="width: 220px" />
                            </td>
                        </tr>
                        <tr>
                            <th>性别：</th>
                            <td>
                                <select id="Gender" runat="server" class="select" style="width: 226px">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </td>
                            <th>公司：
                            </th>
                            <td>
                                <select id="CompanyId" onchange="CompanyClick(this.id)" runat="server" class="select" datacol="yes" err="公司" checkexpession="NotNull" style="width: 227px">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>部门名称：
                            </th>
                            <td>
                                <select id="DepartmentId" onchange="DepartmentClick(this.id)" runat="server" class="select" datacol="yes" err="部门名称" checkexpession="NotNull" style="width: 227px">
                                </select>
                            </td>
                            <th>工作组名称：
                            </th>
                            <td>
                                <select id="WorkgroupId" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>出生日期：</th>
                            <td>
                                <input id="Birthday" maxlength="23" onfocus="WdatePicker()" class="txt Wdate" runat="server" type="text" style="width: 220px" />
                            </td>
                            <th>年龄：</th>
                            <td>
                                <input id="Age" maxlength="3" runat="server" type="text" class="txt" datacol="yes" err="年龄"
                                    checkexpession="Num" onfocus="Keypress(this.id)" style="width: 220px" />
                            </td>
                        </tr>
                        <tr>
                            <th>所学专业：</th>
                            <td>
                                <input id="Major" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                            <th>毕业院校： </th>
                            <td>
                                <input id="School" maxlength="200" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                        </tr>
                        <tr>

                            <th>最高学历：</th>
                            <td>
                                <select id="Education" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                            <th>最高学位：</th>
                            <td>
                                <select id="Degree" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>职称：</th>
                            <td>
                                <select id="TitleId" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                            <th>职称等级： </th>
                            <td>
                                <select id="TitleLevel" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>职称评期：</th>
                            <td>
                                <input id="Text1" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                            <th>有效：</th>
                            <td>
                                <span class="item">
                                    <input id="Enabled" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                                    <label for="Enabled" style="vertical-align: middle;">有效</label>
                                    &nbsp;&nbsp;
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th>描述：</th>
                            <td colspan="3">
                                <textarea id="Description" maxlength="200" runat="server" type="text" class="txtArea" rows="5" style="width: 594px"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>

                <div id="tb_work" class="tabPanel" style="display: none;">
                    <table border="0" cellpadding="0" cellspacing="0" class="frm">
                        <tr>
                            <th>职位：</th>
                            <td>
                                <select id="DutyId" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                            <th>用工性质：</th>
                            <td>
                                <select id="WorkingProperty" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>身份证号码：</th>
                            <td>
                                <input id="IDCard" maxlength="18" runat="server" type="text" class="txt" datacol="yes" err="身份证号码" checkexpession="IDCardOrNull" style="width: 220px" />
                            </td>
                            <th>工资卡：</th>
                            <td>
                                <input id="BankCode" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                        </tr>
                        <tr>
                            <th>加入单位：</th>
                            <td>
                                <input id="JoinInDate" onfocus="WdatePicker()" class="txt Wdate" runat="server" type="text" style="width: 220px" />
                            </td>
                            <th>电子邮件：</th>
                            <td>
                                <input id="Email" maxlength="50" runat="server" type="text" datacol="yes" err="电子邮件" checkexpession="isEmailOrNull" class="txt" style="width: 220px" />
                            </td>
                        </tr>
                        <tr>
                            <th>QQ号码：</th>
                            <td>
                                <input id="OICQ" maxlength="15" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                            <th>手机：</th>
                            <td>
                                <input id="Mobile" maxlength="11" runat="server" type="text" class="txt" datacol="yes" err="手机" checkexpession="MobileOrNull" style="width: 220px" />
                            </td>

                        </tr>
                        <tr>
                            <th>短号：</th>
                            <td>
                                <input id="ShortNumber" maxlength="10" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                            <th>办公邮编：</th>
                            <td>
                                <input id="OfficeZipCode" maxlength="6" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>

                        </tr>
                        <tr>
                            <th>办公电话：</th>
                            <td>
                                <input id="OfficePhone" maxlength="15" runat="server" type="text" class="txt" datacol="yes" err="办公电话" checkexpession="PhoneOrNull"  style="width: 220px" />
                            </td>
                            <th>办公传真：</th>
                            <td>
                                <input id="OfficeFax" maxlength="15" runat="server" type="text" class="txt" datacol="yes" err="办公传真" checkexpession="PhoneOrNull" style="width: 220px" />
                            </td>
                        </tr>
                        <tr>
                            <th>办公地址：</th>
                            <td colspan="3">
                                <input id="OfficeAddress" maxlength="200" runat="server" type="text" class="txt" style="width: 594px" />
                            </td>
                        </tr>
                        <tr>
                            <th>是否离职：</th>
                            <td colspan="3">
                                <span class="item">
                                    <input id="IsDimission" type="checkbox" runat="server" checked="checked" style="vertical-align: middle;" />
                                    <label for="IsDimission" style="vertical-align: middle;">离职</label>
                                    &nbsp;&nbsp; 
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th>离职日期：</th>
                            <td>
                                <input id="DimissionDate" onfocus="WdatePicker()" class="txt Wdate" runat="server" type="text" style="width: 220px" />
                            </td>
                            <th>离职去向：</th>
                            <td>
                                <input id="DimissionWhither" maxlength="200" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                        </tr>
                        <tr>
                            <th>离职原因：</th>
                            <td colspan="3">
                                <input id="DimissionCause" maxlength="200" runat="server" type="text" class="txt" style="width: 594px" />
                            </td>
                        </tr>
                    </table>
                </div>

                <div id="tb_home" class="tabPanel" style="display: none;">
                    <table border="0" cellpadding="0" cellspacing="0" class="frm">
                        <tr>
                            <th>籍贯：</th>
                            <td>
                                <input id="NativePlace" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                            <th>家庭邮编：</th>
                            <td>
                                <input id="HomeZipCode" maxlength="6" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                        </tr>
                        <tr>
                            <th>家庭传真：</th>
                            <td>
                                <input id="HomeFax" maxlength="15" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                            <th>政治面貌：</th>
                            <td>
                                <select id="Party" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>国籍：</th>
                            <td>
                                <select id="Nation" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                            <th>民族：</th>
                            <td>
                                <select id="Nationality" runat="server" class="select" style="width: 227px">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>住宅电话：</th>
                            <td>
                                <input id="HomePhone" maxlength="15" runat="server" type="text" class="txt" datacol="yes" err="住宅电话" checkexpession="PhoneOrNull" style="width: 220px" />
                            </td>
                            <th>紧急联系：</th>
                            <td>
                                <input id="EmergencyContact" maxlength="50" runat="server" type="text" class="txt" style="width: 220px" />
                            </td>
                        </tr>
                        <tr>
                            <th>家庭住址：</th>
                            <td colspan="3">
                                <input id="HomeAddress" maxlength="200" runat="server" type="text" class="txt" style="width: 594px" />
                            </td>
                        </tr>
                        <tr>
                        </tr>
                    </table>
                </div>

                <div id="tb_custom" class="tabPanel" style="display: none;">
                    自定义相关
                </div>
            </div>
        </div>

        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return CommitSave();" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
