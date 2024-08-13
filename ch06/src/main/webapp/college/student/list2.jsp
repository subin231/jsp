<%@ page import="java.sql.DriverManager, java.sql.Connection, java.sql.ResultSet, java.sql.Statement" %>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page import="college.StudentVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    List<StudentVO> students = new ArrayList<>();

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        String jdbcUrl = "jdbc:sqlserver://127.0.0.1:1433;instanceName=SQLEXPRESS;databaseName=studydb;";
        String jdbcId = "LOTTE4";
        String jdbcPw = "lotte4";

        Connection conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
        Statement stmt = conn.createStatement();
        String sql = "SELECT * FROM Student"; // SQL query to fetch data
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            StudentVO student = new StudentVO();
            student.setStdno(rs.getString("stdno"));
            student.setStdname(rs.getString("stdname"));
            student.setStdhp(rs.getString("stdhp"));
            student.setStdyear(rs.getInt("stdyear"));
            student.setStdaddr(rs.getString("stdaddr"));
            students.add(student);
        }

        rs.close();
        stmt.close();
        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("연결 실패: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List</title>
    <!--
        날짜 : 2024-08-09
        이름 : 조수빈
        내용 : JSP 데이터베이스 DBCP 실습하기 
    -->
</head>
<body>
    <h3>조회</h3>
    <a href="/ch06/2.DBCPTest.jsp">처음으로</a>
    <a href="/ch06/shop/customer/register.jsp">등록</a>

    <table border="1">
        <tr>
            <th>학생번호</th>
            <th>학생이름</th>
            <th>휴대폰</th>
            <th>학년</th>
            <th>주소</th>
            <th>management</th>
        </tr>
        <% for (StudentVO vo : students) { %>
        <tr>
            <td><%= vo.getStdno() %></td>
            <td><%= vo.getStdname() %></td>
            <td><%= vo.getStdhp() %></td>
            <td><%= vo.getStdyear() %></td>
            <td><%= vo.getStdaddr() %></td>
            <td>
                <a href="#">Edit</a>
                <a href="#">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
