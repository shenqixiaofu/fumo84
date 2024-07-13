<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.score"%>
<%@ page import="dao.scoredao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String studentnumber = request.getParameter("studentnumber");
	String studentname = request.getParameter("studentname");
	String coursename = request.getParameter("coursename");
	String upscore = request.getParameter("upscore");
	String downscore = request.getParameter("downscore");
	//创建 student 对象
	score score = new score();
	score.setId(id);
	score.setStudentnumber(studentnumber);
	score.setStudentname(studentname);
	score.setCoursename(coursename);
	score.setUpscore(upscore);
	score.setDownscore(downscore);

	scoredao.updateScore(score);
	//返回查看页面
	response.sendRedirect("scoremanage.jsp");
%>
</body>
</html>