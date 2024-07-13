<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.course"%>
<%@ page import="dao.coursedao"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程管理界面</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
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
		<table class="table">
			<tr>
				<td>课程编号</td>
				<td>课程名称</td>
				<td>课程类型</td>
				<td>课程学时</td>
				<td>课程学分</td>
				<td width="200px"><a class="btn btn-outline-primary"
					href="addcourse.jsp" role="button" target="_self">增加课程</a></td>
			</tr>
			<%
			List<course> list = coursedao.getList();
			Iterator<course> iter = list.iterator();
			while (iter.hasNext()) {
				course course = iter.next();
			%>
			<tr>
				<td width="100px"><%=course.getCourseno()%></td>
				<td width="150px"><%=course.getCoursename()%></td>
				<td width="150px"><%=course.getType()%></td>
				<td width="100px"><%=course.getPeriod()%></td>
				<td width="100px"><%=course.getCredit()%></td>
				<td width="120px">
					<a class="btn btn-primary" href="#"
					onclick="deletecourse(<%=course.getId()%>)" role="button">删除</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    <a class="btn btn-info"
					href="updatecourse.jsp?courseno=<%=course.getCourseno()%>"
					role="button" target="_self">修改</a>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<script>
function deletecourse(id) {
  if (confirm("该操作不可逆，确定要删除该课程吗？")) {
    window.location.href = "deletecourse.jsp?id=" + id;
  }
}
</script>
</body>
</html>