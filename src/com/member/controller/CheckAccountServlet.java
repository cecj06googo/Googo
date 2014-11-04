package com.member.controller;
  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class CheckAccountServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doGet(req, res);
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PrintWriter out = res.getWriter();
		String mem_account = req.getParameter("mem_account");
		String checkAccount = "select count(*) from Member where mem_account=? ";
		try {
				Context ctx = new InitialContext();
				DataSource ds= (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
				con = ds.getConnection();
				pstmt = con.prepareStatement(checkAccount);
				pstmt.setString(1,mem_account);
				
				rs = pstmt.executeQuery();
				String strMsg = "�b���i�ϥ�";
				
				rs.next();
				 if(rs.getInt(1) >= 1){
					 strMsg =  "�b���w�s�b";
				 }
				 out.print(strMsg);
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				if(rs != null){
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					}
					if(pstmt != null){
					 try {
						pstmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					}if (con != null) {
					 try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					}
			}
	}
}



