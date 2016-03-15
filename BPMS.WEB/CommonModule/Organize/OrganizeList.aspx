<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizeList.aspx.cs" Inherits="BPMS.WEB.CommonModule.Organize.OrganizeList" %>

<%@ Register Src="~/UserControl/LoadButton.ascx" TagPrefix="uc1" TagName="LoadButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>组织机构列表</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/TreeTable/jquery.treeTable.js" type="text/javascript"></script>
    <link href="/Themes/Scripts/TreeTable/css/jquery.treeTable.css" rel="stylesheet"
        type="text/css" />
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script>
        $(function () {
            divresize('.ScrollBar', 84);
            $("#div_OrgChart").height($(window).height() - 83).width('3000px').hide();
            LoadOrgList();
            GetClickTableValue();
        })
        //加载组织结构列表
        function LoadOrgList() {
            getAjax("OrganizeList.aspx", "action=OrgTreeList", function (data) {
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
        var OrganizationId = '';
        var OrganizationName = '';
        function GetClickTableValue() {
            $('#dnd-example tbody tr').not('#td').click(function () {
                $(this).find('td').each(function (i) {
                    if (i == 0) {
                        OrganizationName = $(this).text();
                    }
                    if (i == 9) {
                        OrganizationId = $(this).text();
                    }
                });
            });
        }
        //新增
        function add() {
            var url = "/CommonModule/Organize/OrganizeForm.aspx?ParentId=" + OrganizationId + '&ParentName=' + escape(OrganizationName);
            top.openDialog(url, 'OrganizeForm', '组织机构 - 添加', 750, 430, 50, 50);
        }
        //编辑
        function edit() {
            if (IsEditdata(OrganizationId)) {
                var url = "/CommonModule/Organize/OrganizeForm.aspx?key=" + OrganizationId;
                top.openDialog(url, 'OrganizeForm', '组织机构 - 编辑', 750, 430, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = OrganizationId;
            if (IsDelData(key)) {
                var delparm = 'action=Delete&key=' + key;
                delConfig('OrganizeList.aspx', delparm);
            }
        }
        //刷新
        function windowload() {
            LoadOrgList();
            OrganizationId = '';
            OrganizationName = '';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:LoadButton runat="server" ID="LoadButton" />
        <div class="bd" style="margin-top: 1px;">
            <div class="rightPanelTitle_normal tipstitle_title settingtable bold bd todayInfoPanelTab">
                <div class="tab_list_top" style="position: absolute">
                    <div id="OrgTreeTab" class="tab_list bd actived" onclick="$('#dnd-example').show();$('#div_OrgChart').hide();">组织架构表</div>
                    <div id="OrgTreechartTab" class="tab_list bd " onclick="$('#div_OrgChart').show();$('#dnd-example').hide(); $('#iframe_OrgChart').attr('src', 'OrganizeChart.aspx');">组织架构图</div>
                </div>
            </div>
            <div class="ScrollBar">
                <table class="example" id="dnd-example">
                    <thead>
                        <tr>
                            <td style="width: 230px; padding-left: 20px;">组织机构名称
                            </td>
                            <td style="width: 130px;">编码
                            </td>
                            <td style="width: 60px; text-align: center;">分类
                            </td>
                            <td style="width: 120px; text-align: center;">简称
                            </td>
                            <td style="width: 100px; text-align: center;">主负责人
                            </td>
                            <td style="width: 100px; text-align: center;">电话
                            </td>
                            <td style="width: 100px; text-align: center;">传真
                            </td>
                            <td style="width: 60px; text-align: center;">有效
                            </td>
                            <td>说明
                            </td>
                        </tr>
                    </thead>
                    <tbody id="TableTree">
                    </tbody>
                </table>
                <div id="div_OrgChart">
                    <iframe id="iframe_OrgChart" name="iframe_OrgChart" src="" scrolling="auto" frameborder="0" scrolling="yes"
                        width="100%" height="100%"></iframe>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
