<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function reset(){
	
}
</script>
</head>
<body>
	<center>
		<h1>ログイン</h1><br>
		<hr>
		<form action="loginCl.jsp" method = "post">
		ユーザ名：<input type = "text" name = "name"><br>
		パスワード<input type = "password" name = "password"><br>
		<input type = "submit" value = "ログイン">
		<input type = "button" value = "リセット">
		</form>
	</center>
</body>
</html>