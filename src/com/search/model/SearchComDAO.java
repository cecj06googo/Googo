package com.search.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class SearchComDAO implements SearchComDAO_interface {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String GET_ONE_STMT = "select com_id,com_name,com_address from Company where com_id = ?";
	private String Search_Com_STMT = "select distinct com.com_id,com.com_name,com.com_address"
			+ " FROM   Company   com LEFT OUTER  JOIN  Product   prod "
			+ "ON     com.com_id  =  prod.com_id " + "where 1=1";

	public List<SearchComVO> SearchByCondition(String location, //根據搜尋條件查詢該商家的資料
			Integer prod_type, String keySearch) {
		List<SearchComVO> comList = new ArrayList<SearchComVO>();
        //根據搜尋條件查詢該商家的資料
		SearchComVO comVO = null;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		// ----------可能需要改變的參數-------------------
		String nonLocation = "地區";
		String nonProdType = "交通工具";
		// ----------------------------------------------

		try {
			if (location != null) { // 地區不是空的
				Search_Com_STMT += " and com.com_address like '%" + location
						+ "%'";
			}
			if (prod_type != null) { // 交通工具不是空的
				Search_Com_STMT += " and prod.prod_type = " + prod_type;
			}
			if (keySearch != null) {// keySearch不是空的
				Search_Com_STMT += " and (com.com_name like'%" + keySearch
						+ "%' " + "or com.com_address like '%" + keySearch
						+ "%' " + "or prod.prod_name like '%" + keySearch
						+ "%')";
			}
			System.out.println(Search_Com_STMT); // Antai test
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			stmt = con.createStatement();
			rs = stmt.executeQuery(Search_Com_STMT);
			while (rs.next()) {
				comVO = new SearchComVO();
				comVO.setCom_id(rs.getInt("com_id"));
				comVO.setCom_name(rs.getString("com_name"));
				comVO.setCom_address(rs.getString("com_address"));
				comList.add(comVO);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("錯誤:SearchComDAO的SearchByCondition發生錯誤,ClassNotFoundException");
			e.printStackTrace();
		} catch (SQLException se) {
			System.out.println("錯誤:SearchComDAO的SearchByCondition發生錯誤，SQLException");
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			closeResource(con, stmt, rs);
		}// finally
		return comList;
	}// public SearchComVO SearchByCondition(String location,Integer prod_type )

	public SearchComVO findByPrimaryKey(Integer com_id) { //根據com_id去查詢該商家的資料
		// TODO Auto-generated method stub
        
		SearchComVO comVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
        //根據com_id去查詢該商家的資料
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, com_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comVO = new SearchComVO();
				comVO.setCom_id(rs.getInt("com_id"));
				comVO.setCom_name(rs.getString("com_name"));
				comVO.setCom_address(rs.getString("com_address"));
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("錯誤:SearchComDAO的findByPrimaryKey發生錯誤,ClassNotFoundException");
			e.printStackTrace();
		} catch (SQLException se) {
			System.out.println("錯誤:SearchComDAO的findByPrimaryKey發生錯誤，SQLException");
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			closeResource(con, pstmt, rs);
		}// finally
		return comVO;
	}// public SearchComVO findByPrimaryKey

	public void closeResource(Connection con, Statement stmt, ResultSet rs) { //關閉資源
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException se) {
				System.out.println("錯誤:SearchComDAO的rs.close發生錯誤，SQLException");
				se.printStackTrace(System.err);
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException se) {
				System.out.println("錯誤:SearchComDAO的stmt.close發生錯誤，SQLException");
				se.printStackTrace(System.err);
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				System.out.println("錯誤:SearchComDAO的con.close發生錯誤，SQLException");
				e.printStackTrace(System.err);
			}
		}
	}// public void closeResource()
}// public class SearchComDAO implements SearchComDAO_interface
