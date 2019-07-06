<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datatimepicker/css/bootstrap-datetimepicker.min.css">
</head>
<body>
<div style="z-index: -1" class="admin_top">
    <div class="row">
        <div class="navbar navbar-inverse navbar-static-top">
            <div class="navbar-header col-md-8">
                <span class="navbar-brand">启航课堂</span>
            </div>
            <div class="col-md-8"></div>
            <div style="height: 70px" class="col-md-8 col-md-offset-8">
                <span style="color:silver;line-height: 60px" class="glyphicon glyphicon-user">admin</span>
                <span style="color:silver" class="glyphicon glyphicon-time">2019.05.18</span>
                <a href="${pageContext.request.contextPath}/logout"><span style="color:silver;right: 0;" class="glyphicon glyphicon-off"></span></a>
            </div>
        </div>
    </div>
</div>
<div style="z-index: -1" class="slid_bar">
<div class="slidbar_title" style="z-index: 1">
    <p>
        <span>导航模块 / </span>
        <span>Nav Module</span>
    </p>
</div>
    <div class="slidbar_content navbar-fixed-bottom ">
        <a href="#collapse_system" data-toggle="collapse"><span class="glyphicon glyphicon-triangle-right"></span>系统设置</a>
        <ul id="collapse_system" class="collapse">
            <li><a href="admin_user"><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href="admin_role"><span class="glyphicon glyphicon-minus"></span>角色管理</a></li>
            <li><a href="admin_res"><span class="glyphicon glyphicon-minus"></span>资源管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>信息管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>备份管理</a></li>
        </ul>
        <a href="#collapse_video" data-toggle="collapse"><span class="glyphicon glyphicon-triangle-right"></span>视频管理</a>
        <ul id="collapse_video" class="collapse">
            <li><a href="admin_user"><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
        </ul><a href="#collapse_course" data-toggle="collapse"><span class="glyphicon glyphicon-triangle-right"></span>课程管理</a>
        <ul id="collapse_course" class="collapse">
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
        </ul><a href="#collapse_res" data-toggle="collapse"><span class="glyphicon glyphicon-triangle-right"></span>资料管理</a>
        <ul id="collapse_res" class="collapse">
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-minus"></span>用户管理</a></li>
        </ul>
    </div>
</div>
<div class="content_main">
    <ol class="breadcrumb">
        <li><a href="">后台管理</a></li>
        <li><a class="second" href="#">系统管理</a></li>
        <li class="third active">系统信息</li>
    </ol>
</div>
<!--<script src="${pageContext.request.contextPath}/resources/datatimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>-->
<!--<script src="${pageContext.request.contextPath}/resources/datatimepicker/js/bootstrap-datetimepicker.js"></script>-->
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/datatimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user.js"></script>
</body>
</html>
<iframe style="padding-left: 0px;margin-left: 240px; margin-top: 200px; padding-top: 40px;z-index:0;border: 0" id="iframe_content" class="navbar-fixed-bottom navbar-right" frameborder="no" scrolling="auto" width="1300px" height="600px" allowtransparency="true" src="admin_user?pageNum=1&pageSize=5"></iframe>