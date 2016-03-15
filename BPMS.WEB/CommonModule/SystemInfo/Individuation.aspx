<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Individuation.aspx.cs" Inherits="BPMS.WEB.CommonModule.SystemInfo.Individuation" %>

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
                请先确认您的浏览器启用了 cookie，否则无法使用个性化设置
            </div>
        </div>
        <div class="line"></div>
        <div class="div-body">
            <div style="padding-left: 20px; padding-right: 20px; padding-top: 5px;">
                <div style="padding: 5px; margin-left: 10px;">
                    <label style="font-size: 20px; font-weight: bold; color: gray;">
                        语言设置</label>
                </div>
                <div class="line" style="height: 2px;">
                </div>
                <div style="padding-top: 20px; padding-bottom: 15px; padding-left: 100px;">
                    语言首选项：<select id="Language_Type" class="select" runat="server" style="width: 200px">
                        <option value="中文简体 [zh-CN]">中文简体 [zh-CN]</option>
                        <option value="英语(美国) [en_US]">英语(美国) [en_US]</option>
                    </select>
                </div>
                <div style="padding: 5px; margin-left: 10px;">
                    <label style="font-size: 20px; font-weight: bold; color: gray;">
                        界面主题</label>
                </div>
                <div class="line" style="height: 2px;">
                </div>
                <div style="padding-top: 20px; padding-bottom: 15px; padding-left: 100px;">
                    &nbsp;&nbsp; 界面主题：<select id="WebUI_Type" class="select" runat="server" style="width: 200px">
                        <option value="0">默认皮肤</option>
                        <option value="1">蓝色皮肤</option>
                        <option value="2">深蓝色皮肤</option>
                        <option value="3">咖啡色皮肤</option>
                    </select>
                </div>
                <div style="padding-top: 20px; padding-bottom: 15px; padding-left: 100px;">
                    &nbsp;&nbsp; 背景图片：<select id="Select1" class="select" runat="server" style="width: 200px">
                        <option value="0">默认皮肤</option>
                        <option value="1">蓝色皮肤</option>
                        <option value="2">深蓝色皮肤</option>
                        <option value="3">咖啡色皮肤</option>
                    </select>
                </div>
                <div style="padding: 5px; margin-left: 10px;">
                    <label style="font-size: 20px; font-weight: bold; color: gray;">
                        界面风格</label>
                </div>
                <div class="line" style="height: 2px;">
                </div>
                <div style="padding-top: 20px; padding-bottom: 15px; padding-left: 100px;">
                    &nbsp;&nbsp; 表现方式：<select id="Menu_Type" class="select" runat="server" style="width: 200px">
                        <option value="0">默认导航</option>
                        <option value="1">手风琴菜单(2级)</option>
                        <option value="2">Top+Left菜单(2级)</option>
                        <option value="3">树形结构菜单(无限级)</option>
                    </select>
                </div>
                <div style="padding-top: 30px; padding-left: 180px;">
                    <a class="buttonHuge button-blue" onclick="alert('正在开发中')" style="color: #fff">保存设置</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
