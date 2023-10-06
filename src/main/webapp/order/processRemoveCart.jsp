<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Product" %>
<%@page import="dto.Cart"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*"%>
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
		
		try{
			String sql = "DELETE FROM cart";
			preparedStatement = connection.prepareStatement(sql);
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
		
	%>
	<%
		//session.invalidate();//모든 session 삭제 session삭제하면 session으로 db 처리 같이 하기때문에 session 삭제하면 db처리 안됨
		response.sendRedirect("./cart.jsp");//주소이동
	%>
</body>
</html>