<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
	%>
	<%@ include file ="../inc/dbconn.jsp" %>
	<%
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "select * from member Where memberId=?";
		
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, id);
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
			 out.print("동일한 아이디가 있습니다");
		}
		else{
			 out.print("동일한 아이디가 없습니다");
		}
	%>
</body>
</html>