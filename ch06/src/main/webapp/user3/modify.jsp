<%@page import="java.sql.ResultSet"%>
<%@page import="user1.User3VO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
	
	User3VO vo = null;
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	try{
		
	// 1단계
		Class.forName("com.mysql.cj.jdbc.Driver");
	// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
	// 3단계
	String sql = "select * from `user3` where `uid` = ?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);
	// 4단계
	ResultSet rs = psmt.executeQuery();
	
	
	// 5단계
	if(rs.next()){
		vo = new User3VO();
		vo.setUid(rs.getString(1));
		vo.setName(rs.getString(2));
		vo.setBirth(rs.getString(3));
		vo.setHp(rs.getString(4));
		vo.setAddr(rs.getString(5));
		
	}
	rs.close();
	psmt.close();
	conn.close();
	
	// 6단계
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modify</title>
</head>
<body>
	<h3>User2 수정</h3>
	<a href = "/ch06/1.jdbcTest.jsp">처음으로</a>
	<a href = "/ch06/user3/register.jsp">등록</a>
	
	<form action = "/ch06/user3/modifyProc.jsp" method = "post">
		<table border = 1 >
		<tr>
			<td>아이디</td>
			<td><input type = "text" name = "uid" value = <%=vo.getUid() %> readonly="readonly" ></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type = "text" name = "name" value = <%=vo.getName() %>/></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type = "date" name = "birth" value = <%=vo.getBirth() %>/></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type = "text" name = "hp" value = <%=vo.getHp() %>/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type = "text" name = "addr" value = <%=vo.getAddr() %>/></td>
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