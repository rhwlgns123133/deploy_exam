<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Cart" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.Product" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../inc/menu.jsp"></jsp:include>
<head>
    <title>주문 정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%
    String encoding = "UTF-8";
    request.setCharacterEncoding(encoding);
    
    String orderId = (String)session.getAttribute("orderId");
    String orderName = (String)session.getAttribute("orderName");
    String tel = (String)session.getAttribute("tel");
    String zipCode = (String)session.getAttribute("zipCode");
    String address01 = (String)session.getAttribute("address01");
    String address02 = (String)session.getAttribute("address02");
    
    //String orderId = "", orderName = "", zipCode = "", address01 = "", address02 = "", tel = "";

    //Cookie[] cookies = request.getCookies();
    //if(cookies != null) {
        //for(Cookie cookie : cookies) {
            //String cookieName = cookie.getName();
            //switch (cookieName) {
                //case  "orderId" :
                    //orderId = URLDecoder.decode(cookie.getValue(), encoding);
                    //break;
                //case  "tel" :
                    //tel = URLDecoder.decode(cookie.getValue(), encoding);
                    //break;
                //case  "orderName" :
                    //orderName = URLDecoder.decode(cookie.getValue(), encoding);
                    //break;
                //case  "zipCode" :
                    //zipCode = URLDecoder.decode(cookie.getValue(), encoding);
                    //break;
               //case  "address01" :
                    //address01 = URLDecoder.decode(cookie.getValue(), encoding);
                    //break;
                //case  "address02" :
                    //address02 = URLDecoder.decode(cookie.getValue(), encoding);
                    //break;

            //}
        //}
    //}
%>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">주문 정보</h1>
    </div>
</div>
<div class="container col-8 alert alert-info">
    <div class="text-center">
        <h1>영수증</h1>
    </div>
    <div class="row justify-content-between">
        <div class="col-4" align="left">
            <strong>배송주소</strong><br>
            성명 : <%=orderName%><br>
            연락처 : <%=tel%><br>
            우편번호 : <%=zipCode%><br>
            주소 : <%=address01%><br>
            <%=address02%>
        </div>
    </div>
    
    <div>
        <table class="table table-hover">
                <tr>
                    <td>사진</td>
                    <td>상품</td>
                    <td>가격</td>
                    <td>수량</td>
                    <td>소계</td>
                </tr>
            <%
                ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts"); // 세션에저장된목록들고오기,다운캐스팅
                if(carts == null) {
                    carts = new ArrayList<Cart>();
                }

                ProductRepository productRepository = ProductRepository.getInstance(); //가격등 정보불러옴
                int sum = 0;
                for (Cart cart : carts) {
                    Product product = productRepository.getProductById(cart.getProductId());
                    Integer price = product.getUnitPrice() * cart.getCartCnt(); //소계 : 가격*수량
                    sum += price;


            %>
            <tr>
                <td><img src="/upload/<%=product.getFileName()%>" style="width: 100px"></td>
                <td><a href="../product/product.jsp?productId=<%=product.getProductId()%>"%>
                    <%=product.getProductName()%></a></td>
                <td><%=product.getUnitPrice()%>원</td>
                <td><%=cart.getCartCnt()%></td>
                <td><%=price%>원</td>
            </tr>
            <%
                }
            %>
            <tr>
                <td></td>
                <td></td>
                <td class="text-right"><strong>총액:</strong></td>
                <td class="text-center text-danger"><strong><%=sum%></strong></td>
            </tr>
        </table>
        <a href="./shippingInfo.jsp" class="btn btn-secondary" role="button"> 이전 </a>
        <a href="./thankCustomer.jsp" class="btn btn-success" role="button"> 주문 완료 </a>
        <a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
    </div>
</div>
    


<jsp:include page="../inc/footer.jsp"/>
</body>
</html>