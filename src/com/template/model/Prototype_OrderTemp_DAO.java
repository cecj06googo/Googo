package com.template.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Prototype_OrderTemp_DAO {
	
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433; databaseName=GGDB";
	String user = "sa";
	String pw = "sa123456";
	
	private static final String pstmt_Insert = "insert into Ord_temp (ordt_content, com_id) values(?, ?)";
	private static final String pstmt_Retrieve = "select ordt_content from Ord_temp where ordt_id = ? AND com_id = ?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	public void insert(Prototype_OrderTemp_VO tempVo){
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(pstmt_Insert);
			pstmt.setString(1, tempVo.getContent());
			pstmt.setInt(2, tempVo.getCom_id());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	}//end insert
	
	public Prototype_OrderTemp_VO retrieve(int ordt_id, int com_id){
		
		ResultSet rs = null;
		Prototype_OrderTemp_VO tempVo = new Prototype_OrderTemp_VO();
		
		try {
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(pstmt_Retrieve);
			pstmt.setInt(1, ordt_id);
			pstmt.setInt(2, com_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				tempVo.setContent(rs.getString("ordt_content"));
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return tempVo;
	}//end retrieve
	
}
	

