<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.cookieTest</title>
		<!-- 
		날짜: 2024-08-07
		이름: 조수빈
		내용: cookie 실습하기
	 -->
</head>
<body>
	<h3>1.cookieTest</h3>
	
	<form action="./proc/cookieCreate.jsp" method = "post">
		<input type = "text" name = "uid" placeholder ="아이디 입력"><br>
		<input type = "password" name = "pass" placeholder ="패스워드 입력"><br>
		<input type = "submit" value ="로그인">
	</form>
	
</body>
</html>