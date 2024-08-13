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
	
	<h4>확인문제</h4>
	<form action="./proc/result3.jsp" method = "post">
	<table border = "1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid" placeholder="아이디 입력"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pass" placeholder="패스워드 입력"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" placeholder="이름 입력"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date" name="birth" placeholder="생년월일 입력"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label></label><input type="radio" name="gender" value="M">남</label>
				<label></label><input type="radio" name="gender" value="F">여</label>
			</td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
				<label></label><input type="checkbox" name="hobby" value="등산">등산</label>
				<label></label><input type="checkbox" name="hobby" value="독서">독서</label>
				<label></label><input type="checkbox" name="hobby" value="영화">영화</label>
				<label></label><input type="checkbox" name="hobby" value="운동">운동</label>
				<label></label><input type="checkbox" name="hobby" value="음악">음악</label>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<select name="addr">
					<option>서울</option>
					<option>대전</option>
					<option>대구</option>
					<option>부산</option>
					<option>광주</option>
				</select>			
			</td>
		</tr>
		
		<tr>
			<td colspan = "2" align="right">
				<input type="submit" value="전송하기">
			</td>
		</tr>		
	</table>
	</form>
</body>
</html>