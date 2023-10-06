<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>페이지 오류</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="alert alert-danger">요청하신 페이지를 찾을수 없습니다</h1>
		</div>
	</div>
	
	<div class = "container">
		<p>?<%=request.getRequestURL()%></p>
		<p><a href="products.jsp" class="btn btn-secondary">상품목록</a></p>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>