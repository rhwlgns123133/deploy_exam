<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			out.print("{\"result\":\"true\"}");
		}
		else{
			out.print("{\"result\":\"false\"}");
		}
		if(resultSet!=null){
			resultSet.close();
		}
		if(preparedStatement!=null){
			preparedStatement.close();
		}
		if(connection!=null){
			connection.close();
		}
	%>