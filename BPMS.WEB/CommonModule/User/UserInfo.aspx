<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="BPMS.WEB.CommonModule.User.UserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>查看用户详细信息</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/TreeTable/jquery.treeTable.js" type="text/javascript"></script>
    <link href="/Themes/Scripts/TreeTable/css/jquery.treeTable.css" rel="stylesheet"
        type="text/css" />
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script>
        $(function () {
            divresize('.ScrollBar', 78);
            $("#RoleList").treeTable({
                initialState: "expanded" //collapsed 收缩 expanded展开的
            });
            $("#PermissionTree").treeTable({
                initialState: "expanded" //collapsed 收缩 expanded展开的
            });
            $(".tabPanel").hide();
            $("#tb_basic").show();
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="WarmPrompt-Info">
            <img src="/Themes/Images/<%=imgGender %>" style="width: 38px; height: 38px;vertical-align: middle; margin-bottom:5px;" />
             <%=strUserInfo %>
        </div>
        <div class="bd">
            <div class="tipstitle_title settingtable bold bd todayInfoPanelTab rightPanelTitle_normal">
                <div class="tab_list_top" style="position: absolute">
                    <div class="tab_list bd actived" onclick="Tabchange('tb_basic')">基本信息</div>
                    <div class="tab_list bd " onclick="Tabchange('RoleList')">拥有角色</div>
                    <div class="tab_list bd " onclick="Tabchange('PermissionTree')">拥有权限</div>
                </div>
            </div>
            <div class="ScrollBar">
                <table id="tb_basic" border="0" cellpadding="0" cellspacing="0" class="frm tabPanel" style=" margin-top:1px; border-top: 1px solid #ccc;">
                    <tr>
                        <th class="highlight">编号：
                        </th>
                        <td>
                            <asp:Label ID="Code" runat="server" Text=""></asp:Label>
                        </td>
                        <th class="highlight">登录账户：
                        </th>
                        <td>
                            <asp:Label ID="Account" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="highlight">姓名：
                        </th>
                        <td>
                            <asp:Label ID="RealName" runat="server" Text=""></asp:Label>
                        </td>
                        <th class="highlight">登录密码：
                        </th>
                        <td>
                            <asp:Label ID="Password" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="highlight">性别：
                        </th>
                        <td>
                            <asp:Label ID="Gender" runat="server" Text=""></asp:Label>
                        </td>
                        <th class="highlight">手机号码：
                        </th>
                        <td>
                            <asp:Label ID="Mobile" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="highlight">出生日期：
                        </th>
                        <td>
                            <asp:Label ID="Birthday" runat="server" Text=""></asp:Label>
                        </td>
                        <th class="highlight">固定电话：
                        </th>
                        <td>
                            <asp:Label ID="Telephone" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="highlight">职位：
                        </th>
                        <td>
                            <asp:Label ID="DutyId" runat="server" Text=""></asp:Label>
                        </td>
                        <th class="highlight">QQ号码：
                        </th>
                        <td>
                            <asp:Label ID="OICQ" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="highlight">职称：
                        </th>
                        <td>
                            <asp:Label ID="TitleId" runat="server" Text=""></asp:Label>
                        </td>

                        <th class="highlight">电子邮件：
                        </th>
                        <td>
                            <asp:Label ID="Email" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>

                        <th class="highlight">公司：
                        </th>
                        <td>
                            <asp:Label ID="CompanyId" runat="server" Text=""></asp:Label>
                        </td>
                        <th class="highlight">默认角色：
                        </th>
                        <td>
                            <asp:Label ID="RoleId" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="highlight">部门名称：
                        </th>
                        <td>
                            <asp:Label ID="DepartmentId" runat="server" Text=""></asp:Label>
                        </td>
                        <th class="highlight">工作组名称：
                        </th>
                        <td>
                            <asp:Label ID="WorkgroupId" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="highlight">有效性：
                        </th>
                        <td colspan="3">
                            <asp:Label ID="Enabled" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="highlight">说明：
                        </th>
                        <td colspan="3">
                            <asp:Label ID="Description" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>

                <table class="example tabPanel" id="RoleList">
                    <thead>
                        <tr>
                            <td style="width: 200px;">角色名称
                            </td>
                            <td style="width: 100px; text-align: center;">编号
                            </td>
                            <td style="width: 100px; text-align: center;">角色分类
                            </td>
                            <td>说明
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <%=sb_RoleList.ToString()%>
                    </tbody>
                </table>

                <table class="example tabPanel" id="PermissionTree">
                    <thead>
                        <tr>
                            <td style="width: 230px; padding-left: 20px;">模块(菜单)名称
                            </td>
                            <td>说明
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <%=PermissionTree.ToString()%>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
