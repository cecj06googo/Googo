package com.comFirstPage.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO implements ProductsDAO_interface {
//	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
//	String userid = "sa";
//	String passwd = "sa123456";
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://i64nhzkqmt.database.windows.net:1433;database=GGDB";
	String userid = "googocar@i64nhzkqmt";
	String passwd = "Sa123456";
	// Product table 總共17個欄位
	private static final String INSERT_Products = "INSERT INTO Product "
			+ "(com_id, prod_name, prod_type, prod_price, prod_disc,"
			+ "prod_pic,prod_article,prod_subPic1,prod_kind,"
			+ "prod_cc,prod_carrier, prod_control, prod_subPic2, prod_subPic3, prod_plate, prod_status) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";// 16個

	private static final String GET_ALL_Products = "SELECT prod_id, com_id, prod_name," // 2
			+ " prod_type, prod_price,prod_disc, prod_pic, prod_article, prod_subPic1,"// 6
			+ "prod_subPic2,prod_subPic3,prod_kind, prod_cc," // 4
			+ " prod_carrier, prod_control, prod_plate, prod_status "// 4
			+ "FROM Product WHERE prod_status = 1";

	private static final String GET_AProductByComId = "SELECT prod_id, com_id, prod_name," // 2
			+ " prod_type, prod_price,prod_disc, prod_pic, prod_article, prod_subPic1,"// 6
			+ "prod_subPic2,prod_subPic3,prod_kind, prod_cc," // 4
			+ " prod_carrier, prod_control, prod_plate, prod_status "// 4
			+ "FROM Product WHERE com_id=? and prod_status = 1";
	
	private static final String GET_AProductByComIdNORepeat ="SELECT prod_id, com_id, prod_name," // 2
			+ " prod_type, prod_price,prod_disc, prod_pic, prod_article, prod_subPic1,"// 6
			+ "prod_subPic2,prod_subPic3,prod_kind, prod_cc," // 4
			+ " prod_carrier, prod_control, prod_plate, prod_status "// 4
			+ "From product where prod_status = 1 and prod_id in (select max(prod_id)"
			+"from Product where com_id=? group by prod_name)";	 
	
	private static final String SELECT_Products = " SELECT prod.prod_name, prod.prod_disc, prod.prod_price, plate.plate_id"
			+ "FROM Product prod JOIN Prod_plate plate  "
			+ "ON prod.prod_id =  plate.prod_id " + "WHERE  plate_id = ? ";

	private static final String DELETE_PROD = "UPDATE Product SET prod_status = ? WHERE prod_id = ? ";

	// 無法解決重新上架的問題

	@Override
	public void insert(ProductVO ProductVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		// PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		System.out.println(ProductVO.getComId());
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_Products,
					Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, ProductVO.getComId());
			pstmt.setString(2, ProductVO.getProdName());
			pstmt.setInt(3, ProductVO.getProdType());
			pstmt.setDouble(4, ProductVO.getProdPrice());
			pstmt.setDouble(5, ProductVO.getProdDisc());
			pstmt.setBytes(6, ProductVO.getProdPic());
			pstmt.setString(7, ProductVO.getProdArticle());
			pstmt.setBytes(8, ProductVO.getProdSubPic1());
			pstmt.setInt(9, ProductVO.getProdKind());
			pstmt.setDouble(10, ProductVO.getProdCc());
			pstmt.setInt(11, ProductVO.getProdCarrier());
			pstmt.setInt(12, ProductVO.getProdControl());
			pstmt.setBytes(13, ProductVO.getProdSubPic2());
			pstmt.setBytes(14, ProductVO.getProdSubPic3());
			pstmt.setString(15, ProductVO.getProdPlate());
			pstmt.setInt(16, ProductVO.getProdStatus());

			pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			closeResource(con, pstmt, rs);
		}
	} // end insert

	public List<ProductVO> getProdsByComId(int comId) { //根據哪家公司去找到該公司所有產品
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO ProductVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(GET_AProductByComId);
			pstmt.setInt(1, comId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO = new ProductVO();
				ProductVO.setProdId(rs.getInt("prod_id"));
				ProductVO.setComId(rs.getInt("com_id"));
				ProductVO.setProdName(rs.getString("prod_name"));
				ProductVO.setProdType(rs.getInt("prod_type"));
				ProductVO.setProdPrice(rs.getDouble("prod_price"));
				ProductVO.setProdDisc(rs.getDouble("prod_disc"));
				ProductVO.setProdPic(rs.getBytes("prod_pic"));
				ProductVO.setProdArticle(rs.getString("prod_article"));
				ProductVO.setProdSubPic1(rs.getBytes("prod_subPic1"));
				ProductVO.setProdSubPic2(rs.getBytes("prod_subPic2"));
				ProductVO.setProdSubPic3(rs.getBytes("prod_subPic3"));
				ProductVO.setProdKind(rs.getInt("prod_kind"));
				ProductVO.setProdCc(rs.getDouble("prod_cc"));
				ProductVO.setProdCarrier(rs.getInt("prod_carrier"));
				ProductVO.setProdControl(rs.getInt("prod_control"));
				ProductVO.setProdPlate(rs.getString("prod_plate"));
				ProductVO.setProdType(rs.getInt("prod_status")); // total=17
				list.add(ProductVO);
				// System.out.println("in DAO:"+ProductVO.getComId());
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
			closeResource(con, pstmt, rs);
		}
		return list;
	}//public List<ProductVO> getProdsByComId
	
	public List<ProductVO> getProdsByComIdNoRepeat(int comId) { //根據哪家公司去找到該公司所有產品
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO ProductVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(GET_AProductByComIdNORepeat);
			pstmt.setInt(1, comId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO = new ProductVO();
				ProductVO.setProdId(rs.getInt("prod_id"));
				ProductVO.setComId(rs.getInt("com_id"));
				ProductVO.setProdName(rs.getString("prod_name"));
				ProductVO.setProdType(rs.getInt("prod_type"));
				ProductVO.setProdPrice(rs.getDouble("prod_price"));
				ProductVO.setProdDisc(rs.getDouble("prod_disc"));
				ProductVO.setProdPic(rs.getBytes("prod_pic"));
				ProductVO.setProdArticle(rs.getString("prod_article"));
				ProductVO.setProdSubPic1(rs.getBytes("prod_subPic1"));
				ProductVO.setProdSubPic2(rs.getBytes("prod_subPic2"));
				ProductVO.setProdSubPic3(rs.getBytes("prod_subPic3"));
				ProductVO.setProdKind(rs.getInt("prod_kind"));
				ProductVO.setProdCc(rs.getDouble("prod_cc"));
				ProductVO.setProdCarrier(rs.getInt("prod_carrier"));
				ProductVO.setProdControl(rs.getInt("prod_control"));
				ProductVO.setProdPlate(rs.getString("prod_plate"));
				ProductVO.setProdStatus(rs.getInt("prod_status")); // total=17
				
				list.add(ProductVO);
				// System.out.println("in DAO:"+ProductVO.getComId());
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
			closeResource(con, pstmt, rs);
		}
		return list;
	}//public List<ProductVO> getProdsByComId

	@Override
	public List<ProductVO> getAll() { //取得所有的產品資訊(包括所有公司的產品)
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO ProductVO= new ProductVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_Products);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVO = new ProductVO();
				ProductVO.setProdId(rs.getInt("prod_id"));
				ProductVO.setComId(rs.getInt("com_id"));
				ProductVO.setProdName(rs.getString("prod_name"));
				ProductVO.setProdType(rs.getInt("prod_type"));
				ProductVO.setProdPrice(rs.getDouble("prod_price"));
				ProductVO.setProdDisc(rs.getDouble("prod_disc"));
				ProductVO.setProdPic(rs.getBytes("prod_pic"));
				ProductVO.setProdArticle(rs.getString("prod_article"));
				ProductVO.setProdSubPic1(rs.getBytes("prod_subPic1"));
				ProductVO.setProdSubPic2(rs.getBytes("prod_subPic2"));
				ProductVO.setProdSubPic3(rs.getBytes("prod_subPic3"));
				ProductVO.setProdKind(rs.getInt("prod_kind"));
				ProductVO.setProdCc(rs.getDouble("prod_cc"));
				ProductVO.setProdCarrier(rs.getInt("prod_carrier"));
				ProductVO.setProdControl(rs.getInt("prod_control"));
				ProductVO.setProdPlate(rs.getString("prod_plate"));
				ProductVO.setProdType(rs.getInt("prod_status")); // total=17
				list.add(ProductVO);
				// System.out.println("in DAO:"+ProductVO.getComId());
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
			closeResource(con, pstmt, rs);
		}
		return list;
	} // end mem_getAll

	@Override
	public void delete(int prodId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_PROD);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, prodId);
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
			closeResource(con, pstmt, rs);
		}// end finally
	} // end delete

	public void closeResource(Connection con, Statement stmt, ResultSet rs) { // 關閉資源
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException se) {
				System.out.println("錯誤:rs.close發生錯誤，SQLException");
				se.printStackTrace(System.err);
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException se) {
				System.out.println("錯誤:stmt.close發生錯誤，SQLException");
				se.printStackTrace(System.err);
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				System.out.println("錯誤:con.close發生錯誤，SQLException");
				e.printStackTrace(System.err);
			}
		}
	}// public void closeResource()
}// end public class ProductsDAO