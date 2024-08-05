<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- 
		날짜 : 2024-08-05
		이름 : 조수빈
		내용 : request 내장객체 실습하기
			
	 -->
</head>
<body>
	<h3>1.request 내장객체</h3>

	<h4>GET 요청방식</h4>
	<form action="./proc/result1.jsp" method="get">
		<label>ID : </label><input type="text" name="uid"><br>
		<label>이름 : </label><input type="text" name="name"><br>
		<label>나이 : </label><input type="number" name="age"><br>
		<input type="submit" value="전송">
	</form>
	
		
	
	<h4>POST 요청방식</h4>
	<form action="./proc/result2.jsp" method="post">
		<label>ID : </label><input type="text" name="uid"><br>
		<label>이름 : </label><input type="text" name="name"><br>
		<label>나이 : </label><input type="number" name="age"><br>
		<input type="submit" value="전송">
	</form>
	
	
	<h4>request 기타 정보</h4>
	<p>
		헤더정보 : <%= request.getHeader("User-Agent") %><br>
		프로토콜 : <%= request.getProtocol() %><br>
		서버이름 : <%= request.getServerName() %><br>
		요청주소 : <%= request.getRequestURI() %><br>
		요청정보 : <%= request.getRequestURL() %><br>
		ip주소 : <%= request.getRemoteAddr() %>
	
	
	</p>
	
	
	
</body>
</html>