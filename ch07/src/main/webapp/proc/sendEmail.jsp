<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//기본정보
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String appPass = "구글 개인 앱 비밀번호"; // 구글 개인 앱 비밀번호
	
	// SMTP 설정
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "465");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.ssl.enable", "true");
	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	// gmail session 생성
	Session gmailSession = Session.getInstance(props, new Authenticator(){
		
		@Override
		protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
			return new PasswordAuthentication(sender, appPass);
		}
		
	});
	
	// mail 발송
	try{
		Message msg = new MimeMessage(gmailSession);
		msg.setFrom(new InternetAddress(sender, "보내는사람", "UTF-8"));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		msg.setContent(content, "text/html; charset=UTF-8");
		
		Transport.send(msg);
	}
	catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}

	
	
	
	// 이메일 입력 폼 이동
	response.sendRedirect("../3.emailTest.jsp");
%>