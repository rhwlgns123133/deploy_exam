<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.example.dto.Product" %>
<%@page import="com.example.dao.ProductRepository" %>
<%@page errorPage = "/exception/exceptionNoProduct.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display=3">상품상세</h1>
		</div>
	</div>
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
	%>
	
	<div class = "container">
		<div class="row">
			<div class = "col-md-6">
				<img src="/upload/<%=resultSet.getString("fileName")%>" style="width:100%">
				<h3><%=resultSet.getString("ProductName") %></h3>
				<p><%=resultSet.getString("Description") %></p>
				<p><strong>상품 코드</strong> : <span class = "badge badge-danger">
					<%=resultSet.getString("ProductId") %>
				</span></p>
				<p><strong>제조사</strong> : <%=resultSet.getString("Manufacturer") %></p>
				<p><strong>분류</strong> : <%=resultSet.getString("Category") %></p>
				<p><strong>재고 수</strong> : <%=resultSet.getString("UnitsInStock")%></p>
				<h4><%=resultSet.getString("UnitPrice")%>원</h4>
				
				<form name="frmAddCart" action="../order/processAddCart.jsp" method="post">
					<input type="hidden" name="productId" value="<%=resultSet.getString("ProductId") %>">
				</form>
				<p>
				<a href="#" class="btn btn-info">장바구니 담기>></a>
				<a href="../order/cart.jsp" class="btn btn-info">장바구니 목록</a>
				<a href="./products.jsp" class= "btn btn-secondary"> 상품 목록>> </a></p>
			</div>
		</div>
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
	<script>
		document.addEventListener('DOMContentLoaded', function checkLogin(){
			const btnCart = document.querySelector('.btn-info');
			
			btnCart.addEventListener('click', function(){
				frmAddCart.submit();
			})
		});
	</script>
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>