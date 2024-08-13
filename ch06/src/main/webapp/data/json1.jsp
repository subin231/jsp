<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String jsonData = "{\"uid\": \"a101\", \"name\": \"홍길동\", \"age\": \"23\", \"addr\": \"부산\"}";
	
	//json 출력
	out.print(jsonData);
	
%>