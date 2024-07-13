<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.user"%>
<%@ page import="dao.userdao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
div.container {
	height: 60%;
	width: 90%;
	border-radius: 25px;
}
</style>
</head>
<body>
<%
    String username = request.getParameter("username");//获取用户名称
    user user = userdao.getUsername(username);//根据用户名称获取完整的对象
%>
<div class="container">
	<div class="row">
		<div class="row">
			<div class="col-12">
				<ul class="nav nav-tabs justify-content-end">
					<li class="nav-item"><a class="nav-link"
						href="studentmanage.jsp" target="_self">学生管理</a></li>
					<li class="nav-item"><a class="nav-link" href="coursemanage.jsp"
						target="_self">课程管理</a></li>
					<li class="nav-item"><a class="nav-link" href="scoremanage.jsp"
						target="_self">成绩管理</a></li>
					<li class="nav-item"><a class="nav-link" href="classmanage.jsp"
						target="_self">班级资料管理</a></li>
					<li class="nav-item"><a class="nav-link active" href="systemmanage.jsp"
						target="_self">系统管理</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container" style="width: 400px; background-color: #99CCCC;">
		<div class="row" style="margin-top: 50px;">
			<div class="col-12 col-sm-offset-3">
				<h1 class="text-center" style="color:white;">
					<small>修改用户密码</small>
				</h1>
			</div>
		</div>
		<form action="updateusercheck.jsp?username=<%=username%>" method="post">
			<div class="form-group">
				<label for="name">用户名称：</label> <input type="text"
					class="form-control" id="username" name="username" value="<%=user.getUsername()%>" 	disabled>
			</div>
			<br>
			<div class="form-group">
				<label for="name">密码：</label> <input type="text"
					class="form-control" id="password" name="password" value="<%=user.getPassword()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="name">注册日期：</label> <input type="text"
					class="form-control" id="type" name="type" value="<%=user.getZhuceday()%>" disabled>
			</div>
			<br>
			<div class="form-group" style="text-align: center">
				<input class="btn btn-primary" type="submit" value="提交" />
				<input class="btn btn-default" type="reset" value="重置" />
				<a class="btn btn-primary" href="systemmanage.jsp" role="button" target="_self">返回</a>
			</div>
		</form>
	</div>
	</div>
</body>
</html>