<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加班级</title>
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
				<li class="nav-item"><a class="nav-link"
					href="studentmanage.jsp" target="_self">学生管理</a></li>
				<li class="nav-item"><a class="nav-link"
					href="coursemanage.jsp" target="_self">课程管理</a></li>
				<li class="nav-item"><a class="nav-link" href="scoremanage.jsp"
					target="_self">成绩管理</a></li>
				<li class="nav-item"><a class="nav-link active" href="classmanage.jsp"
					target="_self">班级资料管理</a></li>
				<li class="nav-item"><a class="nav-link"
					href="systemmanage.jsp" target="_self">系统管理</a></li>
			</ul>
		</div>
		</div>
		<div class="container" style="width: 400px; background-color:  #99CCCC;">
			<div class="row" style="margin-top: 50px;">
				<div class="col-12 col-sm-offset-3">
					<h1 class="text-center" style="color:white;">
						<small>添加班级信息</small>
					</h1>
				</div>
			</div>
			<form action="addclcheck.jsp" method="post"
				onsubmit="return condition()">
				<div class="form-group">
					<label for="cno">班级编号：</label> <input type="text"
						class="form-control" id="cno" name="cno"
						placeholder="请输入班级编号">
				</div>
				<br>
				<div class="form-group">
					<label for="classname">班级名称：</label> <input type="text"
						class="form-control" id="classname" name="classname"
						placeholder="请输入班级名称">
				</div>
				<br>
				<div class="form-group">
					<label for="department">所属部门：</label> <input type="text"
						class="form-control" id="department" name="department" placeholder="请输入所属部门">
				</div>
				<br>
				<div class="form-group">
					<label for="college">所在学院：</label> <input type="text"
						class="form-control" id="college" name="college"
						placeholder="请输入所在学院">
				</div>
				<br>
				<div class="form-group" style="text-align: center">
					<input class="btn btn-primary" type="submit" value="提交" /> <input
						class="btn btn-default" type="reset" value="重置" /> 
						<a class="btn btn-primary" href="classmanage.jsp" role="button" target="_self">返回</a>
				</div>
			</form>
		</div>
	</div>
	<script>
		function condition() {
			var cno_1 = document.getElementById("cno").value;//获取id为courseno的值
			var classname_2 = document.getElementById("classname").value;//获取id为coursename的值

			if (cno_1 == "") {
				alert("班级编号不能为空！");
				return false;
			}
			if (classname_2 == "") {
				alert("班级名称不能为空！");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>