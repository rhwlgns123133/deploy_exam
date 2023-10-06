<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>


	<%
		Connection connection = null;
		
		try{
			String url = "jdbc:mariadb://localhost:3306/sample";
			String user = "root";
			String password = "9719";
			
			Class.forName("org.mariadb.jdbc.Driver");
			
			connection = DriverManager.getConnection(url, user, password);
		}catch(SQLException e){
			out.println("데이터베이스 연결 실패아혀씁니다");
			out.println("SQLException :" + e.getMessage());
		}
	%>
	<%
		String orderId = (String)session.getAttribute("orderId");
			if(orderId  == null){
			String sessionId = session.getId();
		
			//현재 날짜와 시간 가져오기
			java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			String currenDateTime = simpleDateFormat.format(new java.util.Date());
			
			orderId= currenDateTime + "-" + sessionId;
			session.setAttribute("orderId", orderId);
		}
	%>
