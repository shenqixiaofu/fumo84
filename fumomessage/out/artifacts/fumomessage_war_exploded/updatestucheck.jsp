<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.student"%>
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
	//int id = Integer.parseInt(request.getParameter("id"));
	int number = Integer.parseInt(request.getParameter("number"));
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	int age = Integer.parseInt(request.getParameter("age"));
	String classno = request.getParameter("classno");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String department = request.getParameter("department");
	String college = request.getParameter("college");
	//创建 student 对象
	student student = new student();
	/*student.setId(id);*/
	student.setNumber(number);
	student.setName(name);
	student.setSex(sex);
	student.setAge(age);
	student.setClassno(classno);
	student.setPhone(phone);
	student.setEmail(email);
	student.setDepartment(department);
	student.setCollege(college);
	
	studentdao.updateStudent(student);
	//返回查看页面
	response.sendRedirect("studentmanage.jsp");
%>
</body>
</html>