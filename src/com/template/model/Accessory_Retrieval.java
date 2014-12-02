package com.template.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;


public class Accessory_Retrieval extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Accessory_Retrieval() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433; databaseName=GGDB";
		String user = "sa";
		String pw = "sa123456";
		int com_id = Integer.parseInt(request.getParameter("com_id"));
		
		String pstmt_Retrieve = "select acc_id, acc_detail, acc_price from Accessory where com_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringWriter out = new StringWriter();
		response.setCharacterEncoding("UTF-8");
		PrintWriter httpout = response.getWriter();
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(pstmt_Retrieve);
			
			pstmt.setInt(1, com_id);
			
			rs = pstmt.executeQuery();
			ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>();
			
			//this writing sucks...too many map object created...need to find some better way
			while (rs.next()) {
				Map<String, String> accessory = new LinkedHashMap<String, String>();
				accessory.put("acc_id", rs.getString("acc_id"));
				accessory.put("description", rs.getString("acc_detail"));
				accessory.put("price", rs.getString("acc_price"));
				list.add(accessory);
				System.out.println(rs.getString("acc_id"));
				System.out.println(rs.getString("acc_detail"));
				System.out.println(rs.getString("acc_price"));
			}
			
			String jsonText = JSONValue.toJSONString(list);
			System.out.print(jsonText);
			
			
			httpout.print(jsonText);
			
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
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doPost(request, response);
	}

}
