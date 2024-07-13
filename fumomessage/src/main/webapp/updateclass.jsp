<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.banji"%>
<%@ page import="dao.banjidao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改班级信息</title>
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
    String cno = request.getParameter("cno");//获取班级编号
    banji bj = banjidao.getClass(cno);//根据班级编号获取完整的对象
%>
<div class="container">
	<div class="row">
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
					<small>修改班级信息</small>
				</h1>
			</div>
		</div>
		<form action="updateclcheck.jsp?cno=<%=cno%>" method="post">
			<div class="form-group">
				<label for="name">班级编号：</label> <input type="text"
					class="form-control" id="cno" name="cno" value="<%=bj.getCno()%>" disabled>
			</div>
			<br>
			<div class="form-group">
				<label for="name">班级名称：</label> <input type="text"
					class="form-control" id="classname" name="classname" value="<%=bj.getClassname()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="name">所属系部：</label> <input type="text"
					class="form-control" id="department" name="department" value="<%=bj.getDepartment()%>">
			</div>
			<br>
			<div class="form-group">
				<label for="name">所在部门：</label> <input type="text" class="form-control"
					id="college" name="college" value="<%=bj.getCollege()%>">
			</div>
			<br>
			<div class="form-group" style="text-align: center">
				<input class="btn btn-primary" type="submit" value="提交" />
				<input class="btn btn-default" type="reset" value="重置" />
				<a class="btn btn-primary" href="classmanage.jsp" role="button" target="_self">返回</a>
			</div>
		</form>
	</div>
	</div>
</body>
</html>