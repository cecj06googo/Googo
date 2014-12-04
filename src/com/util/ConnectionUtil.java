package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
//雲端版本的帳密
//String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//String url = "jdbc:sqlserver://i64nhzkqmt.database.windows.net:1433;database=GGDB";
//String userid = "googocar@i64nhzkqmt";
//String passwd = "Sa123456";
public class ConnectionUtil {
	public Connection getConnection(){
		 Connection conn = null;
		 try {  
//			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			 String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=GGDB";
//			 conn = DriverManager.getConnection(connUrl, "sa", "sa123456");
			 
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 String connUrl = "jdbc:sqlserver://i64nhzkqmt.database.windows.net:1433;database=GGDB";
			 conn = DriverManager.getConnection(connUrl, "googocar@i64nhzkqmt", "Sa123456");
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
