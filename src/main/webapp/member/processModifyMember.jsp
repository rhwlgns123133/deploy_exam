<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file ="../inc/dbconn.jsp" %>
	<% 
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String passwd = request.getParameter("passwd");
		String memberName = request.getParameter("memberName");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthyy") + "-" + request.getParameter("birthmm") + "-" + 
				request.getParameter("birthdd");
		String email = request.getParameter("mail1")+ "@" + request.getParameter("mail2");
		String phone = request.getParameter("phone");
		String zipCode = request.getParameter("zipCode");
		String address01 = request.getParameter("address01");
		String address02 = request.getParameter("address02");
		
		
		PreparedStatement preparedStatement = null;
		
		String sql = "UPDATE member SET passwd=?, memberName=?, gender=?, birthday=?,"+
		"email=?, phone=?, zipCode=?, address01=?, address02=?" +
		" where memberId = ?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, passwd);
		preparedStatement.setString(2, memberName);
		preparedStatement.setString(3, gender);
		preparedStatement.setString(4, birthday);
		preparedStatement.setString(5, email);
		preparedStatement.setString(6, phone);
		preparedStatement.setString(7, zipCode);
		preparedStatement.setString(8, address01);
		preparedStatement.setString(9, address02);
		preparedStatement.setString(10, memberId);
		if(preparedStatement.executeUpdate() == 1){
			response.sendRedirect("resultMember.jsp?msg=3");
		}
		else{
			response.sendRedirect("addMember.jsp");
		}
		
		//response.sendRedirect("addMember.jsp");
		
	%>
</body>
</html>