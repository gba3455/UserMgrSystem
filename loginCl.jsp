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
		HttpSession mySession = request.getSession();
		Class.forName("com.mysql.jdbc.Driver");
		Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:8889/blog", "root", "root");
		Statement st = ct.createStatement();
		ResultSet rs = st.executeQuery("select pass from blog.users where account ='" + name + "'");
		if(rs.next()){
			String pass = rs.getString(1);
			if(pass.equals(password)){
				response.sendRedirect("success.jsp?name="+name);
			}else{
				response.sendRedirect("login.jsp?errorCode = 1");
			}
		}else{
				response.sendRedirect("login.jsp?errorCode = 2");
		}
		/*
		if(name.equals("admin")){
			if(password.equals("password")){
				mySession.setAttribute("name", name);
				response.sendRedirect("success.jsp?name="+name);
			}else{
				response.sendRedirect("faild.jsp");
			}
		}else{
			response.sendRedirect("faild.jsp");
		}
		*/
	%>
</body>
</html>