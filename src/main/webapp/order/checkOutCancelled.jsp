<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>주문취소</table>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 취소</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문이 취소 되었습니다</h2>
	</div>
	<div class="container">
		<p><a href="../product/products.jsp" class="btn btn-secondary">상품 목록>></a></p>
	</div>
	<% 
		session.removeAttribute("carts");//카트 삭제
		//Cookie[] cookies = request.getCookies();
		//for(Cookie cookie : cookies){
			//String cookieName = cookie.getName();
			//switch(cookieName){
				//case "orderId": case "orderNmae" : case "tel": case "zipCode": case "address01": case "address02": 
					//cookie.setMaxAge(0);
					//response.addCookie(cookie);
					//break;
			//}
		//}
		//섹션 삭제
		session.removeAttribute("orderId");
		session.removeAttribute("orderName");
		session.removeAttribute("tel");
		session.removeAttribute("zipCode");
		session.removeAttribute("address01");
		session.removeAttribute("address02");
	%>
</body>
</html>