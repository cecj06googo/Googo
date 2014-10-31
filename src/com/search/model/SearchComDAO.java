package com.search.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Set;

public class SearchComDAO implements SearchComDAO_interface {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String GET_ONE_STMT = "select com_id,com_name,com_address from Company where com_id = ?";
	private static final String Search_Com_STMT = "select distinct com.com_id,com.com_name,com.com_address"
			+ " FROM   Company   com   JOIN  Product   prod "
			+ "ON     com.com_id  =  prod.com_id "
			+ "where  com.com_address like ? and prod.prod_type =?";

	public Set<SearchComVO> SearchByCondition(String location, Integer prod_type) {
		Set<SearchComVO> comSet = new LinkedHashSet<SearchComVO>();

		SearchComVO comVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(Search_Com_STMT);
			pstmt.setString(1, "%" + location + "%");
			pstmt.setInt(2, prod_type);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comVO = new SearchComVO();
				comVO.setCom_id(rs.getInt("com_id"));
				comVO.setCom_name(rs.getString("com_name"));
				comVO.setCom_address(rs.getString("com_address"));
				comSet.add(comVO);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			closeResource(con, pstmt, rs);
		}// finally
		return comSet;
	}// public SearchComVO SearchByCondition(String location,Integer prod_type )

	public SearchComVO findByPrimaryKey(Integer com_id) {
		// TODO Auto-generated method stub

		SearchComVO comVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

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
			e.printStackTrace();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			closeResource(con, pstmt, rs);
		}// finally
		return comVO;
	}// public SearchComVO findByPrimaryKey

	public static void closeResource(Connection con, PreparedStatement pstmt,
			ResultSet rs) {
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
	}// public void closeResource(Connection con,PreparedStatement
		// pstmt,ResultSet rs)
}// public class SearchComDAO implements SearchComDAO_interface
