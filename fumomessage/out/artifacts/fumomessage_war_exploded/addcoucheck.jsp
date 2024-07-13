<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.course" %>
<%@ page import="dao.coursedao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>检查课程信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    //获取来自 addstudent.jsp 的表单
    String courseno = request.getParameter("courseno");
    String coursename = request.getParameter("coursename");
    String type = request.getParameter("type");
    String period = request.getParameter("period");
    String credit = request.getParameter("credit");
    //创建 student 对象
    course course = new course();
    //student.setId(id);
    course.setCourseno(courseno);
    course.setCoursename(coursename);
    course.setType(type);
    course.setPeriod(period);
    course.setCredit(credit);
    coursedao.add(course);
    //添加完成就返回查看页面
    response.sendRedirect("coursemanage.jsp");
%>
</body>
</html>