<%@page import="com.model.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.UserBeanCl"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	<h1>ユーザー管理システム</h1>
	<%=name %>さん、いらっしゃいませ～
	<a href = "login.jsp">ログイン画面に戻る</a>
	<hr>
	<h2>ログイン成功</h2>
	<%
	int pageNow = 1;
	
	String s_pageNow = request.getParameter("pageNow");
	if(s_pageNow != null){
		pageNow = Integer.parseInt(s_pageNow);
	}
	
	UserBeanCl ubc = new UserBeanCl();
	ArrayList<UserBean> al = ubc.getUsersByPage(pageNow);
	
	%>
	<table border = "1">
		<tr><td>id</td><td>account</td><td>pass</td><td>name</td></tr>
		<%
		for(UserBean ub : al){
		%><tr>
		<td><%=ub.getUserId() %></td>
		<td><%=ub.getAccount() %></td>
		<td><%=ub.getPass() %></td>
		<td><%=ub.getName() %></td>
		</tr>
		<%}
		%>
	</table>

	<%
	int pageCount = ubc.getPageCount();
	out.print("<a href = success.jsp?pageNow=" + 1 + ">最初のページ&nbsp;</a>");
	if(pageNow != 1){
	out.print("<a href = success.jsp?pageNow=" + (pageNow-1) + ">前のページ</a>");
	}
	
		for(int i = 1; i <= pageCount; i++){
			out.print("<a href = success.jsp?pageNow=" + i + ">[" + i + "]</a>");
		}
	if(pageNow != pageCount){
	out.print("<a href = success.jsp?pageNow=" + (pageNow+1) + ">次のページ</a>");
	}
	out.print("<a href = success.jsp?pageNow=" + pageCount + ">&nbsp;最後のページ</a>");
	%>
	</center>
</body>
</html>