<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../resources/datatimepicker/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="../resources/datatimepicker/css/bootstrap-datetimepicker.css">
</head>
<body>
<form class="form-inline" style="margin-top: 10px">
    <div id="datepicker" class="form-group">
        <label>报名时间：</label>
        <input  class="form-control form_datetime "  type="text" name="regtime">
        <span class="add-on"><i class="icon-th"></i></span>
    </div>
</form>
<script type="text/javascript">
    $(function () {
        $("#datepicker").datetimepicker({
            format:'yyyy-MM-dd HH-mm-ss'
        })
    })
</script>
<script src="../resources/js/jquery-1.12.4.min.js"></script>
<script src="../resources/datatimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="../resources/datatimepicker/js/bootstrap-datetimepicker.min.js"></script>
</body>
</html>