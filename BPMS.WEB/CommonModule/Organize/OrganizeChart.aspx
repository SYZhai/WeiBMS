<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizeChart.aspx.cs" Inherits="BPMS.WEB.CommonModule.Organize.OrganizeChart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>组织架构图</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/OrgChart.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="zz">
            <script language="javascript">
                <%=strHtml_OrgChart %>;
                var OrgShows = new OrgShow(v05e8569314b0458280638fbde85371f0);
                OrgShows.Top = 10;
                OrgShows.Left = 10;
                OrgShows.IntervalWidth = 5;
                OrgShows.IntervalHeight = 50;
                OrgShows.ShowType = 1;
                OrgShows.BoxHeight = 50;
                OrgShows.LineSize = 3;  //设置线条大小
                OrgShows.LineColor = "#ccc";  //设置线条颜色
                OrgShows.Run();
            </script>
        </div>
    </form>
</body>
</html>


