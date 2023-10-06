<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file ="../inc/dbconn.jsp" %>
	<% 
		request.setCharacterEncoding("UTF-8");
		
		String folder = "C:\\upload";
		int maxSize = 5*1024*1024;
		String encType = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, folder, maxSize, encType,
				new DefaultFileRenamePolicy());
	
		String productId = multipartRequest.getParameter("productId");
		String productName = multipartRequest.getParameter("productName");
		String unitPrice = multipartRequest.getParameter("unitPrice");
		String description = multipartRequest.getParameter("description");
		String manufacturer = multipartRequest.getParameter("manufacturer");
		String category = multipartRequest.getParameter("category");
		String unitsInStock = multipartRequest.getParameter("unitsInStock");
		String condition = multipartRequest.getParameter("condition");
		String fileName = multipartRequest.getFilesystemName("fileName");
		
		Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
		Long stock = unitsInStock.isEmpty() ? 0L : Long.parseLong(unitsInStock);
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		String sql = "select * from product where productId = ?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, productId);
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
			if(fileName != null){
				sql = "update product set productName= ?, unitPrice= ?, description= ?, manufacturer= ?," +
						"category=?, unitsInStock= ?, `condition`=?, fileName=? where productId =?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, productName);
				preparedStatement.setInt(2, price);
				preparedStatement.setString(3, description);
				preparedStatement.setString(4, manufacturer);
				preparedStatement.setString(5, category);
				preparedStatement.setLong(6, stock);
				preparedStatement.setString(7, condition);
				preparedStatement.setString(8, fileName);
				preparedStatement.setString(9, productId);
				preparedStatement.executeUpdate();
			}
			else{
				sql = "update product set productName= ?, unitPrice= ?, description= ?, manufacturer= ?," +
						"category=?, unitsInStock= ?, `condition`=? where productId =?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, productName);
				preparedStatement.setInt(2, price);
				preparedStatement.setString(3, description);
				preparedStatement.setString(4, manufacturer);
				preparedStatement.setString(5, category);
				preparedStatement.setLong(6, stock);
				preparedStatement.setString(7, condition);
				preparedStatement.setString(8, productId);
				preparedStatement.executeUpdate();
			}
		}
			
		if(preparedStatement != null){
			preparedStatement.close();
		}
			
		if(connection != null){
			connection.close();
		}
			
		response.sendRedirect("editProduct.jsp");
		
	
	%>
</body>
</html>