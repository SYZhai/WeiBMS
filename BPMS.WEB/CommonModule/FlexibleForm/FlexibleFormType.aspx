<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlexibleFormType.aspx.cs" Inherits="BPMS.WEB.CommonModule.FlexibleForm.FlexibleFormType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>业务类别</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js"></script>
    <script src="/Themes/Scripts/TreeView/jquery.cookie.js"></script>
    <link href="/Themes/Scripts/TreeView/jquery.treeview.css" rel="stylesheet" />
    <script src="/Themes/Scripts/TreeView/jquery.treeview.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js"></script>
    <script>
        $(function () {
            divresize('.div-body', 30);
            treeAttrCss();
            GetClickValue();
        })
        //初始化
        var ParentId, FullName = '';
        function GetClickValue() {
            ParentId = $('.collapsableselected').attr('id');
            FullName = $('.collapsableselected').find('span').html();
            var path = 'FlexibleFormList.aspx?ParentId=' + ParentId + '&TypeName=' + escape(FullName);
            window.parent.frames["target_right"].location = path;
            Loading(true);

            $(".strTree li div").click(function () {
                ParentId = $(this).attr('id');
                FullName = $(this).find('span').html();
                var path = 'FlexibleFormList.aspx?ParentId=' + ParentId + '&TypeName=' + escape(FullName);
                window.parent.frames["target_right"].location = path;
                Loading(true);
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                业务类别
            </div>
        </div>
        <div class="line"></div>
        <div class="div-body">
            <ul class="black strTree">

                <li>
                    <div>
                        <img src='/Themes/images/16/asterisk_orange.png' style='vertical-align: middle;' alt='' />业务类别
                    </div>
                    <ul>
                        <%=strHtml %>
                    </ul>
                </li>
            </ul>
        </div>
    </form>
</body>
</html>
