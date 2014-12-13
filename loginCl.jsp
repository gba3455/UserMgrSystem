<%@page import="com.model.UserBeanCl"%>
<%@page import="com.model.ConnDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		UserBeanCl ubc = new UserBeanCl();
		
		if(ubc.checkUser(name, password)){
			response.sendRedirect("success.jsp");
		}else{
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>