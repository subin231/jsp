<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="theater.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<MovieVO> movies = new ArrayList<>();

	try{
		//1단계 - JNDI 서비스 객체 생성
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
	 	DataSource ds = (DataSource) ctx.lookup("jdbc/theater");
        Connection conn = ds.getConnection();
		
		//3단계 - SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		//4단계 - SQL 실행
		ResultSet rs = stmt.executeQuery("select * from `movies`");
		
		//5단계 - 결과 처리
		while(rs.next()){
			MovieVO vo = new MovieVO();
			vo.setMovie_id(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setGenre(rs.getString(3));
			vo.setRelease_date(rs.getString(4));
		
			movies.add(vo);
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
			<th>영화번호</th>
			<th>제목</th>
			<th>장르</th>
			<th>일자</th>
		</tr>
		<% for(MovieVO vo : movies){ %>
		   <tr>
            <td><%= vo.getMovie_id() %></td>
            <td><%= vo.getTitle() %></td>
            <td><%= vo.getGenre() %></td>
            <td><%= vo.getRelease_date() %></td>
            <td>
                <a href="#">Edit</a>
                <a href="#">Delete</a>
            </td>
        </tr>
		<%} %>
	</table>
	
</body>
</html>