<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleConfigMovable.aspx.cs" Inherits="BPMS.WEB.CommonModule.Module.ModuleConfigMovable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>模块(菜单)布局</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script>
        //确认
        function SaveForm() {
            //己选择字段
            var item_value = '';
            $("#search_fields_to_sel option").each(function (r) {
                item_value += $(this).val() + '≌';
            });
            $("#hidden_allInfo").val(item_value);//己选择字段赋值隐藏域
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="hidden_allInfo" type="hidden" runat="server" />
        <br />
        <table style="border-collapse: collapse" cellspacing="0" cellpadding="0" height="300">
            <tbody>
                <tr>
                    <td>
                        <div style="width: 245px; height: 300px">
                            <table style="border-collapse: collapse" cellspacing="0" cellpadding="0" width="245" align="center" height="300">
                                <tbody>
                                    <tr>
                                        <td>
                                            <div style="float: right" class="movableSelContainer">
                                                <div style="line-height: 30px; width: 183px; height: 30px" class="title"><b>未选择字段</b></div>
                                                <div style="width: 183px; height: 235px">
                                                    <table style="border-collapse: collapse" width="100%" height="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td width="100%">
                                                                    <select style="width: 175px; height: 230px" id="search_fields_from_sel" class="select" multiple runat="server">
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="allBar">
                                                    <input id="search_fields_from_selAllBtn" class="btn" onclick="selAll('search_fields_from_sel')" value="全选" type="button" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                    <td class="movableCenter" width="60" align="center">
                        <span style="display: block">
                            <input id="search_fields_to_leftBtn" class="btn" onclick="moveSelOp('search_fields_from_sel', 'search_fields_to_sel')" value=">>左移" type="button" /></span><br />
                        <span style="display: block">
                            <input id="search_fields_to_rightBtn" class="btn" onclick="moveSelOp('search_fields_to_sel', 'search_fields_from_sel')" value="<<右移" type="button"></span><br />
                    </td>
                    <td>
                        <div style="width: 245px; height: 300px" id="search_fields_to">
                            <table style="border-collapse: collapse" cellspacing="0" cellpadding="0" width="245" align="center" height="300">
                                <tbody>
                                    <tr>
                                        <td>
                                            <div style="float: left" class="movableSelContainer">
                                                <div style="line-height: 30px; width: 183px; height: 30px" class="title"><b>己选择字段</b></div>
                                                <div style="width: 183px; height: 235px">
                                                    <table style="border-collapse: collapse" width="100%" height="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <select id="search_fields_to_sel" class="select" style="width: 175px; height: 230px;" multiple="" runat="server">
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="allBar">
                                                    <input id="search_fields_to_selAllBtn" class="btn" onclick="selAll('search_fields_to_sel')" value="全选" type="button" />
                                                </div>
                                            </div>
                                        </td>

                                        <td align="center">
                                            <span style="display: block">
                                                <input id="search_fields_to_topBtn" class="btn" onclick="moveTop('search_fields_to_sel')" name="search_fields_to_topBtn" value="置顶" type="button" /></span><br />
                                            <span style="display: block">
                                                <input id="search_fields_to_upBtn" class="btn" onclick="moveUp('search_fields_to_sel')" name="search_fields_to_upBtn" value="上移" type="button" /></span><br />
                                            <span style="display: block">
                                                <input id="search_fields_to_downBtn" class="btn" onclick="moveDown('search_fields_to_sel')" name="search_fields_to_downBtn" value="下移" type="button" /></span><br />
                                            <span style="display: block">
                                                <input id="search_fields_to_bottomBtn" class="btn" onclick="moveBottom('search_fields_to_sel')" name="search_fields_to_bottomBtn" value="置底" type="button" /></span>
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Accept" runat="server" class="l-btn" OnClientClick="return SaveForm();" OnClick="Accept_Click"><span class="l-btn-left">
            <img src="/Themes/Images/16/accept.png" alt="" />确 认</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/16/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>
