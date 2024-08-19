<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>index</title>
	<!-- 
		날짜 : 2024-08-19
		이름 : 조수빈
		내용 : 프로젝트 로그와 배포 실습하기
		
		로그 라이브러리
		  - logback-classic 1.5.7.jar
		  - logback-core 1.5.7.jar
		  - slf4j-api-2.0.15.jar
		
		로그 설정  
		  - WEB-INF/classes 디렉터리 생성
		  - logback.xml 파일 생성(어팬터 설정, 로그레벨은 공식 사이트 참조 : https://logback.qos.ch/manual/configuration.html)
		  - c:/logs/ch11/log 파일 생성 및 확인
		
		로그 레벨
		  - 개발할 때 -> debug
		  - 운영할 때 -> info
		  
	 -->
</head>
<body>
	<h3>11장.프로젝트 로그인 배포</h3>
	
	<a href = "/ch11/customer/list.do">회원목록</a>
	<a href = "/ch11/product/list.do">상품목록</a>
	
</body>
</html>