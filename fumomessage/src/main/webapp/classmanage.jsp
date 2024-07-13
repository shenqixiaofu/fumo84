<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.banji"%>
<%@ page import="dao.banjidao"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班级管理界面</title>
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
		<table class="table">
			<tr>
				<td>班级编号</td>
				<td>班级名称</td>
				<td>所属部门</td>
				<td>所属学院</td>
				<td width="200px"><a class="btn btn-outline-primary"
					href="addclass.jsp" role="button" target="_self">添加班级</a></td>
			</tr>
			<%
			List<banji> list = banjidao.getList();
			Iterator<banji> iter = list.iterator();
			while (iter.hasNext()) {
				banji banji = iter.next();
			%>
			<tr>
				<td width="100px"><%=banji.getCno()%></td>
				<td width="120px"><%=banji.getClassname()%></td>
				<td width="150px"><%=banji.getDepartment()%></td>
				<td width="180px"><%=banji.getCollege()%></td>
				<td width="120px">
					<%--将 number 参数传过去 --%> <a class="btn btn-primary" href="#"
					onclick="deleteclass(<%=banji.getId()%>)" role="button">删除</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%--
              因为修改是要先 获取number 得到全部信息
              在修改所以传了一个参数  ?number=<%=student.getNumber()%>
            --%> <a class="btn btn-info"
					href="updateclass.jsp?cno=<%=banji.getCno()%>"
					role="button" target="_self">修改</a>
				</td>
			</tr>

			<%
			}
			%>
		</table>
	</div>
		<script>
function deleteclass(id) {
  if (confirm("该操作不可逆，确定要删除该班级吗？")) {
    window.location.href = "deleteclass.jsp?id=" + id;
  }
}
</script>
</body>
</html>