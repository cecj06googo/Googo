package com.orders.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrdersJDBCDAO implements OrdersDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_Orders = 
			"INSERT INTO Orders (ord_status,com_id,mem_id,ord_time,ord_getday,ord_reday,ord_lastuptime,item_total)"
			+ " VALUES (?, ?, ?, ?, ?, ?,null,?)";
	private static final String INSERT_OrderItem = 
			"INSERT INTO Ord_item (ord_id,prod_id,acc_id,item_name,item_tel,item_phone,item_email,pritem_acc,item_all)"
			+ " VALUES (?,?,?,?,?,?,?,?,?)";
	private static final String SELECT_GETALL_Mem = 
			" SELECT ord.ord_id, ord.ord_status, sta.status_char, ord_time, ord_getday, ord_reday , ord_lastuptime , item_total "
			+ "FROM Orders ord JOIN Ord_status sta  "
			+ "ON ord.ord_status =  sta.ord_status "
			+ "WHERE  mem_id = ? "
			+ "ORDER BY ord.ord_status, ord_id";
	
	private static final String SELECT_GETALL_Com = 
			"SELECT ord.ord_id, ord.ord_status, sta.status_char, mem_account ,ord_time, ord_getday, ord_reday , ord_lastuptime , item_total , item_name,item_tel,item_phone,item_email,pritem_acc,item_all, prod_name,prod_plate,prod_price,prod_disc,acc_price,acc_detail FROM Orders ord JOIN Ord_status sta  ON ord.ord_status =  sta.ord_status JOIN Member mem  ON ord.mem_id = mem.mem_id JOIN Ord_item item  ON ord.ord_id = item.ord_id JOIN Product prod  ON item.prod_id = prod.prod_id JOIN Accessory acc  ON item.acc_id = acc.acc_id WHERE ord.com_id = ? ORDER BY ord.ord_status,ord_id" ;
		//串接會出錯，趕時間選擇一條流
	

	
	
	
	
	private static final String UPDATE_ORDER = "UPDATE Orders SET ord_status = ?, ord_lastuptime = ? WHERE ord_id = ?";
	
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
	public List<OrdersVO> mem_getAll(Integer mem_id, Integer orderStatus,
			String orderTime) {
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO ordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_GETALL_Mem);
			pstmt.setInt(1, mem_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ordVO = new OrdersVO();
				ordVO.setOrd_status(rs.getInt("ord_status"));
				ordVO.setOrd_time(rs.getTimestamp("ord_time"));
				if (Conditions(ordVO, orderStatus, orderTime) == false) {
					continue;
				}
				ordVO.setOrd_time(rs.getTimestamp("ord_time"));
				ordVO.setOrd_id(rs.getInt("ord_id"));
				ordVO.setOrd_getday(rs.getTimestamp("ord_getday"));
				ordVO.setStatus_char(rs.getString("status_char"));
				ordVO.setOrd_reday(rs.getTimestamp("ord_reday"));
				ordVO.setOrd_lastuptime(rs.getTimestamp("ord_lastuptime"));
				ordVO.setItem_total(rs.getInt("item_total"));
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
	} // end mem_getAll

	@Override
	public List<OrdersVO> com_getAll(Integer com_id,Integer orderStatus,String orderTime){
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO ordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_GETALL_Com);
			pstmt.setInt(1, com_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ordVO = new OrdersVO();
				ordVO.setOrd_status(rs.getInt("ord_status"));
				ordVO.setOrd_time(rs.getTimestamp("ord_time"));
				if (Conditions(ordVO, orderStatus, orderTime) == false) {
					continue;
				}
				ordVO.setOrd_time(rs.getTimestamp("ord_time"));
				ordVO.setOrd_id(rs.getInt("ord_id"));
				ordVO.setOrd_getday(rs.getTimestamp("ord_getday"));
				ordVO.setStatus_char(rs.getString("status_char"));
				ordVO.setOrd_reday(rs.getTimestamp("ord_reday"));
				ordVO.setOrd_lastuptime(rs.getTimestamp("ord_lastuptime"));
				ordVO.setItem_total(rs.getInt("item_total"));
				ordVO.setMem_account(rs.getString("mem_account"));
				ordVO.setItem_name(rs.getString("item_name"));
				ordVO.setItem_tel(rs.getString("item_tel"));
				ordVO.setItem_phone(rs.getString("item_phone"));
				ordVO.setItem_email(rs.getString("item_email"));;
				ordVO.setPritem_acc(rs.getString("pritem_acc"));
				ordVO.setItem_all(rs.getString("item_all"));
				ordVO.setProd_name(rs.getString("prod_name"));
				ordVO.setProd_plate(rs.getString("prod_plate"));
				ordVO.setProd_price(rs.getDouble("prod_price"));
				ordVO.setProd_disc(rs.getDouble("prod_disc"));
				ordVO.setAcc_price(rs.getDouble("acc_price"));
				ordVO.setAcc_detail(rs.getString("acc_detail"));

					
					
				
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
	}// end com_getAll
	
	
	
	
	@Override
	public void user_action(Integer ord_id , Integer ord_status,Timestamp cancelTime) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_ORDER);
			pstmt.setInt(1, ord_status);
			pstmt.setTimestamp(2, cancelTime);
			pstmt.setInt(3, ord_id);
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
//	public String accountAddStar(String _mem_account){
//		
//		StringBuilder mem_account = new StringBuilder().append(_mem_account);
//		int index= mem_account.indexOf("@");
//		StringBuilder acc_ago = new StringBuilder().append(mem_account.substring(0,index));
//		StringBuilder acc_first = new StringBuilder().append(mem_account.substring(0,1));
//		StringBuilder acc_last = new StringBuilder().append(mem_account.substring(index-1));
//		StringBuilder newAccount = new StringBuilder().append(acc_first);
//		int length = acc_ago.length()-2;
//		for(int i = 0; i < length; i++){
//			newAccount.append("*");
//		}
//		newAccount.append(acc_last);
//		return newAccount.toString();
//	}  11/19 林經理建議不要
	
	
	
	public boolean Conditions(OrdersVO ordVO, Integer orderStatus, String orderTime) {
		Integer ord_status = ordVO.getOrd_status();
		if (orderStatus == 0 || orderStatus.equals(ord_status)) {
			if (con_Time(ordVO, orderTime) == true) {
				return true;
			}
		}
		return false;
	}
	
	public Boolean con_Time(OrdersVO ordVO, String orderTime) {
		long _user_long = -1;

		if (orderTime.equals("all")) {
			return true;
		} else if (orderTime.equals("1W")) {
			_user_long = 604800;
		} else if (orderTime.equals("1M")) {
			_user_long = 2678400; // 31天
		} else if (orderTime.equals("3M")) {
			_user_long = 8035200; // 93天
		}

		long _today = System.currentTimeMillis() / 1000;
		long _ord_time = ordVO.getOrd_time().getTime() / 1000;
		if (_ord_time + _user_long > _today) {
			return true;
		}

		return false;
	}



}