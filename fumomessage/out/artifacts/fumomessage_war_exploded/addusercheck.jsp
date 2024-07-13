<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.user" %>
<%@ page import="dao.userdao" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    //获取来自 addstudent.jsp 的表单
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Date d = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String now = df.format(d);
    //创建 student 对象
    user user = new user();
    //student.setId(id);
    user.setUsername(username);
    user.setPassword(password);
	user.setZhuceday(now);
    
    userdao.add(user);
    //添加完成就返回查看页面
    response.sendRedirect("login.jsp");
%>
</body>
</html>