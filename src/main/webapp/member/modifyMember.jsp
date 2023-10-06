<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file ="../inc/dbconn.jsp" %>
	<%
		String sessionMemberId = (String) session.getAttribute("sessionMemberId");
	
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "select * from member Where memberId = ?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, sessionMemberId);
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
			String passwd = resultSet.getString("passwd");
			String memberName = resultSet.getString("memberName");
			String gender = resultSet.getString("gender");
			String birthday = resultSet.getString("birthday");
			String[] birthdayArr = birthday.split("-");
			String birthyy = birthdayArr[0];
			String birthmm = birthdayArr[1];
			String birthdd = birthdayArr[2];
			String email = resultSet.getString("email");
			String[] emailArr = email.split("@");
			String phone = resultSet.getString("phone");
			String zipCode = resultSet.getString("zipCode");
			String address01 = resultSet.getString("address01");
			String address02 = resultSet.getString("address02");
	%>
	<jsp:include page="../inc/menu.jsp"/>
   <div class="jumbotron">
      <div class="container">
         <h1 class="display=3">회원수정</h1>
      </div>
   </div>   
   
   <div class ="container">
      <form name="frmMember" action="processModifyMember.jsp" method="post">
         <div class="form-group row">
            <label class="col-sm-2">아이디</label>
            <div class="col-sm-10">
               <input type="text" name="memberId" class="form-control" value="<%=sessionMemberId%>" readonly>
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">비밀번호</label>
            <div class="col-sm-3">
               <input type="text" name="passwd" value="<%=passwd%>">
            </div>
         </div>
         
          <div class="form-group row">
            <label class="col-sm-2">비밀번호 확인</label>
            <div class="col-sm-3">
               <input type="passwd" name="passwdCheck" class="form-control" value="<%=passwd%>">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">이름</label>
            <div class="col-sm-3">
               <input type="text" name="memberName" class="form-control" value="<%=memberName%>">
            </div>
         </div>
         
         <div class="form-group  row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-10" >
				<input name="gender" type="radio" value="<%=gender%>"> 남
				
				<input name="gender" type="radio" value="<%=gender%>"> 여
			</div>
		</div>
         
         <div class="form-group row">
			<label class="col-sm-2">생일</label>
			<div class="col-sm-4  ">
				<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" value="<%=birthyy%>">
				<select name="birthmm">
					<option value="">월</option>
					<%
						for(int i=1; i<=12; i++){
							String month = String.format("%02d", i);//숫자 두자리를 문자열로 반환
							out.print("<option value=\"" + month + "\"");
							if(birthmm.equals(month)){
								out.print("selected");
							}
							out.print(">" + i + "</option>");
						}
					%>
				</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" value="<%=birthdd%>">
			</div>
		</div>

        <div class="form-group  row ">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-10">
				<input type="text" name="mail1" maxlength="50" <%=emailArr[0]%>>@
				<select name="mail2">
					<%
						String[] emails = {"naver.com", "daum.net", "gmail.com", "nate.com"};
						for(String str : emails){
							out.print("<option");
							if(emailArr[1].equals(str)){
								out.print("selected");
							}
							out.print(">" + str + "</opting>");
						}
					%>
				</select>
			</div>
		</div>
         
         <div class="form-group row">
            <label class="col-sm-2">연락처</label>
            <div class="col-sm-3">
               <input type="text" name="phone" class="form-control" value="<%=phone%>">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">우편번호</label>
            <div class="col-sm-10">
               <input type="text" name="zipCode" class="form-control" value="<%=zipCode%>">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">주소1</label>
            <div class="col-sm-3">
               <input type="text" name="address01" class="form-control" value="<%=address01%>">
            </div>
         </div>
         
         <div class="form-group row">
            <label class="col-sm-2">주소2</label>
            <div class="col-sm-3">
               <input type="text" name="address02" class="form-control" value="<%=address02%>">
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
            <input type="submit" class="btn btn-primary" value="수정">
            <a href="processRemoveMember.jsp" class="btn btn-primary">회원탈퇴</a>
         </div>
         
      </form>
   </div>
   <%
		}
   %>
</body>
</html>