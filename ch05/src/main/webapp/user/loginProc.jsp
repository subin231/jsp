<%@page import="sub1.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	
	// 전송 데이터 수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	String auto = request.getParameter("auto");
	
	
	//데이터베이스 작업 생략(1~6단계)
		
	
	
	//id :abc123/pass : 1234 가정
	if(uid.equals("abc123") && pass.equals("1234")){
		
		//자동 로그인 처리
		if(auto != null){
			
			Cookie autoCookie = new Cookie("auto", uid);
			autoCookie.setMaxAge(60 * 3);
			autoCookie.setPath("/ch05"); // 쿠키 경로 : 해당 경로 하위에서 참조가능하기에 전체(project)로 맞춤
			response.addCookie(autoCookie);
		}
		
		
		
		//회원일 경우 --> 사용자 객체 생성 후 세션 저장
		userVO userVO = new userVO(); 
		
		userVO.setUid("abc123");
		userVO.setPass("1234");
		userVO.setName("홍길동");
		userVO.setAge(23);
		
		session.setAttribute("sessUser", userVO);
		
		//로그인 성공 후 이후 페이지 이동
		response.sendRedirect("./loginSuccess.jsp");
		
	}else{
		//회원일 아닐 경우
		response.sendRedirect("./login.jsp?success=100");		
	}
	
	
%>