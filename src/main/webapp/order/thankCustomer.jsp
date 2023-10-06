<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<%
	 	String encoding = "UTF-8";
	    request.setCharacterEncoding(encoding);
	    
	    //주문번호를 쿠키에서 들고옴
	    String orderId ="";
	    Cookie[] cookies = request.getCookies();
	    if(cookies != null){
	    	for(Cookie cookie : cookies){
	    		String cookieName = cookie.getName();
	    		if("orderId".equals(cookieName)){
	    			orderId = URLDecoder.decode(cookie.getValue(), encoding);
	    		}
	    	}
	    }
	%>
	<table>주문 완료</table>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다</h2>
		<p>주문번호 : <%=orderId%></p>
	</div>
	<div class="container">
		<p><a href="../product/products.jsp" class="btn btn-secondary">상품 목록>></a></p>
	</div>
	<% 
		session.removeAttribute("carts");//카트부분 삭제 
	
		for(Cookie cookie : cookies){
			String cookieName = cookie.getName();
			switch(cookieName){
				case "orderId": case "orderNmae" : case "tel": case "zipCode": case "address01": case "address02": 
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					break;
			}
		}
		
		session.removeAttribute("orderId");
		session.removeAttribute("orderName");
		session.removeAttribute("tel");
		session.removeAttribute("zipCode");
		session.removeAttribute("address01");
		session.removeAttribute("address02");
	%>
</body>
</html>
