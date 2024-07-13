<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.studentdao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int number = Integer.parseInt(request.getParameter("number"));
//调用删除方法，实现删除操作
    studentdao.delete(number);
//实现页面跳转
    response.sendRedirect("studentmanage.jsp");
%>
</body>
</html>