<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신 처리
	String seq   = request.getParameter("seq");
	String name  = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age    = request.getParameter("age");
	String addr   = request.getParameter("addr");
	
	// 데이터 베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	try{
		//드라이버 호출
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//1단계 DB접속
		Connection conn = DriverManager.getConnection(host, user, pass);		
		
		//2단계 SQL 실행 객체 생성
		String sql = "INSERT INTO user5 (name, gender, age, addr) VALUES (?, ?, ?, ?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, addr);
		
		
		//3단계 SQL 실행
		
		psmt.executeUpdate();
		
		//4단계 결과 처리(SELECT일 경우)
		
		
		//5단계 DB종료
		psmt.close();
		conn.close();
		
	}catch (Exception e){
		e.printStackTrace();
	}
	
	// 목록 이동
	response.sendRedirect("/ch06/user5/list.jsp");
%>