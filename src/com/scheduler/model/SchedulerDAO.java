package com.scheduler.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.orders.model.OrdersVO;
import com.util.ConnectConstant;




public class SchedulerDAO {
	
	String driver = ConnectConstant.driver;
	String url = ConnectConstant.url;
	String userid = ConnectConstant.userid;
	String passwd = ConnectConstant.passwd;

	private static final String UPDATE_PROD_ID = 
		"UPDATE Ord_item set prod_id = (select prod_id from Product where prod_plate=?) where item_id = ?";
	private static final String GET_ALL_STMT = 
		"SELECT ord_getday,ord_reday,ord.ord_id,prod_name,item_name,item_phone,prod_plate,prod_type  FROM Ord_item orditem JOIN Orders ord  ON ord.ord_id  =  orditem.ord_id JOIN Product prod ON prod.prod_id = orditem.prod_id  where ord.com_id = ? order by prod_name";
	private static final String GET_ALL_CAR = 
		"SELECT prod_name,prod_plate FROM  Product  where com_id = ? and prod_status=1 order by prod_type,prod_name";	
	private  String SEARCH_STMT = 
		"SELECT ord_getday,ord_reday,ord.ord_id,prod_name,item_name,item_phone,prod_plate,prod_type  FROM Ord_item orditem JOIN Orders ord  ON ord.ord_id  =  orditem.ord_id JOIN Product prod ON prod.prod_id = orditem.prod_id  where ord.com_id = ? ";
	private  String SEARCH_PLATE_STMT = 
		"SELECT prod_name,prod_plate FROM  Product  where com_id = ? and prod_status=1";
	
	
	public void update(String prod_plate,Integer item_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
 
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_PROD_ID);
			
			pstmt.setString(1,prod_plate);
			pstmt.setInt(2,item_id);
			
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
	}//update end
	
	public List<SchedulerVO> getAll(Integer com_id) {
		List<SchedulerVO> list = new ArrayList<SchedulerVO>();
		SchedulerVO schedulerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			pstmt.setInt(1, com_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				schedulerVO = new SchedulerVO();
				schedulerVO.setOrd_getday(rs.getTimestamp("ord_getday"));
				schedulerVO.setOrd_reday(rs.getTimestamp("ord_reday"));
				schedulerVO.setOrd_id(rs.getInt("ord_id"));
				schedulerVO.setProd_name(rs.getString("prod_name"));
				schedulerVO.setItem_name(rs.getString("item_name"));
				schedulerVO.setItem_phone(rs.getString("item_phone"));
				schedulerVO.setProd_plate(rs.getString("prod_plate"));
				schedulerVO.setProd_type(rs.getInt("prod_type"));
				list.add(schedulerVO); // Store the row in the list
			}
			System.out.println("全部搜尋-訂單資料抓取完畢");

		} catch (ClassNotFoundException e) {
			System.out.println("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	}
	
	public List<SchedulerVO> getAllCarPlate(Integer com_id) {
		List<SchedulerVO> list = new ArrayList<SchedulerVO>();
		SchedulerVO schedulerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_CAR);
			pstmt.setInt(1, com_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				schedulerVO = new SchedulerVO();
				schedulerVO.setProd_name(rs.getString("prod_name"));
				schedulerVO.setProd_plate(rs.getString("prod_plate"));
				list.add(schedulerVO); // Store the row in the list
			}
			System.out.println("全部搜尋-車輛資料抓取完畢");
		} catch (ClassNotFoundException e) {
			System.out.println("Couldn't load database driver. "
					+ e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());

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
	}
	
	public List<SchedulerVO> searchGetAll(Integer com_id,Integer prod_type, String keySearch) {
		List<SchedulerVO> list = new ArrayList<SchedulerVO>();
		SchedulerVO schedulerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// ----------可能需要改變的參數------------------
			String nonLocation = "地區";
			String nonProdType = "交通工具";
		//----------------------------------------
		
		try {
			if (prod_type != null) { // 交通工具不是空的
				SEARCH_STMT += " and prod_type = " + prod_type;
			}
			if (keySearch != null) {// keySearch不是空的
				SEARCH_STMT += " and (prod_name like N'%" + keySearch +"%')";
			}
			SEARCH_STMT +="order by prod_name";
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_STMT);
			pstmt.setInt(1, com_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				schedulerVO = new SchedulerVO();
				schedulerVO.setOrd_getday(rs.getTimestamp("ord_getday"));
				schedulerVO.setOrd_reday(rs.getTimestamp("ord_reday"));
				schedulerVO.setOrd_id(rs.getInt("ord_id"));
				schedulerVO.setProd_name(rs.getString("prod_name"));
				schedulerVO.setItem_name(rs.getString("item_name"));
				schedulerVO.setItem_phone(rs.getString("item_phone"));
				schedulerVO.setProd_plate(rs.getString("prod_plate"));
				schedulerVO.setProd_type(rs.getInt("prod_type"));
				list.add(schedulerVO); // Store the row in the list

			}
			System.out.println("使用搜尋-訂單資料抓取完畢");
		} catch (ClassNotFoundException e) {
			System.out.println("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	}
	
	public List<SchedulerVO> searchAllCarPlate(Integer com_id,Integer prod_type, String keySearch) {
		List<SchedulerVO> list = new ArrayList<SchedulerVO>();
		SchedulerVO schedulerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			if (prod_type != null) { // 交通工具不是空的
				SEARCH_PLATE_STMT += " and prod_type = " + prod_type;
			}
			if (keySearch != null) {// keySearch不是空的
				SEARCH_PLATE_STMT += " and (prod_name like N'%" + keySearch +"%')";
			}
			SEARCH_PLATE_STMT +="order by prod_type,prod_name";
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_PLATE_STMT);
			pstmt.setInt(1, com_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				schedulerVO = new SchedulerVO();
				schedulerVO.setProd_name(rs.getString("prod_name"));
				schedulerVO.setProd_plate(rs.getString("prod_plate"));
				list.add(schedulerVO); // Store the row in the list
			}
			System.out.println("使用搜尋-車輛資料抓取完畢");
		} catch (ClassNotFoundException e) {
			System.out.println("Couldn't load database driver. "
					+ e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());

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
	}
	
}
