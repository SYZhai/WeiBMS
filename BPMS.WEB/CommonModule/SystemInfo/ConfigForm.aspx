<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigForm.aspx.cs" Inherits="BPMS.WEB.CommonModule.SystemInfo.ConfigForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>系统参数配置</title>
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
                    <h1 style="font-size: 14px">数据库连接相关配置</h1>
                </td>
            </tr>
            <tr>
                <th>数据库软件类型：
                </th>
                <td>SQLServer
                </td>
            </tr>
            <tr>
                <th>连接字符串是否加密：
                </th>
                <td>false
                </td>
            </tr>
            <tr>
                <th>当前数据库名称：
                </th>
                <td>BPMS_DB
                </td>
            </tr>
            <tr>
                <th>SqlServer连接字符串：
                </th>
                <td>Server=.;Database=BPMS_DB;Uid=sa;Pwd=qwertyuiop
                </td>
            </tr>
            <tr>
                <th>Oracle连接字符串：
                </th>
                <td>Data Source=XE;User ID=learun;Password=qwertyuiop;</td>
            </tr>
            <tr>
                <th>MySql连接字符串：
                </th>
                <td>server=192.168.0.110;user id=root;password=qwertyuiop;database=BPMS_DB;</td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center; background-color: #F7F7F7">
                    <h1 style="font-size: 14px">主要是服务器端配置项内容部分</h1>
                </td>
            </tr>
            <tr>
                <th>系统默认登录账户：
                </th>
                <td>System</td>
            </tr>
            <tr>
                <th>系统默认登录密码：
                </th>
                <td>2A1B132C0E64FA299B014B39F7DE5C2F</td>
            </tr>
            <tr>
                <th>是否启动服务器缓存：
                </th>
                <td>false</td>
            </tr>
            <tr>
                <th>服务器缓存设置时间（分钟）：
                </th>
                <td>30</td>
            </tr>
            <tr>
                <th>是否自动重启IIS：
                </th>
                <td>false</td>
            </tr>
            <tr>
                <th>是否写系统日志：
                </th>
                <td>true</td>
            </tr>
            <tr>
                <th>系统日志保存路径：
                </th>
                <td>D://BPMS_Log</td>
            </tr>
            <tr>
                <th>是否启动自动备份数据库：
                </th>
                <td>true</td>
            </tr>
            <tr>
                <th>自动启动备份数据库设置时间：
                </th>
                <td>05:00:00</td>
            </tr>
            <tr>
                <th>最大在线用户数量限制：
                </th>
                <td>200</td>
            </tr>
            <tr>
                <th>允许重复登录：
                </th>
                <td>false,多人用同一帐号同时登录</td>
            </tr>
            <tr>
                <th>最大在线用户数量限制：
                </th>
                <td>200</td>
            </tr>
            <tr>
                <th>密码错误锁定次数限制：
                </th>
                <td>5</td>
            </tr>
            <tr>
                <th>密码错误锁定周期(分钟)：
                </th>
                <td>15</td>
            </tr>
            <tr>
                <th>是否启用动态密码卡：
                </th>
                <td>false</td>
            </tr>
            <tr>
                <th>记忆在线状态：
                </th>
                <td>false</td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center; background-color: #F7F7F7">
                    <h1 style="font-size: 14px">系统性的参数配置</h1>
                </td>
            </tr>
            <tr>
                <th>软件是否试用：
                </th>
                <td>2A1B132C0E64FA299B014B39F7DE5C2F</td>
            </tr>
            <tr>
                <th>当前客户公司名称：
                </th>
                <td>马鞍山江东设计集团</td>
            </tr>
            <tr>
                <th>软件名称：
                </th>
                <td>微企业管理系统（Wei-BMS）</td>
            </tr>
            <tr>
                <th>当前软件版本：
                </th>
                <td>1.0</td>
            </tr>
            <tr>
                <th>联系我们信息：
                </th>
                <td>QQ：1454904486;Email：1454904486@qq.com;</td>
            </tr>
            <tr>
                <th>软件许可证编号：
                </th>
                <td>NO:2015101712345678</td>
            </tr>
             <tr>
                <td colspan="3" style="text-align: center; background-color: #F7F7F7">
                    <h1 style="font-size: 14px">系统邮件错误报告反馈相关</h1>
                </td>
            </tr>
            <tr>
                <th>软件的错误报告发给谁：
                </th>
                <td>1454904486@qq.com,zsyy94@163.com</td>
            </tr>
            <tr>
                <th>发出错误邮箱的地址：
                </th>
                <td>1454904486@qq.com</td>
            </tr>
            <tr>
                <th>发出错误邮箱的名称：
                </th>
                <td>zsy</td>
            </tr>
            <tr>
                <th>发出错误邮箱设置邮箱主机：
                </th>
                <td>smtp.exmail.qq.com</td>
            </tr>
        </table>
    </form>
</body>
</html>
