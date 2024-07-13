<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.course"%>
<%@ page import="dao.coursedao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改课程信息</title>
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
    String courseno = request.getParameter("courseno");//获取课程编号
    course cour = coursedao.getCourse(courseno);//根据课程编号获取完整的对象
%>
<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="nav nav-tabs justify-content-end">
				<li class="nav-item"><a class="nav-link active" href="#"
					>学生管理</a></li>
				<li class="nav-item"><a class="nav-link" href=""
					target="_blank">课程管理</a></li>
				<li class="nav-item"><a class="nav-link" href=""
					target="_blank">成绩管理</a></li>
				<li class="nav-item"><a class="nav-link" href=""
					target="_blank">班级资料管理</a></li>
				<li class="nav-item"><a class="nav-link" href=""
					target="_blank">系统管理</a></li>
			</ul>
		</div>
	</div>
	<div class="container" style="width: 400px; background-color: #99CCCC;">
		<div class="row" style="margin-top: 50px;">
			<div class="col-12 col-sm-offset-3">
				<h1 class="text-center" style="color:white;">
					<small>修改课程信息</small>
				</h1>
			</div>
		</div>
		<form action="updatecoucheck.jsp?courseno=<%=courseno%>" method="post">
			<div class="form-group">
				<label for="name">课程编号：</label> <input type="text"
					class="form-control" id="courseno" name="courseno" value="<%=cour.getCourseno()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="name">课程名称：</label> <input type="text"
					class="form-control" id="coursename" name="coursename" value="<%=cour.getCoursename()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="name">课程类别：</label> <input type="text"
					class="form-control" id="type" name="type" value="<%=cour.getType()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="name">课程学时：</label> <input type="text" class="form-control"
					id="period" name="period" value="<%=cour.getPeriod()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="name">课程学分：</label> <input type="text" class="form-control" 
					id="credit" name="credit" value="<%=cour.getCredit()%>">
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
</body>
</html>