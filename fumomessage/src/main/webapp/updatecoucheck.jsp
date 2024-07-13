<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.course"%>
<%@ page import="dao.coursedao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	//int id = Integer.parseInt(request.getParameter("id"));
	String courseno = request.getParameter("courseno");
	String coursename = request.getParameter("coursename");
	String type = request.getParameter("type");
	String period = request.getParameter("period");
	String credit = request.getParameter("credit");
	//创建 course 对象
	course course = new course();
	/*student.setId(id);*/
	course.setCourseno(courseno);
	course.setCoursename(coursename);
	course.setType(type);
	course.setPeriod(period);
	course.setCredit(credit);
	coursedao.updateCourse(course);
	//返回查看页面
	response.sendRedirect("coursemanage.jsp");
%>
</body>
</html>