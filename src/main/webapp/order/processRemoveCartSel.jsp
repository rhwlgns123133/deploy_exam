<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Product" %>
<%@page import="dto.Cart"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*"%>
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
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String[] checkedId = request.getParameterValues("checkedId");
		for(String s : checkedId){
			try{
				String sql = "DELETE FROM cart WHERE (productId = ?)";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, s);
				preparedStatement.executeUpdate();
			}
			catch(SQLException e){
				out.println("SQLException : " + e.getMessage());
			}
			finally{
			if(preparedStatement != null){
				preparedStatement.close();}
			if(connection != null){
				connection.close();}
			}
		}
	
		response.sendRedirect("./cart.jsp");
	%>
</body>
</html>