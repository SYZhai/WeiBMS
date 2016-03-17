<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QYConfigInfo.aspx.cs" Inherits="BPMS.WEB.QYManager.ConfigSetting.QYConfigInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>个性化设置</title>
    <link href="/Themes/Styles/Style.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            divresize(29);
        })
    </script>
</head>
<body>
   <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                  &nbsp;&nbsp;&nbsp;&nbsp;企业号配置信息请与<a href="https://qy.weixin.qq.com" target="_blank" style="font-weight: bold; text-decoration: underline">微信企业号平台</a>保持一致！
            </div>
        </div>
        <div class="line"></div>
        <div class="div-body">
            <div style="padding-left: 20px; padding-right: 20px; padding-top: 5px;">
                <div style="padding: 5px; margin-left: 10px;">
                    <label style="font-size: 20px; font-weight: bold; color: gray;">
                        参数设置</label>
                </div>
                <div class="line" style="height: 2px;">
                </div>
                <table border="0" cellpadding="0" cellspacing="2" class="frm" style="padding-top: 30px; padding-left: 100px;" 
                    <tr>
                        <th>企业号名称：
                        </th>
                        <td>
                            <input id="QYName" maxlength="50" runat="server" type="text"  datacol="yes" err="企业号名称" checkexpession="NotNull" class="txt" style="width: 320px;height:25px;" />
                        </td>
                    </tr>
                    <tr>
                        <th>CorpId：
                        </th>
                        <td>
                            <input id="QYCorpId" maxlength="50" runat="server" type="text"  datacol="yes" err="CorpId" checkexpession="NotNull" class="txt" style="width: 320px;height:25px;" />
                        </td>
                    </tr>
                    <tr>
                        <th>CorpSecret：
                        </th>
                        <td>

                            <input id="QYCorpSecret"  maxlength="100" runat="server" class="txt" type="text"  datacol="yes" err="CorpSecret" checkexpession="NotNull" style="width: 320px;height:25px;"  />
                        </td>
                    </tr>
           
                </table>
               
               
                <div class="line" style="height: 2px;">
                </div>
               
                <div style="padding-top: 30px; padding-left: 210px;">
                    <asp:Button class="buttonHuge button-blue" ID="btnSave" runat="server" Text="保存设置" style="color: #fff" OnClick="btnSave_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
