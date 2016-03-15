$(function () {
    document.onselectstart = function () { return false; }
    $(document).bind("contextmenu", function () {
        return false;
    });
})
//样式
function readyIndex() {
    $("#toolbar img").hover(function () {
        $(this).addClass("pageBase_Div");
    }, function () {
        $(this).removeClass("pageBase_Div");
    });
}
/**自应高度**/
var MainContent_subtract = 122;
var Sidebar_subtract = 148;
function iframeresize() {
    resizeU();
    $(window).resize(resizeU);
    function resizeU() {
        var divkuangH = $(window).height();
        $("#MainContent").height(divkuangH - MainContent_subtract - 1);
        $("#Sidebar").height(divkuangH - Sidebar_subtract-2);
    }
}
/**安全退出**/
function IndexOut() {
    top.showConfirmMsg('亲：您是否确认退出代码生成器？', function (r) {
        if (r) {
            var isIE = navigator.appName == "Microsoft Internet Explorer";
            if (isIE) {
                window.opener = "";
                window.open("", "_self");
                window.close();
            }
            else {
                window.close();
            }
        }
    });
}
//当前日期
function writeDateInfo() {
    var now = new Date();
    var year = now.getFullYear(); //getFullYear getYear
    var month = now.getMonth();
    var date = now.getDate();
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec + " " + week;

    $("#datetime").text(time);
    var timer = setTimeout("writeDateInfo()", 1000);
}
var Contentheight = "";
var Contentwidth = "";
var FixedTableHeight = "";
//最大化
function Maximize() {
    $("#Header").hide();
    $("#full_screen").attr('src', '/Themes/Images/icons/arrow_inout.gif').attr('title', '还原').attr('onclick', 'Fullrestore()');
    MainContent_subtract = MainContent_subtract - 70;
    Sidebar_subtract = Sidebar_subtract - 70;
    iframeresize();
}
//还原
function Fullrestore() {
    $("#Header").show();
    $("#full_screen").attr('src', '/Themes/Images/icons/arrow_out.gif').attr('title', '最大化').attr('onclick', 'Maximize()');
    MainContent_subtract = MainContent_subtract + 70;
    Sidebar_subtract = Sidebar_subtract + 70;
    iframeresize();
}