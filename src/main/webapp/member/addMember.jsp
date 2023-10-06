<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class= "dao.ProductRepository" scope="session"></jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>상품등록</title>
</head>
<body>
   <jsp:include page="../inc/menu.jsp"/>
   <div class="jumbotron">
      <div class="container">
         <h1 class="display=3">회원가입</h1>
      </div>
   </div>   
   
   <div class ="container">
      <form name="frmMember" action="processAddMember.jsp" method="post">
         <div class="form-group row">
            <label class="col-sm-2">아이디</label>
            <div class="col-sm-10">
               <input type="text" name="memberId" class="form-control">
               <span class = "memberIdCheck"></span>
               <br><input type="button" name="btnIsDuplication" value="파업 아이디 중복 확인">
               <br><input type="button" name="btnIsDuplication2nd" value="ajax 아이디 중복 확인">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">비밀번호</label>
            <div class="col-sm-3">
               <input type="passwd" name="passwd" class="form-control">
            </div>
         </div>
         
          <div class="form-group row">
            <label class="col-sm-2">비밀번호 확인</label>
            <div class="col-sm-3">
               <input type="passwd" name="passwdCheck" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">이름</label>
            <div class="col-sm-3">
               <input type="text" name="memberName" class="form-control">
            </div>
         </div>
         
         <div class="form-group  row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-10">
				<input name="gender" type="radio" value="남"> 남
				<input name="gender" type="radio" value="여"> 여
			</div>
		</div>
         
         <div class="form-group row">
			<label class="col-sm-2">생일</label>
			<div class="col-sm-4  ">
				<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6">
				<select name="birthmm">
					<option value="">월</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
			</div>
		</div>

        <div class="form-group  row ">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-10">
				<input type="text" name="mail1" maxlength="50">@
				<select name="mail2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com</option>
				</select>
			</div>
		</div>
         
         <div class="form-group row">
            <label class="col-sm-2">연락처</label>
            <div class="col-sm-3">
               <input type="text" name="phone" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">우편번호</label>
            <div class="col-sm-10">
               <input type="text" name="zipCode" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">주소1</label>
            <div class="col-sm-3">
               <input type="text" name="address01" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">주소2</label>
            <div class="col-sm-3">
               <input type="text" name="address02" class="form-control">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">상태</label>
            <div class="col-sm-3">
               <input type="radio" name="condition" value="new">신규 가입
               <input type="radio" name="condition" value="old">중복 가입
            </div>
         </div>
         
         <div class="form-group row">
            <input type="submit" class="btn btn-primary" value="가입">
         </div>
         
      </form>
   </div>
   <script>
   document.addEventListener("DOMContentLoaded",function () {
	    const frmMember = document.frmMember; //폼을 들고옴

	    //id중복 확인
	    const btnIsDuplication = document.querySelector('input[name=btnIsDuplication]');
	    btnIsDuplication.addEventListener('click',function () {
	        const  memberId = frmMember.memberId.value; //아이디 input에 있는 값
	        if(memberId === "") {
	            alert("아이디를 입력해 주세요.")
	            frmMember.memberId.focus();
	            return;
	        }
	        //중복확인 팝업
	        window.open('popupIdCheck.jsp?id=' + memberId, 'idCheck', 'width = 500, height = 500, top = 100, left = 200, location = no');
	    });
	});
	   
	   //2.ajax를 이용한 id 중복확인
	   	const xhr = new XMLHttpRequest();//객체생성
		const btnIsDuplication2nd = document.querySelector('input[name=btnIsDuplication2nd]');
		btnIsDuplication2nd.addEventListener("click",function () {
	    const memberId = frmMember.memberId.value;
	    xhr.open('GET','ajaxIdCheck.jsp?id=' + memberId);
	    xhr.send();

    	xhr.onreadystatechange = () => {
        //readyState 프로퍼티의 값이 DONE : 요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨.
        if(xhr.readyState !== XMLHttpRequest.DONE) return;

        if(xhr.status === 200) {//서버 (url)에 문서가 존재함
            //console.log(xhr.reponse);
            const json = JSON.parse(xhr.response);
            if(json.result === 'true') {
                alert("동일한 아이디가 있습니다.")
            }
            else  {
                alert("동일한 아이디가 없습니다.")
            }
        }
        else {//서버에 문서가존재하지 않음.
            console.error('Error',xhr.status,xhr.statusText);

        	}
    	}
	});
		
	//3ajax를 이용한 실시간 Id 중복 확인
	//2번에서 작업된 파일을 이용
	/* const inputId = document.querySelector('input[name=memberId]');
	inputId.addEventListener('keyup', function(){
		const id = frmMember.memberId.value;
		const memberIdcheck = document.querySelector('.memberIdCheck');
		xhr.open('GET','ajaxIdCheck.jsp?id=' + memberId);
	    xhr.send();

    	xhr.onreadystatechange = () => {
        //readyState 프로퍼티의 값이 DONE : 요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨.
        if(xhr.readyState !== XMLHttpRequest.DONE) return;

        if(xhr.status === 200) {//서버 (url)에 문서가 존재함
            //console.log(xhr.reponse);
            const json = JSON.parse(xhr.response);
            if(json.result === 'true') {
            	memberIdCheck.style.color = 'red';
            	memberIdCheck.innerHTML = '동일한 아이디가 있습니다.';
            }
            else{
            	memberIdCheck.style.color = 'gray';
            	memberIdCheck.innerHTML = '동일한 아이디가 있습니다.';
            }
	} */
   </script>
   <jsp:include page="../inc/footer.jsp"/>
</body>
</html>