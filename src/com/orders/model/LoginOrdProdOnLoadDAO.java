package com.orders.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.products.model.ProductVO;

public class LoginOrdProdOnLoadDAO {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "sa123456";
	
	private static final String SELECT_GETALL_PRODUCTS = "SELECT prod_id, prod_name FROM product WHERE prod_status = 1 AND prod_id IN (SELECT MAX(prod_id) FROM Product WHERE com_id=? GROUP BY prod_name)";


	public List<ProductVO> getAll(ProductVO ProductVO) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_GETALL_PRODUCTS);
			pstmt.setInt(1, ProductVO.getComId());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO = new ProductVO();
				ProductVO.setProdId(rs.getInt("prod_id"));
				ProductVO.setProdName(rs.getString("prod_name"));
				list.add(ProductVO);
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
	} // end getAll
} // end LoginOrdProdOnLoadDAO
