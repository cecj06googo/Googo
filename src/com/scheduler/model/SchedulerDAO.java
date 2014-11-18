package com.scheduler.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class SchedulerDAO {
	
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";

	private static final String UPDATE_PROD_ID = 
		"UPDATE Ord_item set prod_id=? where item_id = ?";
	private static final String GET_ALL_STMT = 
		"SELECT ord_getday,ord_reday,ord.ord_id,prod_name,prod_plate,item_name,item_phone FROM Orders ord JOIN Ord_item orditem ON ord.ord_id  =  orditem.ord_id JOIN Product prod ON prod.prod_id = orditem.prod_id  where ord.com_id = ?";
	private  String SEARCH_STMT = 
		"SELECT ord_getday,ord_reday,ord.ord_id,prod_name,prod_plate,item_name,item_phone FROM Orders ord JOIN Ord_item orditem ON ord.ord_id  =  orditem.ord_id JOIN Product prod ON prod.prod_id = orditem.prod_id  where 1=1";

	public void update(Order_itemVO itemVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_PROD_ID);

			pstmt.setInt(1, itemVO.getProd_id());
			pstmt.setInt(2, itemVO.getItem_id());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			System.out.println("Couldn't load database driver. "+ e.getMessage());
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			System.out.println("A database error occured. "+ se.getMessage());
			throw new RuntimeException("A database error occured. "+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
