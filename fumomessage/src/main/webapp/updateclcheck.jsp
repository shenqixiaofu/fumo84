<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.banji"%>
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
	//int id = Integer.parseInt(request.getParameter("id"));
	String cno = request.getParameter("cno");
	String classname = request.getParameter("classname");
	String department = request.getParameter("department");
	String college = request.getParameter("college");
	//创建 course 对象
	banji banji = new banji();
	/*student.setId(id);*/
	banji.setCno(cno);
	banji.setClassname(classname);
	banji.setDepartment(department);
	banji.setCollege(college);

	banjidao.updatebanji(banji);
	//返回查看页面
	response.sendRedirect("classmanage.jsp");
%>
</body>
</html>