<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
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
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String now = df.format(d);
%>
	<div class="container">
		<div class="container" style="width: 400px; background-color: pink;">
			<div class="row" style="margin-top: 50px;">
				<div class="col-12 col-sm-offset-3">
					<h1 class="text-center" style="color:white;">
						<small>添加用户信息</small>
					</h1>
				</div>
			</div>
			<form action="addusercheck.jsp" method="post"
				onsubmit="return condition()">
				<div class="form-group">
					<label for="cno">用户名：</label> <input type="text"
						class="form-control" id="username" name="username"
						placeholder="请输入用户名">
				</div>
				<br>
				<div class="form-group">
					<label for="classname">密码：</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="请输入密码">
				</div>
				<br>
				<div class="form-group">
					<label for="department">注册日期：</label> <input type="text"
						class="form-control" id="zhuceday" name="zhuceday" value="<%=now%>" disabled>
				</div>
				<br>
				<div class="form-group" style="text-align: center">
					<input class="btn btn-primary" type="submit" value="提交" /> <input
						class="btn btn-default" type="reset" value="重置" /> 
						<a class="btn btn-primary" href="systemmanage.jsp" role="button" target="_self">返回</a>
				</div>
			</form>
		</div>
	</div>
	<script>
		function condition() {
			var username_1 = document.getElementById("username").value;//获取id为courseno的值
			var password_2= document.getElementById("password").value;//获取id为coursename的值

			if (username_1 == "") {
				alert("用户名不能为空！");
				return false;
			}
			if (password_2 == "") {
				alert("密码不能为空！");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>