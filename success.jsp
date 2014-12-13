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
	HttpSession mySession = request.getSession();
	String nameBySession = (String)mySession.getAttribute("name");
	//传字符串没有必要用session和cookie
	String name = request.getParameter("name");
	%>
	<center>
	<h1>ログイン成功</h1>
	<%=name %>さん、いらっしゃいませ～
	<a href = "login.jsp">ログイン画面に戻る</a>
	</center>
</body>
</html>