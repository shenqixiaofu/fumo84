<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="bean.score"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询成绩</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<style>
html, body, div.box {
	height: 100%;
}

div.ibox {
	background-color: white;
	height: 60%;
	width: 90%;
	border-radius: 25px;
}

div.container {
	width: 100%;
}

div.text {
	text-align: center;
	font-size: 20px;
}

.button {
	text-align: center;
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
		<div class="row">
		<div class="col-6">
		<form action="${pageContext.request.contextPath}/searchscore"
			method="post" onsubmit="return validateCourseName()">
			<input type="text" name="coursename" id="coursename" placeholder="请输入课程名进行查询">
			<input type="submit" value="按课程名查询">
		</form>
		</div>
		<div class="col-6">
		<form action="${pageContext.request.contextPath}/searchscore"
			method="post" onsubmit="return validateSemester()">
			<label for="semester">选择上下学期：</label> 
			<input type="radio" id="upscore" name="semester" value="上学期"> 
			<label for="upscore">上学期</label> 
			<input type="radio" id="downscore" name="semester" value="下学期"> 
			<label for="downscore">下学期</label>
			
			<input type="submit" value="按学期查询">
		</form>
		</div>
		<table class="table">
			<tr>
				<td>ID</td>
				<td>学号</td>
				<td>姓名</td>
				<td>课程名称</td>
				<td>上学期成绩</td>
				<td>下学期成绩</td>
			</tr>
			<c:forEach var="score" items="${scoreList}">
				<tr>
					<td>${score.id}</td>
					<td>${score.studentnumber}</td>
					<td>${score.studentname}</td>
					<td>${score.coursename}</td>
					<td>${score.upscore}</td>
					<td>${score.downscore}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</div>
	<script>
		function validateCourseName() {
			var coursename = document.getElementById("coursename").value;
			if (coursename.trim() === "") {
				alert("请输入课程名进行查询！");
				return false;
			}
			return true;
		}

		function validateSemester() {
			var selectedSemester = document
					.querySelector('input[name="semester"]:checked');
			if (!selectedSemester) {
				alert("请选择上下学期进行查询！");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>