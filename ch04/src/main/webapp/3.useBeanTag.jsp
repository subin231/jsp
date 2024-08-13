<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.useBeanTag</title>
	<!-- 
		날짜: 2024-08-07
		이름: 조수빈
		내용: useBean 실습하기
	 -->
</head>
<body>
	<h3>3.useBeanTag</h3>
	
	<form action="./proc/userProc.jsp" method="post">
		<input type = "text" name = "uid" placeholder = "아이디 입력"><br>
		<input type = "text" name = "name" placeholder = "이름 입력"><br>
		<input type = "text" name = "hp" placeholder = "전화번호 입력"><br>
		<input type = "number" name = "age" placeholder = "나이 입력"><br>
		<input type = "submit" value = "전송하기">
	</form>
	
</body>
</html>