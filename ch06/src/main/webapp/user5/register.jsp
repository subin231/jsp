<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register</title>
</head>
<body>
	<h3>User2 등록</h3>
	<a href = "/ch06/1.jdbcTest.jsp">처음으로</a>
	<a href = "/ch06/user2/register.jsp">등록</a>
	
	<form action = "/ch06/user5/registerProc.jsp" method = "post">
		<table border = 1 >
		<tr>
			<td>순번</td>
			<td><input type = "number" name = "seq" readonly="readonly"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type = "text" name = "name"/></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type = "text" name = "gender"/></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type = "number" name = "age"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type = "text" name = "addr"/></td>
		</tr>
		<tr>
			<td colspan = "2" align = "right">
				<input type = "submit" value = "등록하기"/>
			</td>
		</tr>
		</table>
	</form>
	
</body>
</html>