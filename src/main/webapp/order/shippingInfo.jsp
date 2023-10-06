
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Cart"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="dto.Product"%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-09-12
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<jsp:include page="../inc/menu.jsp"></jsp:include>
<head>
<title>Title</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	<!--주문번호 생성 및 사용-->
	<%
	String sessionId = session.getId();

	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String currenDateTime = simpleDateFormat.format(new java.util.Date());

	String orderId = currenDateTime + "-" + sessionId;
	%>
	<!--주문 및 배송 정보 입력-->
	<div class="container">
		<form action="./processShippingInfo.jsp" method="post">
			<input type="hidden" name="orderId" value="<%=orderId%>">
			<div class="form-group row">
				<label class="col-sm-2">주문자 이름</label>
				<div class="col-sm-3">
					<input type="text" name="orderName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">연락처</label>
				<div class="col-sm-3">
					<input type="text" name="tel" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="zipCode" class="form-control"id="zip-code" readonly>
					<input type="button"onclick="execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소 1</label>
				<div class="col-sm-3">
					<input type="text" name="address01" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소 2</label>
				<div class="col-sm-3">
					<input type="text" name="address02" class="form-control">
				</div>
			</div>
	<div class="form-group row">
		<label class="col-sm-10"></label>
			<div class="col-sm-3">
				<a href="./cart.jsp" class="btn btn-secondary" role="button">이전</a>
				<input type="submit" name="btn btn-primary" value="등록">
			</div>
	</div>
	</form>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.getElementById('zip-code').value = data.zonecode;
				}
			}).open();
		}
	</script>
</body>
</html>