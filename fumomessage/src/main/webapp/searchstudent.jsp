<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="bean.student"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询学生信息</title>
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
		<div class="row">
		<div class="col-6">
		<form action="${pageContext.request.contextPath}/searchstudent"
				method="post" onsubmit="return validateNumber()">
				<input type="text" name="number" id="number" placeholder="请输入学号进行查询">
				<input type="submit" value="查询">
		</form>
		</div>
		<div class="col-6">
			<form action="${pageContext.request.contextPath}/searchstudent"
				method="post" onsubmit="return validateClassno()">
				<input type="text" name="classno" id="classno"
					placeholder="请输入班级进行查询">
				 <input type="submit" value="查询">
			</form>
		</div>
		</div>
			
			<table class="table">
				<tr>
					<td>学号</td>
					<td>姓名</td>
					<c:if test="${type eq 'number'}">
						<td>性别</td>
						<td>年龄</td>
					</c:if>
					<td>班级</td>
					<c:if test="${type eq 'number'}">
						<td>电话</td>
						<td>邮箱</td>
					</c:if>
					<td>系部</td>
					<td>学院</td>
				</tr>
				<c:forEach items="${list}" var="student">
					<tr>
						<td>${student.number}</td>
						<td>${student.name}</td>
						<c:if test="${type eq 'number'}">
							<td>${student.sex}</td>
							<td>${student.age}</td>
						</c:if>
						<td>${student.classno}</td>
						<c:if test="${type eq 'number'}">
							<td>${student.phone}</td>
							<td>${student.email}</td>
						</c:if>
						<td>${student.department}</td>
						<td>${student.college}</td>
					</tr>
				</c:forEach>
			</table>
	</div>
			<script>
				function validateNumber() {
					var number = document.getElementById("number").value;
					if (number == "") {
						alert("请输入学号！");
						return false;
					} else {
						return true;
					}
				}

				function validateClassno() {
					var classno = document.getElementById("classno").value;
					if (classno == "") {
						alert("请输入班级！");
						return false;
					} else {
						return true;
					}
				}
			</script>
</body>
</html>