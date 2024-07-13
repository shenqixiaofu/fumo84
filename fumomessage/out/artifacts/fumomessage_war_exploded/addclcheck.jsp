<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.banji" %>
<%@ page import="dao.banjidao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>检查班级信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    //获取来自 addstudent.jsp 的表单
    String cno = request.getParameter("cno");
    String classname = request.getParameter("classname");
    String department = request.getParameter("department");
    String college = request.getParameter("college");
    //创建 student 对象
    banji banji = new banji();
    //student.setId(id);
    banji.setCno(cno);
    banji.setClassname(classname);
    banji.setDepartment(department);
    banji.setCollege(college);
    
    banjidao.add(banji);
    //添加完成就返回查看页面
    response.sendRedirect("classmanage.jsp");
%>
</body>
</html>