<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datatimepicker/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datatimepicker/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-select/css/bootstrap-select.min.css">
</head>
<body style="z-index: 1">
<div class="container-fluid">
    <div class="row">
        <div class="search_bar">
            搜索
        </div>
    </div>
    <div class="row">
        <form action="./search" method="post" id="searchform" class="form-inline" style="margin-top: 10px">
        <div class="form-group">
            <label>报名时间：</label>
            <input  class="form-control input-sm form_datetime "  type="text" name="regtime">
        </div>
        <div class="form-group">
            <label>至：</label>
            <input class="form-control input-sm  form_datetime" type="text" name="regendtime">
        </div>
        <div class="form-group">
            <label>报名课程：</label>
            <input class="form-control" type="text" name="regcourse">
        </div>
        <div class="form-group">
            <label>学员信息：</label>
            <input class="form-control" placeholder="用户名/手机号" type="text"  name="userinfo">
        </div>
    </form>
    </div>
    <div class="row text-right" id="search_btn">
        <button id="usersearch" type="button" class="btn btn-primary ">查询</button>
        <button type="button" data-toggle="modal" data-target="#addModal" class="btn btn-primary ">添加</button>
        <button id="batchdelete" type="button" class="btn btn-primary ">删除</button>
        <button type="button" class="btn btn-primary ">导入</button>
        <button type="button" class="btn btn-primary ">导出</button>
    </div>
    <div id="table_content" class="row" style="margin-top: 10px">
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <tr>
                    <td><input type="checkbox" name="allcheck" class="checkall" onclick="checkall();"></td>
                    <td>用户名</td>
                    <td>手机号</td>
                    <td>邮箱地址</td>
                    <td>角色</td>
                    <td>用户状态</td>
                    <td style="width: 100px">操作</td>
                </tr>
                <c:forEach items="${userDatasByPager.list}" var="user">
                <tr>
                    <td><input type="checkbox" name="allcheck" value="${user.id}" class="checkone" onclick="checkone();"></td>
                    <td>${user.username}</td>
                    <td>${user.phone}</td>
                    <td>${user.email}</td>
                    <td>
                        <c:forEach items="${user.roleList}" var="role">
                            ${role.name}&nbsp;
                        </c:forEach>
                    </td>
                    <td>${user.enabled}</td>
                    <td style="width: 100px"><a href="./toupdate?id=${user.id}" data-toggle="modal" data-target="#editModal" >编辑</a><a onclick="return deleteconfirm()" href="./delete?id=${user.id}">删除</a></td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div id="pager" class="row">
        <p class="pull-left">总共有<span>${userDatasByPager.total}</span>条记录，当前第<span>${userDatasByPager.pageNum}/${userDatasByPager.pages}</span>页</p>
        <div class="btngroup pull-right">
            <a href="admin_user?pageNum=${userDatasByPager.firstPage}&pageSize=5"><button type="button" class="btn btn-primary">首页</button></a>
            <a href="admin_user?pageNum=${userDatasByPager.prePage}&pageSize=5"><button type="button" class="btn btn-primary">上一页</button></a>
            <a href="admin_user?pageNum=${userDatasByPager.nextPage}&pageSize=5"><button type="button" class="btn btn-primary">下一页</button></a>
            <a href="admin_user?pageNum=${userDatasByPager.lastPage}&pageSize=5"><button type="button" class="btn btn-primary">尾页</button></a>
    </div>
    </div>
</div>
<!--Model 添加-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body">
                <form id="adduserform" action="./add" method="post">
                    <div class="form-group">
                        <label>用户名：</label>
                        <input type="text" name="username" class="form-control" placeholder="手机号">
                    </div>
                    <div class="form-group">
                        <label>密码：</label>
                        <input type="password" name="password" class="form-control" placeholder="密码">
                    </div>
                    <div class="form-group">
                        <label>关联角色：</label>
                        <select  name="roleIds" class="selectpicker form-control" multiple>
                            <c:forEach items="${roles}" var="role">
                                <option  value="${role.id}">${role.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>手机号：</label>
                        <input type="text" name="phone" class="form-control" placeholder="手机号">
                    </div>
                    <div class="form-group">
                        <label>邮箱：</label>
                        <input type="text" name="email" class="form-control" placeholder="邮箱">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="adduserbtn" onclick="adduser();" type="button" class="btn btn-default">添加</button>
            </div>
        </div>
    </div>
</div>
<!--Model 修改-->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        </div>
    </div>
</div>
<%--<script type="text/javascript">--%>
    <%--$(function () {--%>
        <%--alert(1)--%>
        <%--$("#editModal").on("hidden.bs.modal",function () {--%>
            <%--alert(1)--%>
        <%--})--%>
    <%--})--%>
    <%--$(function () {--%>
        <%--$("#batchdelete").click(function () {--%>
            <%--alert(1)--%>
            <%--var checked=$(".checkone:checked")--%>
            <%--if(checked.length==0){--%>
                <%--alert("必须要勾选用户")--%>
            <%--}else {--%>
                <%--var ids = new Array();--%>
                <%--checked.each(function () {--%>
                    <%--ids.push(this.value)--%>
                <%--})--%>
                <%--var data = Json.stringify(ids)--%>
                <%--var flag=deleteconfirm();--%>
                <%--alert(1)--%>
                <%--if(flag) {--%>
                    <%--$.ajax({--%>
                        <%--url: '/ssmdemo/admin/batchDeleteUser',--%>
                        <%--type: 'post',--%>
                        <%--data: data,--%>
                        <%--success: function (rs) {--%>
                            <%--if (rs == "success") {--%>
                                <%--alert("success")--%>
                            <%--}--%>
                        <%--}--%>
                    <%--})--%>
                <%--}--%>
            <%--}--%>
        <%--})--%>
    <%--})--%>
<%--</script>--%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/user.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap-select/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap-select/js/i18n/defaults-zh_CN.js"></script>
<script src="${pageContext.request.contextPath}/resources/datatimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/resources/datatimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/datatimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>