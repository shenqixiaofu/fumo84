<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.user"%>
<%@ page import="dao.userdao"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系统管理界面</title>
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
		<div class="row">
			<div class="col-12">
				<ul class="nav nav-tabs justify-content-end">
					<li class="nav-item"><a class="nav-link"
						href="studentmanage.jsp" target="_self">学生管理</a></li>
					<li class="nav-item"><a class="nav-link" href="coursemanage.jsp"
						target="_self">课程管理</a></li>
					<li class="nav-item"><a class="nav-link" href="scoremanage.jsp"
						target="_self">成绩管理</a></li>
					<li class="nav-item"><a class="nav-link" href="classmanage.jsp"
						target="_self">班级资料管理</a></li>
					<li class="nav-item"><a class="nav-link active" href="systemmanage.jsp"
						target="_self">系统管理</a></li>
				</ul>
			</div>
		</div>
		<table class="table">
			<tr>
				<td>ID</td>
				<td>用户名称</td>
				<td>注册日期</td>
				<td width="200px"><a class="btn btn-outline-primary"
					href="adduser.jsp" role="button" target="_self">添加用户</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-outline-danger" href="login.jsp" role="button"
					target="_self">退出系统</a></td>
			</tr>
			<%
			List<user> list = userdao.getList();
			Iterator<user> iter = list.iterator();
			while (iter.hasNext()) {
				user user = iter.next();
			%>
			<tr>
				<td width="100px"><%=user.getId()%></td>
				<td width="120px"><%=user.getUsername()%></td>
				<td width="150px"><%=user.getZhuceday()%></td>
				<td width="120px">
					<%--将 number 参数传过去 --%> <a class="btn btn-primary" href="#"
					onclick="deleteuser(<%=user.getId()%>)" role="button">删除</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-info"
					href="updatepassword.jsp?username=<%=user.getUsername()%>"
					role="button" target="_self">修改</a>
				</td>
			</tr>

			<%
			}
			%>
		</table>
	</div>
		<script>
function deleteuser(id) {
  if (confirm("该操作不可逆，确定要删除该用户吗？")) {
    window.location.href = "deleteuser.jsp?id=" + id;
  }
}
</script>
</body>
</html>