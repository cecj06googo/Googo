package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtil {
	public Connection getConnection(){
		 Connection conn = null;
		 try {  
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=GGDB";
			 conn = DriverManager.getConnection(connUrl, "sa", "sa123456");
			 return conn;		
		 } catch (Exception e) {
				e.printStackTrace();
				closeConnection(conn);
				return null;
		   }
	 }
	 public static void closeConnection(Connection conn){
		 if (conn != null){
				try {
					conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
		 }
	 }
}
