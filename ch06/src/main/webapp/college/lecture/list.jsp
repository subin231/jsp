<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="college.LectureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<LectureVO> lectures = new ArrayList<>();
	try{
		//1단계 - JNDI 서비스 객체 생성
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
	 	DataSource ds = (DataSource) ctx.lookup("jdbc/college");
        Connection conn = ds.getConnection();
		
		//3단계 - SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		//4단계 - SQL 실행
		ResultSet rs = stmt.executeQuery("select * from lecture");
		
		//5단계 - 결과 처리
		while(rs.next()){
			LectureVO vo = new LectureVO();
			vo.setLecno(rs.getInt(1));
			vo.setLecname(rs.getString(2));
			vo.setLecCredit(rs.getInt(3));
			vo.setLectime(rs.getInt(4));
			vo.setLecClass(rs.getString(5));
			
			lectures.add(vo);
		}
		
		//6단계 - 커넥션 반납
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<title>list</title>
	<!--
		날짜 : 2024-08-09
		이름 : 조수빈
		내용 : JSP 데이터베이스 DBCP 실습하기 
	 -->
</head>
<body>
	<h3>고객등록</h3>
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a>
	<a href="/ch06/shop/customer/register.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>고객아이디</th>
			<th>고객명</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>가입일</th>
			<th>관리</th>
		</tr>
		<% for(LectureVO vo : lectures){ %>
		   <tr>
            <td><%= vo.getLecno() %></td>
            <td><%= vo.getLecname() %></td>
            <td><%= vo.getLecCredit() %></td>
            <td><%= vo.getLectime() %></td>
            <td><%= vo.getLecClass() %></td>
            <td>
                <a href="#">Edit</a>
                <a href="#">Delete</a>
            </td>
        </tr>
		<%} %>
	</table>
	
</body>
</html>