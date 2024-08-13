<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="sub1.FileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String no = request.getParameter("no");    
    FileVO vo = null;    

    try {
        // DB에서 파일 정보 가져오기
        Context ctx = (Context) new InitialContext().lookup("java:comp/env");
        DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
        Connection conn = ds.getConnection();
        
        // 파일 정보 조회
        String selectSql = "SELECT sname FROM filetest WHERE no=?";
        PreparedStatement selectPsmt = conn.prepareStatement(selectSql);
        selectPsmt.setString(1, no);
        ResultSet rs = selectPsmt.executeQuery();
        
        if (rs.next()) {
            String sname = rs.getString("sname");
            vo = new FileVO();
            vo.setSname(sname);
        }
        rs.close();
        selectPsmt.close();
        
        // 파일 삭제
        if (vo != null) {
            String path = application.getRealPath("./uploads");
            File file = new File(path + File.separator + vo.getSname());
           
            System.out.println("path : " +path);
            System.out.println("File.separator : " + File.separator);
 			System.out.println("File path: " + file.getAbsolutePath());
            
            if (file.exists()) {
                boolean deleted = file.delete();
                if (deleted) {
                    System.out.println("삭제 성공");
                } else {
                    System.out.println("삭제 실패");
                }
            } else {
                System.out.println("파일 못 찾음");
            }
        }
        // 데이터베이스에서 레코드 삭제
        String deleteSql = "DELETE FROM filetest WHERE no=?";
        PreparedStatement deletePsmt = conn.prepareStatement(deleteSql);
        deletePsmt.setString(1, no);
        deletePsmt.executeUpdate();
        deletePsmt.close();
        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
    
    response.sendRedirect("../2.fileDownloadTest.jsp");
%>
