<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加学生</title>
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
	<div class="container">
		<div class="col-12">
			<ul class="nav nav-tabs justify-content-end">
				<li class="nav-item"><a class="nav-link active"
					href="studentmanage.jsp" target="_self">学生管理</a></li>
				<li class="nav-item"><a class="nav-link"
					href="coursemanage.jsp" target="_self">课程管理</a></li>
				<li class="nav-item"><a class="nav-link" href="scoremanage.jsp"
					target="_self">成绩管理</a></li>
				<li class="nav-item"><a class="nav-link" href="classmanage.jsp"
					target="_self">班级资料管理</a></li>
				<li class="nav-item"><a class="nav-link" href="systemmanage.jsp"
					target="_self">系统管理</a></li>
			</ul>
		</div>
		</div>
		<div class="container" style="width: 400px; background-color: #99CCCC;">
			<div class="row" style="margin-top: 50px;">
				<div class="col-12 col-sm-offset-3">
					<h1 class="text-center" style="color:white;">
						<small>添加学生信息</small>
					</h1>
				</div>
			</div>
			<form action="addstucheck.jsp" method="post"
				onsubmit="return condition()">
				<div class="form-group">
					<label for="name">学号：</label> <input type="text"
						class="form-control" id="number" name="number" placeholder="请输入学号">
				</div>
				<br>
				<div class="form-group">
					<label for="name">姓名：</label> <input type="text"
						class="form-control" id="name" name="name" placeholder="请输入姓名">
				</div>
				<br>
				<div class="form-group">
					<label for="name">性别：</label> 
					<input type="radio" name="sex" value="男" />男&nbsp;&nbsp;&nbsp; 
					<input type="radio" name="sex" value="女" />女&nbsp;&nbsp;&nbsp; 
					<%-- <input type="radio" name="sex" value="沃尔玛购物袋" checked />沃尔玛购物袋--%>
				</div>
				<br>
				<div class="form-group">
					<label for="age">年龄：</label> <input type="text"
						class="form-control" id="age" name="age" placeholder="请输入年龄">
				</div>
				<br>
				<div class="form-group">
					<label for="classno">班级：</label> <input type="text"
						class="form-control" id="classno" name="classno"
						placeholder="请输入班级">
				</div>
				<br>
				<div class="form-group">
					<label for="phone">电话：</label> <input type="text"
						class="form-control" id="phone" name="phone" placeholder="请输入电话号码" />
				</div>
				<br>
				<div class="form-group">
					<label for="email">Email：</label> <input type="text"
						class="form-control" id="email" name="email" placeholder="请输入邮箱地址" />
				</div>
				<br>
				<div class="form-group">
					<label for="email">系部：</label> <input type="text"
						class="form-control" id="department" name="department"
						placeholder="请输入所在系部" />
				</div>
				<br>
				<div class="form-group">
					<label for="email">学院：</label> <input type="text"
						class="form-control" id="college" name="college"
						placeholder="请输入所在学院" />
				</div>
				<br>
				<div class="form-group" style="text-align: center">
					<input class="btn btn-primary" type="submit" value="提交" /> 
					<input class="btn btn-default" type="reset" value="重置" /> 
					<a class="btn btn-primary" href="studentmanage.jsp" role="button" target="_self">返回</a>
				</div>
			</form>
		</div>
	
	<script>
		function condition() {
			var number_1 = document.getElementById("number").value;//获取id为number的值
			var name_2 = document.getElementById("name").value;//获取id为classno的值
			var class_3 = document.getElementById("classno").value;//获取id为classno的值

			if (number_1 == "") {
				alert("学号不能为空！");
				return false;
			}
			if (name_2 == "") {
				alert("姓名不能为空！");
				return false;
			}
			if (class_3 == "") {
				alert("班级不能为空！");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>