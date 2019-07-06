$(function () {
    $(".form_datetime").datetimepicker({
        show: true,
        format: 'yyyy-MM-ss HH-mm-ss',
        language: 'zh-CN',
        weekStart: 1,
        autoclose: true,
        orientation:'right',
        todayBtn:'linked'
    });
    $("#editModal").on('hidden.bs.modal',function () {
        $(this).removeData("bs.modal")
    })
    $("#editModal").on('shown.bs.modal',function () {
        $("#editModal .selectpicker").selectpicker();
    })
    $("#batchdelete").click(function () {
        var checked=$(".checkone:checked")
        if(checked.length==0){
            alert("必须要勾选用户")
        }else {
            var ids = new Array();
            checked.each(function () {
                ids.push(this.value)
            })
            var data = JSON.stringify(ids)
            var flag=deleteconfirm();
            if(flag) {
                $.ajax({
                    url: '/ssmdemo/admin/batchDeleteUser?data='+data,
                    type: 'post',
                    success: function (rs) {
                        if (rs == "success") {
                            window.location.href ="/ssmdemo/admin/admin_user"
                        }
                    }
                })
            }
        }
    })
    $("#usersearch").on("click",function () {
        $("#searchform").submit()
    })
})
function checkall() {
    $(".checkone").prop("checked",$(".checkall").prop("checked"))
}
function checkone() {
    var flag=true
    $(".checkone").each(function (index,el) {
        if($(el).prop("checked")==false){
            flag=false;
        }
    })
    $(".checkall").prop("checked",flag)
}
function submitform() {
    alert(1)
    $("#updateform").submit()
}
function deleteconfirm() {
    if(confirm("确认删除该用户？")){
        return true;
    }else{
        return false;
    }
}
function adduser() {
    $("#adduserform").submit()
}