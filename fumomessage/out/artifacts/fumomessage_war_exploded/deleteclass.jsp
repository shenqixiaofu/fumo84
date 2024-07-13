<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.banjidao"%>
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
//调用删除方法，实现删除操作
    banjidao.delete(id);
//实现页面跳转
    response.sendRedirect("classmanage.jsp");
%>
</body>
</html>