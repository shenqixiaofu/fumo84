<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加课程</title>
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
				<li class="nav-item"><a class="nav-link active"
					href="coursemanage.jsp" target="_self">课程管理</a></li>
				<li class="nav-item"><a class="nav-link" href="scoremanage.jsp"
					target="_self">成绩管理</a></li>
				<li class="nav-item"><a class="nav-link" href="classmanage.jsp"
					target="_self">班级资料管理</a></li>
				<li class="nav-item"><a class="nav-link" href="systemmanage.jsp"
					target="_self">系统管理</a></li>
			</ul>
		</div>
		<div class="container" style="width: 400px; background-color: #99CCCC;">
			<div class="row" style="margin-top: 50px;">
				<div class="col-12 col-sm-offset-3">
					<h1 class="text-center" style="color:white;">
						<small>添加课程信息</small>
					</h1>
				</div>
			</div>
			<form action="addcoucheck.jsp" method="post"
				onsubmit="return condition()">
				<div class="form-group">
					<label for="courseno">课程编号：</label> <input type="text"
						class="form-control" id="courseno" name="courseno"
						placeholder="请输入课程编号">
				</div>
				<br>
				<div class="form-group">
					<label for="coursename">课程名称：</label> <input type="text"
						class="form-control" id="coursename" name="coursename"
						placeholder="请输入课程名称">
				</div>
				<br>
				<div class="form-group">
					<label for="type">课程类型：</label> <input type="text"
						class="form-control" id="type" name="type" placeholder="请输入课程类型">
				</div>
				<br>
				<div class="form-group">
					<label for="period">课程学时：</label> <input type="text"
						class="form-control" id="period" name="period"
						placeholder="请输入课程学时">
				</div>
				<br>
				<div class="form-group">
					<label for="credit">课程学分：</label> <input type="text"
						class="form-control" id="credit" name="credit"
						placeholder="请输入课程学分">
				</div>
				<br>
				<div class="form-group" style="text-align: center">
					<input class="btn btn-primary" type="submit" value="提交" /> 
					<input class="btn btn-default" type="reset" value="重置" /> 
					<a class="btn btn-primary" href="coursemanage.jsp" role="button" target="_self">返回</a>
				</div>
			</form>
		</div>
	</div>
	<script>
		function condition() {
			var courseno_1 = document.getElementById("courseno").value;//获取id为courseno的值
			var coursename_2 = document.getElementById("coursename").value;//获取id为coursename的值
			var type_3 = document.getElementById("type").value;//获取id为type的值

			if (courseno_1 == "") {
				alert("课程编号不能为空！");
				return false;
			}
			if (coursename_2 == "") {
				alert("课程名称不能为空！");
				return false;
			}
			if (type_3 == "") {
				alert("课程类型不能为空！");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>