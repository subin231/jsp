<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="jakarta.tags.core"  %>
<%@ taglib prefix="f"  uri="jakarta.tags.functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 실습하기</title>
	<!--
		날짜 : 2024-08-13
		이름 : 조수빈
		내용 : JSTL(JSP Standard Tag Library) 실습하기
	-->
</head>
<body>
	<h3>2.JSTL 실습하기</h3>
	
	
	<h4>Scriptlet 방식</h4>
	<%
		// 변수 생성
		String str = "hello";
		out.print("<p>str : "+str+"</p>");
		
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		// 조건문
		if(num1 < num2){
			out.print("<p> num1 은 num2 보다 작다</p>");
		}
		
		if(num1 > num2){
			out.print("<p> num1 은 num2 보다 크다</p>");
		}else{
			out.print("<p> num1 은 num2 보다 작다</p>");
		}
		
		if(num1 > num2){
			out.print("<p> num1 은 num2 보다 크다</p>");
		}else if(num2 > num3){
			out.print("<p> num2 은 num3 보다 크다</p>");
		}else
			out.print("<p> num3 제일 크다</p>");
		
		
		for(int i=1; i<=5; i++){
			out.print("<p> : "+i+"</p>");
		}
		
		int sum = 0;
		for(int k=1; k<=10; k++){
			sum+=k;
		}
		out.print("<p> : "+sum+"</p>");
		
		
		String[] cities = {"서울", "대전", "대구", "부산", "광주"};
		for(String city : cities){
			out.print("<p> : "+city+"</p>");
		}
		
		// 문자열 처리
		String hello = "hello world";
		out.print("<p>문자열 길이 : "+hello.length()+"</p>");
		out.print("<p>문자열 지우기 : "+hello.substring(6)+"</p>");
		out.print("<p>문자열 교체 : "+hello.replace("world", "korea")+"</p>");
		out.print("<p>문자열 인덱스 : "+hello.indexOf("e")+"</p>");
		
		
		
	%>
	
	<h4>JSTL 방식</h4>
	<c:set var="username1" value="김연아" />
	<c:set var="username2">박지성</c:set>
	<p>
	user1 : ${username1}<br>
	user2 : ${username2}<br>
	</p>
	<c:set var="num1" value="1"/>
	<c:set var="num2" value="2"/>
	<c:set var="num3" value="3"/>
	
	<!-- 조건문 -->
	<c:if test="${num1 lt num2}">
		<p>num1 은 num2보다 작다</p>
	</c:if>
	
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1 은 num2보다 크다</p>
		</c:when> 
		<c:otherwise>
			<p>num1 은 num2보다 작다</p>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1 은 num2보다 크다</p>
		</c:when> 
		<c:when test="${num2 gt num3}">
			<p>num2 은 num3보다 크다</p>
		</c:when>
		<c:otherwise>
			<p>num3은 제일 크다</p>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="i" begin="1" end="10">
		<p>i : ${i}</p>
	</c:forEach>
	
	<c:set var="sum" value="0"/>
	<c:forEach var="k" begin="1" end="10">
		<c:set var="sum" value="${sum + k}" />
	</c:forEach>
	<p>sum : ${sum}</p>
	
	<c:set var="cities">서울, 대전, 대구, 부산, 광주</c:set>
	<c:forEach var="city" items = "${cities}">
		<p>city : ${city}</p>
	</c:forEach>
	
	<!-- 문자열 처리 -->
	<c:set var ="hello" value="hello world"/>
	<p>문자열 길이 : ${f:length(hello)}</p>
	<p>문자열 자르기 : ${f:substring(hello,6 , 12)}</p>
	<p>문자열 교체 : ${f:replace(hello, "world", "busan")}</p>
	<p>문자열 인덱스 : ${f:indexOf(hello, "e")}</p>
	
	
	
</body>
</html>