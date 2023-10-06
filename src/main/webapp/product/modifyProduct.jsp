<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>상품수정</title>
</head>
<body>
   <jsp:include page="../inc/menu.jsp"></jsp:include>
   <div class="jumbotron">
      <div class="container">
         <h1 class="display=3">상품수정</h1>
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
   <div class ="container">
      <form name="frmProduct" action="./processModifyProduct.jsp?productId=<%=resultSet.getString("productId")%>" 
      		method="post" enctype="multipart/form-data">
         <div class="form-group row">
            <label class="col-sm-2">상품코드</label>
            <div class="col-sm-3">
               <input type="text" name="productId" class="form-control" value="<%=resultSet.getString("productId")%>" 
               readonly>
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">상품명</label>
            <div class="col-sm-3">
               <input type="text" name="productName" class="form-control" value="<%=resultSet.getString("productName")%>">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">상품가격</label>
            <div class="col-sm-3">
               <input type="text" name="unitPrice" class="form-control" value="<%=resultSet.getString("unitPrice")%>">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">상품설명</label>
            <div class="col-sm-3">
               <textarea  name="description" class="form-control" cols="20" rows="10" >
               <%=resultSet.getString("description") %>
               </textarea>
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">제조사</label>
            <div class="col-sm-3">
               <input type="text" name="manufacturer" class="form-control" value="<%=resultSet.getString("manufacturer")%>">
            </div>
         </div>

         <div class="form-group row">
            <label class="col-sm-2">분류</label>
            <div class="col-sm-3">
               <input type="text" name="category" class="form-control" value="<%=resultSet.getString("category")%>">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">재고수</label>
            <div class="col-sm-3">
               <input type="text" name="unitsInStock" class="form-control" value="<%=resultSet.getString("unitsInStock")%>">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">상태</label>
            <div class="col-sm-3">
               <input type="radio" name="condition" value="New"
               <%if(resultSet.getString("condition").equals("New")){out.print(" checked");}%>>신규 제품
               <input type="radio" name="condition" value="Old"
               <%if(resultSet.getString("condition").equals("Old")){out.print(" checked");}%>>중고 제품
               <input type="radio" name="condition" value="New2"
               <%if(resultSet.getString("condition").equals("New2")){out.print(" checked");}%>>재생 제품
            </div>
         </div>
         
          <div class="form-group row">
            <label class="col-sm-2">이미지</label>
            <div class="col-sm-3">
               <input type="file" name="fileName" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <input type="submit" class="btn btn-primary" value="수정">
         </div>
         
      </form>
   </div>
   <%
   		}
   %>
   <jsp:include page="../inc/footer.jsp"/>
</body>
</html>