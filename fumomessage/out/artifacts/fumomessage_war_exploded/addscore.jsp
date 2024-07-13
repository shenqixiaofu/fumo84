<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加成绩</title>
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
	<div class="row">
		<div class="col-12">
			<ul class="nav nav-tabs justify-content-end">
				<li class="nav-item"><a class="nav-link"
					href="studentmanage.jsp" target="_self">学生管理</a></li>
				<li class="nav-item"><a class="nav-link"
					href="coursemanage.jsp" target="_self">课程管理</a></li>
				<li class="nav-item"><a class="nav-link active" href="scoremanage.jsp"
					target="_self">成绩管理</a></li>
				<li class="nav-item"><a class="nav-link" href="classmanage.jsp"
					target="_self">班级资料管理</a></li>
				<li class="nav-item"><a class="nav-link"
					href="systemmanage.jsp" target="_self">系统管理</a></li>
			</ul>
		</div>
		</div>
		<div class="container" style="width: 400px; background-color: #99CCCC;">
			<div class="row" style="margin-top: 50px;">
				<div class="col-12 col-sm-offset-3">
					<h1 class="text-center" style="color:white;">
						<small>添加成绩</small>
					</h1>
				</div>
			</div>
			<form action="addsccheck.jsp" method="post"
				onsubmit="return condition()">
				<div class="form-group">
					<label for="studentnumber">学号：</label> <input type="text"
						class="form-control" id="studentnumber" name="studentnumber"
						placeholder="请输入学生学号">
				</div>
				<br>
				<div class="form-group">
					<label for="studentname">学生姓名：</label> <input type="text"
						class="form-control" id="studentname" name="studentname"
						placeholder="请输入学生姓名">
				</div>
				<br>
				<div class="form-group">
					<label for="coursename">课程名称：</label> <input type="text"
						class="form-control" id="coursename" name="coursename" placeholder="请输入课程名称">
				</div>
				<br>
				<div class="form-group">
					<label for="upscore">上学期成绩：</label> <input type="text"
						class="form-control" id="upscore" name="upscore"
						placeholder="请输入上学期成绩">
				</div>
				<br>
				<div class="form-group">
					<label for="downscore">下学期成绩：</label> <input type="text"
						class="form-control" id="downscore" name="downscore"
						placeholder="请输入下学期成绩">
				</div>
				<br>
				<div class="form-group" style="text-align: center">
					<input class="btn btn-primary" type="submit" value="提交" /> 
					<input class="btn btn-default" type="reset" value="重置" /> 
					<a class="btn btn-primary" href="scoremanage.jsp" role="button" target="_self">返回</a>
				</div>
			</form>
		</div>
	</div>
	<script>
		function condition() {
			var studentnumber_1 = document.getElementById("studentnumber").value;
			var studentname_2 = document.getElementById("studentname").value;
			var coursename_3 = document.getElementById("coursename").value;

			if (studentnumber_1 == "") {
				alert("学号不能为空！");
				return false;
			}
			if (studentname_2 == "") {
				alert("姓名不能为空！");
				return false;
			}
			if (coursename_3 == "") {
				alert("课程名称不能为空！");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>