package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
//雲端版本的帳密

public class ConnectionUtil {
	String driver = ConnectConstant.driver;
	String url = ConnectConstant.url;
	String userid = ConnectConstant.userid;
	String passwd =  ConnectConstant.passwd;
	public Connection getConnection(){
		 Connection conn = null;
		 try {  
//			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			 String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=GGDB";
//			 conn = DriverManager.getConnection(connUrl, "sa", "sa123456");
			 
			 Class.forName(driver);
			 String connUrl = url;
			 conn = DriverManager.getConnection(connUrl,userid,passwd);
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
