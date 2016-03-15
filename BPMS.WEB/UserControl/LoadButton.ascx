<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoadButton.ascx.cs" Inherits="BPMS.WEB.UserControl.LoadButton" %>
<%--动态加载权限按钮
    根据模块id获取对应按钮
--%>
<script type="text/javascript">
    //右击菜单栏
    <%=base.sb_contextmenu.ToString() %>
</script>
<%=base.sb_ButtonPermission.ToString() %>