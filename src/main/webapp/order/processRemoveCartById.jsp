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
	<%
		String productId = request.getParameter("productId");
		if(productId ==null || productId.trim().equals("")){
			response.sendRedirect("../products.jsp");
			return;
		}
		
	
		ProductRepository productRepository = ProductRepository.getInstance();
		Product product = productRepository.getProductById(productId);
		if(product == null){
			response.sendRedirect("../exception/exceptionNoProduct.jsp");
		}
	
		ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
		for(int i = 0; i<carts.size(); i++){
			Cart cart = carts.get(i);
			if(cart.getProductId().equals(productId)){
				carts.remove(cart);
				break;
			}
		}
		response.sendRedirect("./cart.jsp");
	
	%>
</body>
</html>