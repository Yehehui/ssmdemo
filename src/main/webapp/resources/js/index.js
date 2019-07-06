$(function () {
    changebji();
    window.onresize=function () {
        changebji();
    }
})

function changebji() {
    var wid=$(window).width();
    $("#carousel-example-generic>.carousel-inner>.item").each(function (index ,e) {
        var div=$(e)
        var bjimg=div.data((wid<=768)?"xs-img":"lg-img");
        if(wid<=768){
            div.css("background","")
            div.html('<img src="'+bjimg+'" alt="carousel"/>')
        }else{
            div.html("");
            div.css("background","url('"+bjimg+"') no-repeat")
        }
    })
}