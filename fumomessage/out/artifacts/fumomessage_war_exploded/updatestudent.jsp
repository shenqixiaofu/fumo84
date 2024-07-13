<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.student"%>
<%@ page import="dao.studentdao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生信息</title>
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
    int number = Integer.parseInt(request.getParameter("number"));//获取学号
    student stu = studentdao.getStudent(number);//根据学号获取完整的对象
%>
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
				<h1 class="text-center"style="color:white;">
					<small>修改学生信息</small>
				</h1>
			</div>
		</div>
		<form action="updatestucheck.jsp?number=<%=number%>" method="post">
			<div class="form-group">
				<label for="name">学号：</label> <input type="text"
					class="form-control" id="number" name="number" value="<%=stu.getNumber()%>" disabled>
			</div>
			<br>
			<div class="form-group">
				<label for="name">姓名：</label> <input type="text"
					class="form-control" id="name" name="name" value="<%=stu.getName()%>" disabled>
			</div>
			<br>
			<div class="form-group">
				<label for="name">性别：</label> <input type="text"
					class="form-control" id="sex" name="sex"value="<%=stu.getSex()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="age">年龄：</label> <input type="text" class="form-control"
					id="age" name="age"value="<%=stu.getAge()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="classno">班级：</label> <input type="text"
					class="form-control" id="classno" name="classno"
					value="<%=stu.getClassno()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="phone">电话：</label> <input type="text"
					class="form-control" id="phone" name="phone"value="<%=stu.getPhone()%>" >
			</div>
			<br>
			<div class="form-group">
				<label for="email">Email：</label> <input type="text"
					class="form-control" id="email" name="email" value="<%=stu.getEmail()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="email">系部：</label> <input type="text"
					class="form-control" id="department" name="department" value="<%=stu.getDepartment()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="email">学院：</label> <input type="text"
					class="form-control" id="college" name="college" value="<%=stu.getCollege()%>">
			</div>
			<br>
			<div class="form-group" style="text-align: center">
				<input class="btn btn-primary" type="submit" value="提交" />
				<input class="btn btn-default" type="reset" value="重置" />
				<a class="btn btn-primary" href="studentmanage.jsp" role="button" target="_self">返回</a>
			</div>
		</form>
		</div>
	</div>
</body>
</html>