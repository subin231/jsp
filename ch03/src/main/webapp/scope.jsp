<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7.scope</title>
	<!-- 
		날짜: 2024-08-07
		이름: 조수빈
		내용: scope 내장객체 실습하기
	 -->
</head>
<body>
	<h3>7.scope 내장 객체 영역</h3>
	<%
		pageContext.setAttribute("name", "김유신");
		request.setAttribute("name", "김춘추");
		session.setAttribute("name", "장보고");
		application.setAttribute("name", "강감찬");
	%>
	<h4>내장객체 값 확인</h4>
	<p>
		pageContext 값 : <%= pageContext.getAttribute("name") %><br>
		request 값 : <%= request.getAttribute("name") %><br>
		session 값 : <%= session.getAttribute("name") %><br>
		application 값 : <%= application.getAttribute("name") %>
	</p>
	
	
</body>
</html>