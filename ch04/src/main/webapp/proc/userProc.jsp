<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class = "sub1.UserDTO"></jsp:useBean>
<jsp:setProperty property="uid" name="user"/>
<jsp:setProperty property="name" name="user"/>
<jsp:setProperty property="hp" name="user"/>
<jsp:setProperty property="age" name="user"/>

<%
	String uid  = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp   = request.getParameter("hp");
	String age  = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userProc</title>
</head>
<body>
<table border = 1px>
	<tr>
		<td>
		아이디 : 		<%= uid %>	
		</td>
	</tr>
	<tr>
		<td>
		이름 : 		<%= name %>
		</td>
	</tr>
	<tr>
		<td>
		전화번호 :	<%= hp %>	
		</td>
	</tr>
	<tr>
		<td>
		나이 :	 	<%= age %>	
		</td>
	</tr>
	<p>
		아이디 : <%= user.getUid() %>
		아이디 : <%= user.getName() %>
		아이디 : <%= user.getHp() %>
		아이디 : <%= user.getAge() %>
	</p>
	<a href = "./3.useBeanTag.jsp">뒤로가기</a>
</table>
</body>
</html>