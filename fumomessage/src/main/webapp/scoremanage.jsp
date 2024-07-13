<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.score"%>
<%@ page import="dao.scoredao"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成绩管理界面</title>
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
				<li class="nav-item"><a class="nav-link active" href="scoremanage.jsp"
					target="_self">成绩管理</a></li>
				<li class="nav-item"><a class="nav-link" href="classmanage.jsp"
					target="_self">班级资料管理</a></li>
				<li class="nav-item"><a class="nav-link"
					href="systemmanage.jsp" target="_self">系统管理</a></li>
			</ul>
		</div>
		<table class="table">
			<tr>
				<td>ID</td>
				<td>学号</td>
				<td>姓名</td>
				<td>课程名称</td>
				<td>上学期成绩</td>
				<td>下学期成绩</td>
				<td width="200px"><a class="btn btn-outline-primary"
					href="addscore.jsp" role="button" target="_self">添加成绩</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-info" href="searchscore.jsp" role="button"
					target="_self">查询成绩</a></td>
			</tr>
			<%
			List<score> list = scoredao.getList();
			Iterator<score> iter = list.iterator();
			while (iter.hasNext()) {
				score score = iter.next();
			%>
			<tr>
				<td width="100px"><%=score.getId()%></td>
				<td width="100px"><%=score.getStudentnumber()%></td>
				<td width="150px"><%=score.getStudentname()%></td>
				<td width="180px"><%=score.getCoursename()%></td>
				<td width="150px"><%=score.getUpscore()%></td>
				<td width="150px"><%=score.getDownscore()%></td>
				<td width="150px">
					<%--将 number 参数传过去 --%> 
				<a class="btn btn-primary" href="#"
					onclick="deletescore(<%=score.getId()%>)" role="button">删除</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%--
              因为修改是要先 获取id 得到全部信息
              再修改所以传了一个参数  ?id=<%=student.getCoursename()%>
            --%> <a class="btn btn-info"
					href="updatescore.jsp?id=<%=score.getId()%>"
					role="button" target="_self">修改</a>
				</td>
			</tr>

			<%
			}
			%>
		</table>
	</div>
	<script>
function deletescore(id) {
  if (confirm("该操作不可逆，确定要删除该成绩吗？")) {
    window.location.href = "deletescore.jsp?id=" + id;
  }
}
</script>
</body>
</html>