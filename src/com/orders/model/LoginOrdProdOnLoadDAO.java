package com.orders.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.products.model.ProductVO;
import com.util.ConnectConstant;

public class LoginOrdProdOnLoadDAO {
	
	public final static String driver = ConnectConstant.driver;
	public final static String url = ConnectConstant.url;
	public final static String userid = ConnectConstant.userid;
	public final static String passwd = ConnectConstant.passwd;
	
	private static final String SELECT_GETALL_PRODUCTS = "SELECT prod_id,prod_disc,prod_name,prod_type,prod_price FROM product WHERE prod_status = 1 AND prod_id IN (SELECT MAX(prod_id) FROM Product WHERE com_id=? GROUP BY prod_name)";
	private static final String SELECT_GETONE_BYPRODID = "SELECT prod_price,prod_disc FROM product WHERE prod_status = 1 AND prod_id = ?";
	
	public List<ProductOrderVO> getAll(ProductOrderVO ProdOrdVO) {
		List<ProductOrderVO> list = new ArrayList<ProductOrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_GETALL_PRODUCTS);
			pstmt.setInt(1, ProdOrdVO.getComId());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProdOrdVO = new ProductOrderVO();
				ProdOrdVO.setProdId(rs.getInt("prod_id"));
				ProdOrdVO.setProdName(rs.getString("prod_name"));
				ProdOrdVO.setProdType(rs.getInt("prod_type"));
				ProdOrdVO.setProdPrice(rs.getInt("prod_price"));
				ProdOrdVO.setProdDisc(rs.getDouble("prod_disc"));
				ProdOrdVO = compute(ProdOrdVO);
				list.add(ProdOrdVO);
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
	
	public ProductOrderVO prodIdgetAll(ProductOrderVO ProdOrdVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_GETONE_BYPRODID);
			pstmt.setInt(1, ProdOrdVO.getProdId());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProdOrdVO.setProdPrice(rs.getInt("prod_price"));
				ProdOrdVO.setProdDisc(rs.getDouble("prod_disc"));
				ProdOrdVO = compute(ProdOrdVO);
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
		return ProdOrdVO;
	} // end prodIdgetAll
	
	public ProductOrderVO compute(ProductOrderVO ProdOrdVO) {
		Integer price = ProdOrdVO.getProdPrice();
		Double disc = ProdOrdVO.getProdDisc();
		ProdOrdVO.setPriceDiscOK((new Double((price.doubleValue()*disc)).intValue()));
		System.out.println("計算後的價格:"+ProdOrdVO.getPriceDiscOK());
		return ProdOrdVO;
	}
} // end LoginOrdProdOnLoadDAO
