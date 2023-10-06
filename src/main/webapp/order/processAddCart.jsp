<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Product" %>
<%@page import="dto.Cart"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*"%>
<%@page import="java.sql.*" %>
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
	
		if(productId == null || productId.trim().equals("")){
			response.sendRedirect("../products.jsp");
			return;
		}
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		//장바구니에 파라미터로 전달된 productId와 동일한 데이터가 있는 경우에는
		//장바구니에 추가하지말고 갯수만 변경하도록 수정
		
		//동일한 주문번호에 같은 상품번호가 있으면 업데이트
		String sql = "SELECT num FROM cart WHERE (orderId=?) AND (productId=?)";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, orderId);
		preparedStatement.setString(2, productId);
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
			sql="UPDATE cart Set cnt = cnt+1 where num=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, resultSet.getInt("num"));
			preparedStatement.executeUpdate();
		}
		else{
			String memberId = (String) session.getAttribute("sessionMemberId");
			memberId = (memberId == null) ? "Guest" : memberId;
			
			int cnt = 1;
			
			sql = "INSERT INTO cart (orderId, memberId, productId, cnt, addDate)" +
			"VALUE(?, ?, ?, ?, now())";
			
			try{
				preparedStatement = connection.prepareStatement(sql);	
				preparedStatement.setString(1, orderId);
				preparedStatement.setString(2, memberId);
				preparedStatement.setString(3, productId);
				preparedStatement.setInt(4, cnt);
				preparedStatement.executeUpdate();
			}catch(SQLException e){
				throw new RuntimeException(e);
			}
		}
		
		if(resultSet != null){resultSet.close();}
		if(preparedStatement != null){preparedStatement.close();}
		if(connection != null){connection.close();}
		
		response.sendRedirect("../product/product.jsp?productId=" + productId);
	%>
</body>
</html>