<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="college.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<StudentVO> students = new ArrayList<>();
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
		ResultSet rs = stmt.executeQuery("select * from student");
		
		//5단계 - 결과 처리
		while(rs.next()){
			StudentVO vo = new StudentVO();
			vo.setStdno(rs.getString(1));
			vo.setStdname(rs.getString(2));
			vo.setStdhp(rs.getString(3));
			vo.setStdyear(rs.getInt(4));
			vo.setStdaddr(rs.getString(5));
			
			students.add(vo);
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
			<th>학생번호</th>
			<th>학생이름</th>
			<th>휴대폰</th>
			<th>학년</th>
			<th>주소</th>
			<th>management</th>
		</tr>
		<% for(StudentVO vo : students){ %>
		   <tr>
            <td><%= vo.getStdno() %></td>
            <td><%= vo.getStdname() %></td>
            <td><%= vo.getStdhp() %></td>
            <td><%= vo.getStdyear() %></td>
            <td><%= vo.getStdaddr() %></td>
            <td>
                <a href="#">Edit</a>
                <a href="#">Delete</a>
            </td>
        </tr>
		<%} %>
	</table>
	
</body>
</html>