<%--
  Created by IntelliJ IDEA.
  User: 叶贺辉
  Date: 2019/5/19
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css"/>
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
                <li><a href="./login">登陆</a></li>
                <li><a href="">注册</a></li>
            </ul>
        </div>
    </div>
</nav>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active" data-lg-img="${pageContext.request.contextPath}/resources/image/9cbebd7420d342169da506a3ea9d058c.jpg" data-xs-img="${pageContext.request.contextPath}/resources/image/9cbebd7420d342169da506a3ea9d058c (2).jpg"></div>
        <div class="item" data-lg-img="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1.png" data-xs-img="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png"></div>
        <div class="item" data-lg-img="${pageContext.request.contextPath}/resources/image/b1f4e8c815eb4718aa9f44415f328a0d.jpg" data-xs-img="${pageContext.request.contextPath}/resources/image/b1f4e8c815eb4718aa9f44415f328a0d (2).jpg"></div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div id="courselist" class="container">
    <div class="page-header">
        <h3 class="text-center">最新发布课程<a href="">全部课程&gt;</a> </h3>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
    </div>
    <div class="page-header">
        <h3 class="text-center">JAVAEE课程<a href="">全部课程&gt;</a> </h3>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
    </div>
    <div class="page-header">
        <h3 class="text-center">JAVASE课程<a href="">全部课程&gt;</a> </h3>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/image/9fce05e0b0414c2895a6e02a6150f0e1 (2).png">
                <div class="caption">
                    <h4><a href="">2020考验计算机408全程班</a></h4>
                    <p class="course_price">¥60.00<a class="course_group" href="" >其他课程</a> </p>
                </div>
            </div>
        </div>
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
