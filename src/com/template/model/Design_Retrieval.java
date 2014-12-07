package com.template.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectConstant;


public class Design_Retrieval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Design_Retrieval() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		solo version
//		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//		String url = "jdbc:sqlserver://localhost:1433; databaseName=GGDB";
//		String user = "sa";
//		String pw = "sa123456";
		
		String driver = ConnectConstant.driver;
		String url = ConnectConstant.url;
		String user = ConnectConstant.userid;
		String pw = ConnectConstant.passwd;
		
		String pstmt_Retrieve = "select ordt_content from Ord_temp where ordt_id = (SELECT MAX(ordt_id) FROM Ord_temp WHERE com_id = ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int com_id = 1;
		String designResult = "";
		//StringWriter out = new StringWriter();
		response.setCharacterEncoding("UTF-8");
		PrintWriter httpout = response.getWriter();
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(pstmt_Retrieve);
			
			if(request.getParameter("com_id_form_view") != null){
				com_id = Integer.parseInt((String)request.getParameter("com_id_form_view"));	
			}else{
				System.out.print("Design Retrieval Message: Missing com_id, abort retrieval.");
				return;
			}
			System.out.println("Load design of: " + com_id);
			pstmt.setInt(1, com_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				designResult += rs.getString("ordt_content");
				System.out.println(designResult);
			}
			
			// response designResult only if there is saved template for this company
			if(designResult != null && designResult.trim().length() > 3){
				httpout.print(designResult);
			}else{
				System.out.println("No designed template for current company.");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (httpout != null) {
				try {
					httpout.close();
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
