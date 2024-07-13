<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.user"%>
<%@ page import="dao.userdao"%>
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
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	//创建 user 对象
	user user = new user();
	/*student.setId(id);*/
	user.setUsername(username);
	user.setPassword(password);
	userdao.updateuser(user);
	//返回查看页面
	response.sendRedirect("systemmanage.jsp");
%>
</body>
</html>