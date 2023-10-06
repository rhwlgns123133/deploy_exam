<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../inc/menu.jsp"/>
	<%@ include file ="../inc/dbconn.jsp" %>
	<%
		String memberId = request.getParameter("memberId");
		String passwd = request.getParameter("passwd");
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "select * from member where memberId=? and passwd=?";
		
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, memberId);
		preparedStatement.setString(2, passwd);
		
		resultSet =  preparedStatement.executeQuery();
		
		if(resultSet.next()){
			String memberName = resultSet.getString("memberName");
			session.setAttribute("sessionMemberName", memberName);
			session.setAttribute("sessionMemberId", memberId);
			response.sendRedirect("resultMember.jsp?msg=2");
			
			sql = "UPDATE cart SET memberId = ? where orderId=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberId);
			preparedStatement.setString(2, orderId);
			preparedStatement.executeUpdate();
			
			sql = "UPDATE cart SET orderId = ? where memberId=? AND orderId!=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, orderId);
			preparedStatement.setString(2, memberId);
			preparedStatement.setString(3, orderId);
			preparedStatement.executeUpdate();
		}
		else{
			response.sendRedirect("loginMember.jsp?msg=1");
		}
		
		if(resultSet != null){
			resultSet.close();
		}
		if(preparedStatement != null){
			preparedStatement.close();
		}
		if(connection != null){
			connection.close();
		}
	%>
</body>
</html>