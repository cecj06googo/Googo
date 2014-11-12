package com.template.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Design_Retrieval")
public class Design_Retrieval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Design_Retrieval() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433; databaseName=GGDB";
		String user = "sa";
		String pw = "sa123456";
		
		String pstmt_Retrieve = "select ordt_content from Ord_temp where ordt_id = (SELECT MAX(ordt_id) FROM Ord_temp WHERE com_id = ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int com_id = 1;
		String designResult = "";
		StringWriter out = new StringWriter();
		response.setCharacterEncoding("UTF-8");
		PrintWriter httpout = response.getWriter();
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(pstmt_Retrieve);
			
			if(request.getParameter("com_id_form_view") != null){
				com_id = Integer.parseInt((String)request.getParameter("com_id_form_view"));	
			}
			System.out.println("Load design of: " + com_id);
			pstmt.setInt(1, com_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				designResult += rs.getString("ordt_content");
				System.out.println(designResult);
			}
			
			httpout.print(designResult);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (Exception se) {
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}//end finally
	}//end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
