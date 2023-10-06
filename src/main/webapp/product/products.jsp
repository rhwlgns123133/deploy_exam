<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@page import="com.example.dto.Product" %>
<%@page import="com.example.dao.ProductRepository"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display=3">상품목록</h1>
		</div>
	</div>
	<div class = "container">
	<div class="row">
	<%@ include file ="../inc/dbconn.jsp" %>
	<%
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String sql = "select * from product";
		preparedStatement = connection.prepareStatement(sql);
		resultSet =  preparedStatement.executeQuery();
		while(resultSet.next()){
		
	%>
	<div class = "col-md-4">
		<img src="/upload/<%=resultSet.getString("fileName")%>" style="width:100%">
			<h3><%=resultSet.getString("productName") %></h3>
				<p><%=resultSet.getString("description") %></p>
				<p><%=resultSet.getString("unitPrice") %>원</p>
				<p><a href="./product.jsp?productId=<%=resultSet.getString("productId")%>" class= "btn btn-secondary" role="button">상세정보</a></p>
			</div>
			<%
				}
				if(resultSet != null){
					resultSet.close();
				}
				if(preparedStatement != null){
					preparedStatement.close();
				}
				if(connection != null){
					connection.close();
				}
			%>
			</div>
		</div>
</body>
</html>