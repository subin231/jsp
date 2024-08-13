<%@page import="user1.User1VO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    StringBuilder requestBody = new StringBuilder();
    BufferedReader reader = request.getReader();
    String line;
    while ((line = reader.readLine()) != null) {
        requestBody.append(line);
    }
    reader.close();
    
    Gson gson = new Gson();
    JsonObject jsonObject = null;
    JsonArray jsonArray = null;
    
    // Try parsing as JsonObject first
    try {
        jsonObject = gson.fromJson(requestBody.toString(), JsonObject.class);
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    // If parsing as JsonObject fails, try parsing as JsonArray
    if (jsonObject == null) {
        try {
            jsonArray = gson.fromJson(requestBody.toString(), JsonArray.class);
            if (jsonArray != null && !jsonArray.isEmpty()) {
                jsonObject = jsonArray.get(0).getAsJsonObject();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // Proceed if jsonObject is not null
    if (jsonObject != null) {
        String uid = jsonObject.has("uid") ? jsonObject.get("uid").getAsString() : null;
        String name = jsonObject.has("name") ? jsonObject.get("name").getAsString() : null;
        String birth = jsonObject.has("birth") ? jsonObject.get("birth").getAsString() : null;
        String hp = jsonObject.has("hp") ? jsonObject.get("hp").getAsString() : null;
        String age = jsonObject.has("age") ? jsonObject.get("age").getAsString() : null;
        
        int rowCount = 0;
        
        try {
            Context initCtx = new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
            Connection conn = ds.getConnection();
            
            String sql = "INSERT INTO user1 (uid, name, birth, hp, age) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, uid);
            psmt.setString(2, name);
            psmt.setString(3, birth);
            psmt.setString(4, hp);
            psmt.setString(5, age);
            
            rowCount = psmt.executeUpdate();
            
            psmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            rowCount = 0; // 실패 시 0으로 설정
        }
        
        JsonObject json = new JsonObject();
        json.addProperty("result", rowCount);
        
        response.setContentType("application/json");
        out.print(json.toString());
    } else {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        JsonObject json = new JsonObject();
        json.addProperty("error", "Invalid JSON format");
        out.print(json.toString());
    }
%>
