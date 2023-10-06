<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file ="../inc/dbconn.jsp" %>
	<%
		String productId = request.getParameter("productId");
	
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "select * from product where productId =?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, productId);
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
			sql = "delete from product where productId = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, productId);
			preparedStatement.executeQuery();
		}
		else{
			System.out.println("일치하는 삼품이 없습니다");
		}
		
		if(resultSet != null){resultSet.close();}
		if(preparedStatement != null){preparedStatement.close();}
		if(connection != null){connection.close();}
	%>
</body>
</html>