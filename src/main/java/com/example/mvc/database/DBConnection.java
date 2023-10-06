package com.example.mvc.database;

import java.sql.*;

public class DBConnection {
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		Connection connection = null;
		
		String url = "jdbc:mariadb://localhost:3306/sample";
		String user = "root";
		String password = "9719";
		
		Class.forName("org.mariadb.jdbc.Driver");
		
		connection = DriverManager.getConnection(url, user, password);
		
		return connection;
	}
}
