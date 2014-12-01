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
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//SQL Server
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
		String query = "select count(*) from Member where mem_account=?";
		String query2 = "select count(*) from Company where com_account=?";
		String user_account = request.getParameter("user_account");
		String user_identity = request.getParameter("optionsRadios");
		try{
			//SQL Server
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			conn = DriverManager.getConnection(url, "sa", "sa123456");
		
			if("Mem".equals(user_identity)){
				stmt = conn.prepareStatement(query);
			}else if("Com".equals(user_identity)){
				stmt = conn.prepareStatement(query2);
			}
			stmt.setString(1,user_account);
			
			rs = stmt.executeQuery();
			Map m1 = new HashMap();
			
			
			 rs.next();
			 if(rs.getInt(1) >= 1){
				 m1.put("valid",false);
			 }else{
				 m1.put("valid",true);
			 }		 
			 
			 String jsonString = JSONValue.toJSONString(m1);                    
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