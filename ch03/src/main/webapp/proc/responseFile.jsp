<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>responseFile</title>
	<!-- 
		날짜: 2024-08-06
		이름: 조수빈
		내용: responseFile 실습하기
	
	 -->
</head>
<body>
	<h3>파일 다운로드</h3>
	<%
		// 해당 페이지를 브라우저에 출력하지 않고 파일로 다운로드(다운은 html 또는 jsp파일로 다운됨)
		response.setHeader("Content-Type", "application/octet-stream");
	%>
	
	
	
</body>
</html>