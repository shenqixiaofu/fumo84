<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.score"%>
<%@ page import="dao.scoredao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改成绩信息</title>
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
	int id = Integer.parseInt(request.getParameter("id"));//获取coursename
    score sc = scoredao.getScore(id);//根据id获取完整的对象
%>
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
				<h1 class="text-center"style="color:white;">
					<small>修改成绩信息</small>
				</h1>
			</div>
		</div>
		<form action="updatesccheck.jsp?id=<%=id%>" method="post">
			<div class="form-group">
				<label for="name">学号：</label> <input type="text"
					class="form-control" id="studentnumber" name="studentnumber" value="<%=sc.getStudentnumber()%>" disabled>
			</div>
			<br>
			<div class="form-group">
				<label for="name">学生姓名：</label> <input type="text"
					class="form-control" id="studentname" name="studentname" value="<%=sc.getStudentname()%>" disabled>
			</div>
			<br>
			<div class="form-group">
				<label for="name">课程名称：</label> <input type="text" class="form-control"
					id="coursename" name="coursename"value="<%=sc.getCoursename()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="name">上学期成绩：</label> <input type="text"
					class="form-control" id="upscore" name="upscore"
					value="<%=sc.getUpscore()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="name">下学期成绩：</label> <input type="text"
					class="form-control" id="downscore" name="downscore"value="<%=sc.getDownscore()%>" >
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
</body>
</html>