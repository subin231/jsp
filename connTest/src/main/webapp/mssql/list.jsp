<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="bank.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	String host = "jdbc:sqlserver://localhost:1433;DatabaseName=stduydb;encrypt=false";
	String user = "sa";
	String pass = "lotte4";
	
	List<AccountVO> accounts = new ArrayList<>();
	
	try{
		//1단계 - JDBC 드라이버 로드
	    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		
		//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
	 	Connection conn = DriverManager.getConnection(host, user, pass);
	 	System.out.println("연결 성공");
		//3단계 - SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		//4단계 - SQL 실행
		String sql = "select * from OPENQUERY([LINK_MYSQL], 'SELECT * FROM bank.bank_account')";
		ResultSet rs = stmt.executeQuery(sql);
		//5단계 - 결과 처리
		while(rs.next()){
			AccountVO vo = new AccountVO();
			vo.setA_no(rs.getString(1));
			vo.setA_item_dist(rs.getString(2));
			vo.setA_item_name(rs.getString(3));
			vo.setA_c_no(rs.getString(4));
			vo.setA_balance(rs.getString(5));
			vo.setA_open_date(rs.getString(6));
			accounts.add(vo);
		}
	
		//6단계 - 커넥션 반납
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<title>mssql</title>
	<!--
		날짜 : 2024-08-09
		이름 : 조수빈
		내용 : JSP 데이터베이스 DBCP 실습하기 
	 -->
</head>
<body>
	<h3>조회</h3>
	<a href="../connectionTest.jsp">처음으로</a>
	<a href="/ch06/shop/customer/register.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>고객번호</th>
			<th>계좌종류</th>
			<th>계좌이름</th>
			<th>계좌번호</th>
			<th>잔액</th>
			<th>가입일</th>
			<th>관리</th>
		</tr>
		<% for(AccountVO vo : accounts){ %>
		   <tr>
            <td><%= vo.getA_no() %></td>
            <td><%= vo.getA_item_dist() %></td>
            <td><%= vo.getA_item_name() %></td>
            <td><%= vo.getA_c_no() %></td>
            <td><%= vo.getA_balance() %></td>
            <td><%= vo.getA_open_date() %></td>
            <td>
                <a href="#">Edit</a>
                <a href="#">Delete</a>
            </td>
        </tr>
		<%} %>
	</table>
	
</body>
</html>