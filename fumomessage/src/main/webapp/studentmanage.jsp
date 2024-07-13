<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.student"%>
<%@ page import="dao.studentdao"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生管理界面</title>
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
		<table class="table">
			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>年龄</td>
				<td>班级</td>
				<td>电话</td>
				<td>邮箱</td>
				<td>系部</td>
				<td>学院</td>
				<td width="250px"><a class="btn btn-outline-primary"
					href="addstudent.jsp" role="button" target="_self">增加学生</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-info" href="searchstudent.jsp" role="button"
					target="_self">查询学生</a></td>
			</tr>
			<%
			List<student> list = studentdao.getList();
			Iterator<student> iter = list.iterator();
			while (iter.hasNext()) {
				student student = iter.next();
			%>
			<tr>
				<td width="70px"><%=student.getNumber()%></td>
				<td width="120px"><%=student.getName()%></td>
				<td width="120px"><%=student.getSex()%></td>
				<td width="100px"><%=student.getAge()%></td>
				<td width="100px"><%=student.getClassno()%></td>
				<td width="130px"><%=student.getPhone()%></td>
				<td width="130px"><%=student.getEmail()%></td>
				<td width="130px"><%=student.getDepartment()%></td>
				<td width="130px"><%=student.getCollege()%></td>
				<td width="120px">
					<%--将 number 参数传过去 --%> <a class="btn btn-primary" href="#"
					onclick="deleteStudent(<%=student.getNumber()%>)" role="button">删除</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%--
              因为修改是要先 获取number 得到全部信息
              在修改所以传了一个参数  ?number=<%=student.getNumber()%>
            --%> <a class="btn btn-info"
					href="updatestudent.jsp?number=<%=student.getNumber()%>"
					role="button" target="_self">修改</a>
				</td>
			</tr>
			<tr>
			</tr>
			<%
			}
			%>
		</table>
	</div>

	<script>
function deleteStudent(number) {
  if (confirm("该操作不可逆，确定要删除该学生吗？")) {
    window.location.href = "deletestudent.jsp?number=" + number;
  }
}
</script>
</body>
</html>