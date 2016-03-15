<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testPrint.aspx.cs" Inherits="BPMS.WEB.ExampleModule.Printpage.iframes.testPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>测试打印</title>
    <style type="text/css">
        body {
            margin: 0px;
            font-size: 12px;
        }

        table {
            margin: 0px;
            width: 99%;
            border-collapse: collapse;
            border-width: 3px 1px 1px;
        }

            table td {
                border: 1px solid #000000;
                padding: 3px 5px 3px 5px;
            }

        .bnt {
            padding-top: 5px;
        }

        .lbllenth {
            width: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td width="35px">序号
                </td>
                <td>物品名称
                </td>
                <td width="10%">物品产地
                </td>
                <td width="10%">物品规格
                </td>
                <td width="10%">物品单位
                </td>
                <td width="7%">税率
                </td>
                <td width="10%">每件单位
                </td>
                <td width="10%">出库件重
                </td>
                <td width="10%">出库数量
                </td>
            </tr>
            <tr>
                <td>1
                </td>
                <td align="left">硫酸镍
                </td>
                <td>吉林
                </td>
                <td>25kg/包
                </td>
                <td>包
                </td>
                <td>0.2
                </td>
                <td>25
                </td>
                <td>1250
                </td>
                <td>50
                </td>
            </tr>
            <tr>
                <td>2
                </td>
                <td align="left">碳酸钙
                </td>
                <td>晋江
                </td>
                <td>50kg
                </td>
                <td>包
                </td>
                <td>0.3
                </td>
                <td>100
                </td>
                <td>5000
                </td>
                <td>50
                </td>
            </tr>
            <tr>
                <td>3
                </td>
                <td align="left">硫酸钠
                </td>
                <td>北京
                </td>
                <td>2kg
                </td>
                <td>袋
                </td>
                <td>0.2
                </td>
                <td>10
                </td>
                <td>500
                </td>
                <td>50
                </td>
            </tr>
            <tr>
                <td>4
                </td>
                <td align="left">测试商品2
                </td>
                <td>上海
                </td>
                <td>20kg/件
                </td>
                <td>kg
                </td>
                <td>0.05
                </td>
                <td>20
                </td>
                <td>1000
                </td>
                <td>50
                </td>
            </tr>
            <tr>
                <td>5
                </td>
                <td align="left">测试商品1
                </td>
                <td>泉州
                </td>
                <td>15kg/桶
                </td>
                <td>kg
                </td>
                <td>0.6
                </td>
                <td>15
                </td>
                <td>750
                </td>
                <td>50
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
