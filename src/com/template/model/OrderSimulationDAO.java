package com.template.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderSimulationDAO {
	
	String INSERT_ORDER = "insert into Orders " + 
							"(ord_status, com_id, mem_id, ord_time, ord_getday, ord_reday, item_total) " + 
							"values (?, ?, ?, ?, ?, ?, ?)";
	String INSERT_ORDER_ITEM = "insert into Ord_item " + 
								"(ord_id, prod_id, acc_id, item_name, item_tel, item_phone, item_email, pritem_acc, item_all) " + 
								"values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	String QUERY = "";
	
	public Connection createConnection () {
		
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433; databaseName=GGDB";
		String user = "sa";
		String pw = "sa123456";
		Connection conn = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
		} catch (ClassNotFoundException e) {
			System.out.println("Error in driver loading.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Error in SQL operation.");
			e.printStackTrace();
		}
		
		return conn;
	}// end createConnection
	
	public void closeConnection (Connection conn) {
		
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("Error in connection closing.");
				e.printStackTrace();
			}
		}// end if
	}// end closeConnection
	
	public void closePstmt (PreparedStatement pstmt) {
		
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("Error in prepared statement closing.");
				e.printStackTrace(System.err);
			}
		}// end if
	}// end closePstmt
	
	public int addAnOrder (OrderSimulationVO orderVO, OrderItemSimulationVO orderItemVO) {
		
		PreparedStatement pstmtOrder = null;
		PreparedStatement pstmtOrderItem = null;
		int generatedKey = 0;
		int insertResult1 = 0;
		int insertResult2 = 0;
		
		Connection conn = this.createConnection();
		try {
			
			pstmtOrder = conn.prepareStatement(INSERT_ORDER, pstmtOrder.RETURN_GENERATED_KEYS);
			pstmtOrder.setInt(1, orderVO.getOrd_status());
			pstmtOrder.setInt(2, orderVO.getCom_id());
			pstmtOrder.setInt(3, orderVO.getMem_id());
			pstmtOrder.setTimestamp(4, orderVO.getOrd_time());
			pstmtOrder.setTimestamp(5, orderVO.getOrd_getday());
			pstmtOrder.setTimestamp(6, orderVO.getOrd_reday());
			pstmtOrder.setInt(7, orderVO.getItem_total());
			insertResult1 = pstmtOrder.executeUpdate();
			
			ResultSet rs = pstmtOrder.getGeneratedKeys();
			if (rs.next()) {
				generatedKey = rs.getInt(1);
				orderItemVO.setOrd_id(generatedKey);
			}
			
			pstmtOrderItem = conn.prepareStatement(INSERT_ORDER_ITEM);
			pstmtOrderItem.setInt(1, orderItemVO.getOrd_id());
			pstmtOrderItem.setInt(2, orderItemVO.getProd_id());
			pstmtOrderItem.setInt(3, orderItemVO.getAcc_id());
			pstmtOrderItem.setString(4, orderItemVO.getItem_name());
			pstmtOrderItem.setString(5, orderItemVO.getItem_tel());
			pstmtOrderItem.setString(6, orderItemVO.getItem_phone());
			pstmtOrderItem.setString(7, orderItemVO.getItem_email());
			pstmtOrderItem.setString(8, orderItemVO.getPritem_acc());
			pstmtOrderItem.setString(9, orderItemVO.getItem_all());
			insertResult2 = pstmtOrderItem.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("Error in sql insert operation.");
			e.printStackTrace();
		}// end catch
		return insertResult1 + insertResult2; // returns 2 if everything is ok
	}// end insertOrder
	
	public void queryOrder () {
		
	}
	
}
