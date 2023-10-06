<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>상품등록</title>
</head>
<body>
   <jsp:include page="../inc/menu.jsp"></jsp:include>
   <div class="jumbotron">
      <div class="container">
         <h1 class="display=3">상품등록</h1>
      </div>
   </div>   
   
   <div class ="container">
      <form name="frmProduct" action="./processAddProduct.jsp" method="post" enctype="multipart/form-data">
         <div class="form-group row">
            <label class="col-sm-2">상품코드</label>
            <div class="col-sm-3">
               <input type="text" name="productId" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">상품명</label>
            <div class="col-sm-3">
               <input type="text" name="productName" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">상품가격</label>
            <div class="col-sm-3">
               <input type="text" name="unitPrice" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">상품설명</label>
            <div class="col-sm-3">
               <textarea  name="description" class="form-control" cols="20" rows="10" >
               </textarea>
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">제조사</label>
            <div class="col-sm-3">
               <input type="text" name="manufacturer" class="form-control">
            </div>
         </div>

         <div class="form-group row">
            <label class="col-sm-2">분류</label>
            <div class="col-sm-3">
               <input type="text" name="category" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">재고수</label>
            <div class="col-sm-3">
               <input type="text" name="unitsInStock" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">상태</label>
            <div class="col-sm-3">
               <input type="radio" name="condition" value="new">신규 제품
               <input type="radio" name="condition" value="old">중고 제품
               <input type="radio" name="condition" value="new2">재생 제품
            </div>
         </div>
         
          <div class="form-group row">
            <label class="col-sm-2">이미지</label>
            <div class="col-sm-3">
               <input type="file" name="fileName" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <input type="submit" class="btn btn-primary" value="등록">
         </div>
         
      </form>
   </div>
   <jsp:include page="../inc/footer.jsp"/>
</body>
</html>