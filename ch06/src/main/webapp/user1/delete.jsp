<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	
	// DB 수정 처리
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	try{
		//드라이버 호출
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//1단계 DB접속
		Connection conn = DriverManager.getConnection(host, user, pass);		
		
		//2단계 SQL 실행 객체 생성
		String sql = "delete from `user1` where `uid` = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		
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
	response.sendRedirect("/ch06/user1/list.jsp");
	
%>