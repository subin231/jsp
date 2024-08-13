<%@ page import="sub1.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- 
		날짜: 2024-08-06
		이름: 조수빈
		내용: response 내장객체 실습하기
	 -->
</head>
<body>
	<h3>2.response 내장객체</h3>
	
	<h4>session ID</h4>
	<%= session.getId() %>
	
	<h4>session 설정</h4>
	<%
		String agent = request.getHeader("User-Agent");	
	
		if(agent.contains("Edg")){
			//edge 브라우저
			UserVO user = new UserVO("a101","김유신",25);
			
			session.setAttribute("user", user);
		}else{
			//chrome
			UserVO user = new UserVO("a102","김춘추",30);
			
			session.setAttribute("user", user);
		}
		
		//세션 조회
		UserVO uservo = (UserVO) session.getAttribute("user");
		
		
	%>
	<p>
		아이디 : <%=uservo.getUid() %>
		이름 : <%=uservo.getName() %>
		나이 : <%=uservo.getAge() %>
	</p>
	
</body>
</html>