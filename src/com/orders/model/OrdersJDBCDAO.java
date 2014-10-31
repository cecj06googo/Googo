package com.orders.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrdersJDBCDAO implements OrdersDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";

	private static final String INSERT_Orders = 
			"INSERT INTO Orders (ord_status,com_id,mem_id,ord_time,ord_getday,ord_reday,item_total)"
			+ " VALUES (?, ?, ?, ?, ?, ?,?)";
	private static final String INSERT_OrderItem = 
			"INSERT INTO Ord_item (ord_id,prod_id,acc_id,item_name,item_tel,item_phone,item_email,pritem_acc,item_all)"
			+ " VALUES (?,?,?,?,?,?,?,?,?)";
	private static final String SELECT_GETALL_Mem = 
			" SELECT ord.ord_id, ord.ord_status, sta.status_char, ord_time, ord_getday, ord_reday ,item_total "
			+ "FROM Orders ord JOIN Ord_status sta  "
			+ "ON ord.ord_status =  sta.ord_status "
			+ "WHERE  mem_id = ? "
			+ "ORDER BY ord.ord_status";

	private static final String DELETE_GETALL_Mem = "UPDATE Orders SET ord_status = ? WHERE ord_id = ?";
			
	//指令碼用""+""時 有可能會發生指令錯誤(原因不明)  
	  
	@Override
	public void insert(OrdersVO ordersVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_Orders,
					Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, ordersVO.getOrd_status());
			pstmt.setInt(2, ordersVO.getCom_id());
			pstmt.setInt(3, ordersVO.getMem_id());
			pstmt.setTimestamp(4, ordersVO.getOrd_time());
			pstmt.setTimestamp(5, ordersVO.getOrd_getday());
			pstmt.setTimestamp(6, ordersVO.getOrd_reday());
			pstmt.setDouble(7, ordersVO.getItem_total());
			pstmt.executeUpdate();

			rs = pstmt.getGeneratedKeys();
			int num = -1;
			if (rs.next())
				num = rs.getInt(1);
			pstmt2 = con.prepareStatement(INSERT_OrderItem);
			pstmt2.setInt(1, num);
			pstmt2.setInt(2, ordersVO.getProd_id());
			pstmt2.setInt(3, ordersVO.getAcc_id());
			pstmt2.setString(4, ordersVO.getItem_name());
			pstmt2.setString(5, ordersVO.getItem_phone());
			pstmt2.setString(6, ordersVO.getItem_tel());
			pstmt2.setString(7, ordersVO.getItem_email());
			pstmt2.setString(8, ordersVO.getPritem_acc());
			pstmt2.setString(9, ordersVO.getItem_all());
			pstmt2.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt2 != null) {
				try {
					pstmt2.close();
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

	} // end insert

	@Override
	public List<OrdersVO> user_getAll(Integer user_id, Integer sel_stus,
			String sel_time) {
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO ordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_GETALL_Mem);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ordVO = new OrdersVO();
				ordVO.setOrd_status(rs.getInt("ord_status"));
				ordVO.setOrd_time(rs.getTimestamp("ord_time"));
				if (Conditions(ordVO, sel_stus, sel_time) == false) {
					continue;
				}
				ordVO.setOrd_time(rs.getTimestamp("ord_time"));
				ordVO.setOrd_id(rs.getInt("ord_id"));
				ordVO.setOrd_getday(rs.getTimestamp("ord_getday"));
				ordVO.setStatus_char(rs.getString("status_char"));
				ordVO.setOrd_reday(rs.getTimestamp("ord_reday"));
				ordVO.setItem_total(rs.getDouble("item_total"));
				list.add(ordVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
		return list;
	} // end select

	
	@Override
	public void user_delete(Integer ord_id , Integer ord_status) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_GETALL_Mem);
			pstmt.setInt(1, ord_status);
			pstmt.setInt(2, ord_id);
			pstmt.executeUpdate();
			
			
			
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	} // end delete
	
	
	
	
	// 非資料庫存取的方法(看是要放在controller或DAO這裡)

	public boolean Conditions(OrdersVO ordVO, Integer sel_stus, String sel_time) {
		Integer ord_status = ordVO.getOrd_status();
		if (sel_stus == 0 || sel_stus.equals(ord_status)) {
			if (con_Time(ordVO, sel_time) == true) {
				return true;
			}
		}
		return false;
	}

	public Boolean con_Time(OrdersVO ordVO, String sel_time) {
		long _user_long = -1;

		if (sel_time.equals("all")) {
			return true;
		} else if (sel_time.equals("1W")) {
			_user_long = 604800;
		} else if (sel_time.equals("1M")) {
			_user_long = 2678400; // 31天
		} else if (sel_time.equals("3M")) {
			_user_long = 8035200; // 93天
		}

		long _today = new Date().getTime() / 1000;
		long _ord_time = ordVO.getOrd_time().getTime() / 1000;
		if (_ord_time + _user_long > _today) {
			return true;
		}

		return false;
	}



}