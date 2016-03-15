<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="BPMS.WEB.ErrorPage.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>您所访问的网页无法显示</title>
    <style type="text/css">
        body {
            background-color: #F7F7F7;
        }

        .not-support-browser {
            background-color: #FFFFFF;
            border: 1px solid #CED0D3;
            border-radius: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            width: 650px;
            height: 350px;
            margin: 100px auto;
            padding: 0px;
        }

        .Learun-logo {
            background-color: #333;
        }

        .not-support-browser-contant {
            color: #666666;
            font-size: 18px;
            margin: 35px 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 内容区 -->
        <div class="not-support-browser">
            <div class="not-support-browser-contant">
                <div style="text-align: center;">
                    <h1 style="font-size: 44px">您所访问的页面无法显示</h1>
                </div>
                <p>
                    <asp:Label ID="LblErrorInfo" size="5" face="黑体" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
