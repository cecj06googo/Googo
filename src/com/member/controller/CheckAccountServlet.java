package com.member.controller;
  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.simple.JSONValue;

public class CheckAccountServlet extends HttpServlet{
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "sa123456";
	String checkAccount = "select count(*) from Member where mem_account=?";
	
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("進入check servlet");
		doGet(req, res);
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		System.out.println("進入check servlet");
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		PrintWriter out = res.getWriter();
		String mem_account = req.getParameter("mem_account");
		try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(checkAccount);
				
				pstmt.setString(1,mem_account);
				
				rs = pstmt.executeQuery();
				Map m1 = new HashMap();
				
				
				 rs.next();
				 if(rs.getInt(1) >= 1){
					 m1.put("valid",false);
				 }else{
					 m1.put("valid",true);
				 }		 
				 
				 String jsonString = JSONValue.toJSONString(m1);                    
				 out.println(jsonString);
			
			}  catch (SQLException e) {
				e.printStackTrace();
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			}finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
	}
}



