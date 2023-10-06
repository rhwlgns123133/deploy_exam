<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Cart" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.Product" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-09-12
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<html>
<jsp:include page="../inc/menu.jsp"></jsp:include>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">장바구니</h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <table width="100%">
                <tr>
                    <td align="left">
                        <a href="#" class="btn btn-danger btn-removeAll">비우기</a>
                        <a href="#" class="btn btn-danger btn-selected">선택삭제</a>
                        <a href="./shippingInfo.jsp" class="btn btn-success">주문</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="padding-top: 50px">
        	<form name="frmCart" method="post">
        	<input type ="hidden" name="productId">
            <table class="table table-hover">
                <tr>
                	<td>체크</td>
                	<td>사진</td>
                    <td>상품</td>
                    <td>가격</td>
                    <td>수량</td>
                    <td>소계</td>
                    <td>비고</td>
                    <td>합계</td>
                </tr>
                <%@ include file ="../inc/dbconn.jsp" %>
                <%
	        		if(orderId  == null){
	        			String sessionId = session.getId();
	        		
	        			//현재 날짜와 시간 가져오기
	        			java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	        			String currenDateTime = simpleDateFormat.format(new java.util.Date());
	        			
	        			orderId= currenDateTime + "-" + sessionId;
	        			session.setAttribute("orderId", orderId);
	        		}
	        		
	        		PreparedStatement preparedStatement = null;
	        		ResultSet resultSet = null;
	        		int sum = 0;
	        		
	        		String sql = "SELECT * FROM cart C INNER JOIN product P on C.productId = P.productId WHERE (orderId=?)";
	        		preparedStatement = connection.prepareStatement(sql);
	        		preparedStatement.setString(1, orderId);
	        		resultSet = preparedStatement.executeQuery();
	        		while(resultSet.next()){
	        			Integer price = resultSet.getInt("unitPrice")*resultSet.getInt("cnt");
	        			sum += price;
                %>
                <tr>
                	<td><input type="checkbox" name="checkedId" value="<%=resultSet.getString("num")%>"></td>
                	<td><img src="/upload/<%=resultSet.getString("FileName")%>" style="width:100px"></td>
                    <td><a href="../product/products.jsp"><%=resultSet.getString("productId")%></a></td>
                    <td><%=resultSet.getString("productName")%></td>
                    <td><%=resultSet.getString("unitPrice")%></td>
                    <td><input type="text" name="cnt_<%=resultSet.getString("productId")%>" 
                    	value="<%=resultSet.getInt("cnt")%>">
                    	<a href="#" class="btn-plus" role="<%=resultSet.getString("productId") %>" about="plus">+</a>
                    	<a href="#" class="btn-minus" role="<%=resultSet.getString("productId") %>" about="plus">-</a>
                    </td>
                    <td><%=price%></td>
                    <td><a href="#" role="<%=resultSet.getString("productId")%>" class="badge badge-danger btn-removeById">삭제</a> </td>
                </tr>
                <tr>
                	<td>합게: <%=sum%>>원</td>
                </tr>
                <%
                    }
                %>
                <tr>
                	<td></td>
                	<td></td>
                	<td class="text-right"><strong>총액</strong></td>
                	<td class="text-center text-danger"><strong><%=sum%></strong></td>
            </table>
            <a href="../product/products.jsp" class="btn btn-secondary">&laquo;쇼핑계속하기</a>
            </form>
        </div>
    </div>
    <script>
    document.addEventListener('DOMContentLoaded', function checkLogin(){
		const btnremoveAll = document.querySelector('.btn-removeAll');
		btnremoveAll.addEventListener('click', function(){
			if(confirm('정말 삭제 하시겠습니까>')){
				location.href = './processRemoveCart.jsp';
			}
		})
	});
    </script>
    <script>
	    document.addEventListener('DOMContentLoaded', function (){
			const btnRemoveSelected = document.querySelector(".btn-selected");
			const frmCart = document.querySelector('form[name=frmCart]');
			btnRemoveSelected.addEventListener('click', function(){
				if(confirm('정말 삭제 하시겠습니까?')){
					frmCart.action = '../order/processRemoveCartSel.jsp';
					frmCart.submit();
				}
			});
	    });
	</script>
	<script>
	    document.addEventListener('DOMContentLoaded', function (){
			const btnRemoveByIds = document.querySelectorAll('.btn-removeById');
			const frmCart = document.querySelector('form[name=frmCart]');
			btnRemoveByIds.forEach(button=>{
				button.addEventListener('click', function(e){
					if(confirm('정말 삭제 하시곘습니까?')){
						frmCart.productId.value = e.target.role;
						frmCart.action = './processRemoveCartById.jsp';
						frmCart.submit();
					}
				});
			});
		});
	</script>
</body>
</html>