<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedHashMap"%> 
<%@page import="java.util.Map"%>  
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>  
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONValue"%>
<%@ page import="java.sql.*;" %>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Northwind";
String query = "select ProductID,ProductName,UnitPrice,UnitsInStock from Products";

try{
	DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
	conn = DriverManager.getConnection(url, "sa", "sa123456");
   stmt = conn.createStatement();
	
	 rs = stmt.executeQuery(query);
	 List  l1 = new LinkedList();
	 while (rs.next()) {
		 Map m1 = new HashMap();       
		 m1.put("ProductID",rs.getString(1));   
		 m1.put("ProductName", rs.getString(2)); 
		 m1.put("UnitPrice",rs.getString(3)); 
		 m1.put("UnitsInStock", rs.getString(4));
		 l1.add(m1);
	 }
	 String jsonString = JSONValue.toJSONString(l1);                    
	 out.println(jsonString);
}
catch(SQLException e){
	out.println("Error:" + e.getMessage());
}
finally{
	if(rs != null){
	   rs.close();
	}
	if(stmt != null){
	 stmt.close();
	}
	if(conn != null){
	}
}

%>