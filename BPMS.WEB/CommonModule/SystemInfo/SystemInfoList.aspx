<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemInfoList.aspx.cs" Inherits="BPMS.WEB.CommonModule.SystemInfo.SystemInfoList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统信息</title>
    <link href="/Themes/Styles/style.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <style>
        .frm {
            border-top: 1px solid #ccc;
             border-right: 1px solid #ccc;
            border-left: 1px solid #ccc;
        }

            .frm th {
                border-bottom: 1px solid #ccc;
                border-right: 1px solid #ccc;
                background-color: #fff;
                height: 27px;
                line-height: 27px;
                white-space: nowrap;
                width: 120px;
                font-weight: bold;
                text-align: left;
                padding-left: 10px;
            }

            .frm td {
                width: auto;
                background-color: #fff;
                height: 27px;
                line-height: 27px;
                border-bottom: 1px solid #ccc;
                padding: 2px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" class="frm" style="width: 800px;" align="center">
            <tr>
                 <td colspan="3" style="text-align: center; background-color: #F7F7F7">
                     <h1 style="font-size: 24px">微企业管理系统（Wei-BMS） - 系统信息</h1>
                </td>
            </tr>
            <tr>
                <th>公司名称：
                </th>
                <td>哈沃德技术
                </td>
            </tr>
            <tr>
                <th>软件名称：
                </th>
                <td>微企业管理系统（Wei-BMS）
                </td>
            </tr>
            <tr>
                <th>版权所有：
                </th>
                <td>哈沃德技术
                </td>
            </tr>
            <tr>
                <th>软件版本：
                </th>
                <td>1.0</td>
            </tr>
            <tr>
                <th>HTTP服务器软件：
                </th>
                <td>IIS</td>
            </tr>
            <tr>
                <th>数据库软件：
                </th>
                <td>SqlServer 2008 R2 企业版 （（由微软公司正版授权））</td>
            </tr>
            <tr>
                <th>软件路径：
                </th>
                <td>D:\\WeiBMS</td>
            </tr>
            <tr>
                <th>用户数限制：
                </th>
                <td>50</td>
            </tr>
            <tr>
                <th>软件注册：
                </th>
                <td>尚未注册</td>
            </tr>
            <tr>
                <th>机器码：
                </th>
                <td>T1871DE91</td>
            </tr>
            <tr>
                <th>软件许可证：
                </th>
                <td>NO:2015101712345678</td>
            </tr>
        </table>
    </form>
</body>
</html>
