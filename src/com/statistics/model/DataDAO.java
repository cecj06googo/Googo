package com.statistics.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.scheduler.model.SchedulerVO;



public class DataDAO {
	
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "sa123456";
	
	private String DONUT = 
			"select ord.Ord_status,sta.status_char, count(ord.Ord_status)as countt  from orders ord join ord_status sta on ord.ord_status =sta.ord_status  where com_id=? ";
	private String AREA = 
			"Select ord_getday,prod_type, Sum (item_total) As countt from orders ord join ord_item item on ord.ord_id =item.ord_id join Product prod on item.prod_id =prod.prod_id where ord.com_id=? ";
	private String BAR = 
			"Select top 5 prod_name, count(prod_name) As countt from orders ord join ord_item item on ord.ord_id =item.ord_id join Product prod on item.prod_id =prod.prod_id where ord.com_id=? ";
	private static final String NEWORDER = 
			"Select top 8 ord_id,ord_time, item_total from orders where com_id=? order by ord_time desc";



	public List<DordersVO> Donut(Integer com_id) {
		List<DordersVO> list = new ArrayList<DordersVO>();
		DordersVO ordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Calendar cal = Calendar.getInstance();//使用預設時區和語言環境獲得一個日曆。  
		cal.add(Calendar.DAY_OF_MONTH, -30);//取當前日期的前一天.
		//通過格式化輸出日期  
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");  
		String today =(format.format(Calendar.getInstance().getTime())).toString();  
		String lastMDay=(format.format(cal.getTime())).toString();
		DONUT +="and ord_getday between '"+lastMDay+"' and '"+today+"' group by ord.Ord_status , status_char";
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DONUT);
			pstmt.setInt(1,com_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ordVO = new DordersVO();
				ordVO.setOrd_status(rs.getInt("Ord_status"));
				ordVO.setStatus_char(rs.getString("status_char"));			
				ordVO.setCountt(rs.getInt("Countt"));
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
	}
	

	public List<DordersVO> Area(Integer com_id) {
		List<DordersVO> list = new ArrayList<DordersVO>();
		DordersVO ordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Calendar cal = Calendar.getInstance();//使用預設時區和語言環境獲得一個日曆。  
		cal.add(Calendar.DAY_OF_MONTH, -30);//取當前日期的前一天.
		//通過格式化輸出日期  
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");  
		String today =(format.format(Calendar.getInstance().getTime())).toString();  
		String lastMDay=(format.format(cal.getTime())).toString();
		AREA +="and ord_getday between '"+lastMDay+"' and '"+today+"' Group By prod_type,ord_getday";
		System.out.println(AREA);
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(AREA);
			pstmt.setInt(1,com_id);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ordVO = new DordersVO();
				ordVO.setOrd_getday(rs.getTimestamp("ord_getday"));
				ordVO.setProd_type(rs.getInt("prod_type"));			
				ordVO.setCountt(rs.getInt("Countt"));
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
	}
	
	public List<DordersVO> Bar(Integer com_id) {
		List<DordersVO> list = new ArrayList<DordersVO>();
		DordersVO ordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Calendar cal = Calendar.getInstance();//使用預設時區和語言環境獲得一個日曆。  
		cal.add(Calendar.DAY_OF_MONTH, -30);//取當前日期的前一天.
		//通過格式化輸出日期  
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");  
		String today =(format.format(Calendar.getInstance().getTime())).toString();  
		String lastMDay=(format.format(cal.getTime())).toString();
		BAR +="and ord_getday between '"+lastMDay+"' and '"+today+"' Group By prod_name order by countt desc";

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(BAR);
			pstmt.setInt(1,com_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ordVO = new DordersVO();
				ordVO.setProd_name(rs.getString("prod_name"));		
				ordVO.setCountt(rs.getInt("Countt"));
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
	}

	public List<DordersVO> NewOrder(Integer com_id) {
		List<DordersVO> list = new ArrayList<DordersVO>();
		DordersVO ordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(NEWORDER);
			pstmt.setInt(1,com_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ordVO = new DordersVO();
				ordVO.setOrd_id(rs.getInt("ord_id"));		
				ordVO.setOrd_time(rs.getTimestamp("ord_time"));
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
	}
}
