<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이메일 전송 TEST</title>
	<!--
		날짜 : 2024-08-13
		이름 : 조수빈
		내용 : 이메일 실습하기
		
		1. 구글 앱 비밀번호 생성
		- 구글 계정 관리 > 보안 > 2단계 인증
		- 구글 계정 관리 > 보안 > 앱 비밀번호(검색이용) > 앱 비밀번호 생성 후 생성 코드 앱 보관하기
		
		2. 라이브러리 추가 (Maven repository)
		- activation 검색 > activatation framwork > activation 1.1.1 jar 다운
		- javax mail 검색 > javamail API > javax.mail 1.6.2 jar 다운로드
		
	 -->
</head>
<body>
	<h3>이메일 전송</h3>
	<form action="./proc/sendEmail.jsp" method = "post">
		<table border = "1">
			<tr>
				<td>보내는 사람</td>
				<td><input type="text" name = "sender"></td>			
			</tr>
			<tr>
				<td>받는 사람</td>
				<td><input type="text" name = "receiver"></td>			
			</tr>
			<tr>
				<td>제목</td>			
				<td><input type="text" name = "title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>			
				<textarea name="content" rows="20" cols="60"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan = "2" align = "right">
					<input type="submit" value ="보내기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>