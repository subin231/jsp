<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 전송 데이터 수신처리 Arrays.toString(hobbies)
	
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String age = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobby");
	String addr = request.getParameter("addr");
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result3</title>
</head>
<body>
<h3>전송데이터 확인</h3>
	<p>
		아이디 : <%= uid %><br>
		이름 : <%= name %><br>
		나이 : <%= age %><br>
		성별 : <%= gender.equals("M") ? "남자" : "여자" %><br>
		취미 : 
		<%
		if (hobbies != null) {
		    for (String hobby : hobbies) {
		        out.print(hobby + ", ");
		    }
		} else {
		    out.print("없음");
		}
		%>
		<br>
		주소 : <%= addr %><br><br>
		<a href="../request.jsp">뒤로가기</a>
	</p>
	
</body>
</html>