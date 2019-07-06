$(function () {
    $(".slidbar_content>ul>li>a").click(function (el) {
        el.preventDefault();
        var $this=$(this);
        // alert($this.parent().parent().prev().text())
        $(".slidbar_content>ul>li>a").removeClass("now")
        $this.addClass("now")
        var href=$this.attr("href");
        $("#iframe_content").attr("src",href)
        $(".breadcrumb>.third").html($this.text())
        $(".breadcrumb>li>.second").html($this.parent().parent().prev().text())
    })
})
