<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="user1.User5VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	List<User5VO> users = new ArrayList<>();
	
	
	try{
		
	//1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3단계 - SQL 실행 객체 생성
	Statement stmt = conn.createStatement();
	
	
	//4단계 - SQL 실행
	String sql = "select * from `user5`";
	ResultSet rs = stmt.executeQuery(sql);
			
	//5단계 - 결과 처리
	while(rs.next()){
		User5VO vo = new User5VO();
		vo.setSeq(rs.getInt(1));
		vo.setName(rs.getString(2));
		vo.setGender(rs.getString(3));
		vo.setAge(rs.getInt(4));
		vo.setAddr(rs.getString(5));
		
		users.add(vo);
		
	}
	
	
	//6단계 - DB종료
	rs.close();
	stmt.close();
	conn.close();
	
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User1 : List.jsp</title>

<script type="text/javascript">
		
	function call_confirm(e) {
		if(confirm("삭제하시겠습니까?")){
			alert("삭제됨");
		}else{
			alert("삭제안됨 ㅋ");
			e.preventDefault();
		}
	}
		
</script>

<style>
 table{
 	text-align: center;
 }
</style>

</head>
<body>
	<h3>User2 목록</h3>
	<a href = "/ch06/1.jdbcTest.jsp">처음으로</a>
	<a href = "/ch06/user5/register.jsp">등록</a>
	
	<table border = 1 >
		<tr>
			<th>순번</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>주소</th>
			<th>관리</th>		
		</tr>
		<% for(User5VO vo : users){ %>
		<tr>
			<td><%= vo.getSeq() %></td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getGender() %></td>
			<td><%= vo.getAge() %></td>
			<td><%= vo.getAddr() %></td>
			<td>
				<a href="/ch06/user5/modify.jsp?uid=<%= vo.getSeq() %>">수정</a>
				<a class = "test" onclick="call_confirm(event)" href ="/ch06/user5/delete.jsp?uid=<%= vo.getSeq() %>" >삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
	
</body>
</html>