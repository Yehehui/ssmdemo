<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#qhnavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand" >启航课堂</a>
        </div>
        <div id="qhnavbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="">首页</a></li>
                <li><a href="">全部课程</a></li>
                <li><a href="">问题讨论</a></li>
                <li><a href="">学习路线</a></li>
                <li><a href="">资料下载</a></li>
            </ul>
            <div class="navbar-form navbar-left">
                <form action="" method="get">
                    <div class="input-group">
                        <input type="text" name="search_str" placeholder="课程名称" class="form-control">
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                    </div>
                </form>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="">登陆</a></li>
                <li><a href="">注册</a></li>
            </ul>
        </div>
    </div>
</nav>
<div id="loginhtml" class="container">
    <div class="row">
        <div class="col-md-7 col-sm-6 col-xs-5"></div>
        <div class="col-md-10 login-col">
            <ul class="nav nav-tabs">
                <li role="presentation" class="col-xs-12 active"><a data-toggle="tab" href="#loginform">登陆账号</a></li>
                <li role="presentation" class="col-xs-12"><a data-toggle="tab" href="#regform">注册账号</a></li>
            </ul>
            <div class="tab-content">
                <div id="loginform" class="tab-pane fade in active ">
                    <form action="./userlogin" method="post">
                        <div class="form-group">
                        <label>账号：</label>
                        <input type="text" name="username" class="form-control" placeholder="邮箱/手机号/用户名">
                        </div>
                        <div class="form-group">
                        <label>密码：</label>
                        <input type="password" name="password" class="form-control" placeholder="密码">
                        </div>
                        <div class="form-group">
                         <label><input type="checkbox" name="remenberme">十天内自动登陆</label>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn-primary form-control btn" value="登陆">
                        </div>
                        <div class="form-group">
                            <p><a href="">找回密码</a> | 还没有账号？<a href="">注册账号</a> </p>
                        </div>
                    </form>
                </div>
                <div id="regform" class="tab-pane fade">
                    <form action="#" method="post">
                        <div class="form-group">
                            <label>手机：</label>
                            <input type="text" name="username" class="form-control" placeholder="手机号">
                        </div>
                        <div class="form-group">
                        <label>用户名：</label>
                        <input type="password" name="password" class="form-control" placeholder="用户名">
                    </div>
                        <div class="form-group">
                            <label>密码：</label>
                            <input type="password" name="password" class="form-control" placeholder="密码">
                        </div>
                        <div class="form-group">
                            <label>验证码：</label>
                            <div class="row">
                                <div class="col-xs-12">
                                    <input type="text" name="phonecode" class="form-control" placeholder="验证码">
                                </div>
                                <div class="col-xs-12">
                                    <input type="button" name="code" value="点击获取验证码" class="btn-primary form-control btn">
                                </div>
                            </div>
                            <div class="form-group" style="margin-top: 10px">
                                <input type="submit" class="btn-primary form-control btn" value="注册">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-7 col-sm-6 col-xs-5"></div>
    </div>
</div>
<div class="footer hidden-xs">
    <p class="cr">Copyright © 2006-2019 MvnRepository. All rights reserved.</p>
</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>
</html>