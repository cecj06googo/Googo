package com.products.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO implements ProductsDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_Product = "INSERT INTO Product "
			+ "(com_id, prod_name, prod_type, prod_price, prod_disc,"
			+ "prod_pic,prod_article,prod_subPic1,prod_kind,"
			+ "prod_cc,prod_carrier, prod_control, prod_subPic2, prod_subPic3, prod_plate, prod_status) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";// 16個
	// PROD ID  IDENTITY
	private static final String GET_ALL_Products = "SELECT prod_id, com_id, prod_name,"
			+ " prod_type, prod_disc, prod_price, prod_pic, prod_article, prod_kind, prod_cc,"
			+ " prod_carrier, prod_control, prod_plate, prod_status FROM Product WHERE com_id = ? AND prod_status = 1";

	private static final String DELETE_Product = "UPDATE Product SET prod_status = ? WHERE prod_id = ? ";

	// 無法解決重新上架的問題
	
	private static final String EDIT_Product = "UPDATE Product "
			+ "SET prod_name = ?, prod_price = ?, prod_disc = ?, prod_article = ?,"
			+ "prod_plate = ?, prod_pic = ?, prod_subPic1 = ?, prod_subPic2 = ?,"
			+ "prod_subPic3 = ?  WHERE prod_id = ?";
	
	@Override
	public void insert(ProductVO ProductVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		System.out.println(ProductVO.getComId());
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_Product,
					Statement.RETURN_GENERATED_KEYS);
			System.out.println(Statement.RETURN_GENERATED_KEYS);
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
			System.out.println("herer");
			pstmt.executeUpdate();
			
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				int generatedKey = rs.getInt(1);
				ProductVO.setProdId(generatedKey);
				System.out.println(ProductVO.getProdId());
			}
			
			// System.out.println(ProductVO.getProd_id());
			// System.out.println(ProductVO.getCom_id());
			// System.out.println(ProductVO.getProd_name());
			// System.out.println(ProductVO.getProd_type());
			//
			//
			// (plate_id, prod_id, plate_status) VALUE(?, ?, ?);

			System.out.println("herer");

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
	public List<ProductVO> getAll(ProductVO ProductVO) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_Products);
			pstmt.setInt(1, ProductVO.getComId());
			// System.out.println(ProductVO.getComId()+" in DAO1");
			rs = pstmt.executeQuery();

			// ProductVO.setPlateId(rs.getDouble("prod.prod_disc"));
			// prod.prod_name, prod.prod_disc, prod.prod_price, plate.plate_id
			while (rs.next()) {
				ProductVO = new ProductVO();
				ProductVO.setProdId(rs.getInt("prod_id"));
				ProductVO.setComId(rs.getInt("com_id"));
				ProductVO.setProdName(rs.getString("prod_name"));
				ProductVO.setProdType(rs.getInt("prod_type"));
				ProductVO.setProdDisc(rs.getDouble("prod_disc"));
				ProductVO.setProdPrice(rs.getDouble("prod_price"));
				ProductVO.setProdArticle(rs.getString("prod_article"));
				ProductVO.setProdKind(rs.getInt("prod_kind"));
				ProductVO.setProdCc(rs.getInt("prod_cc"));
				ProductVO.setProdCarrier(rs.getInt("prod_carrier"));
				ProductVO.setProdControl(rs.getInt("prod_control"));
				ProductVO.setProdPlate(rs.getString("prod_plate"));
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
	public void delete(int prodId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_Product);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, prodId);
			// System.out.println(plateId);
			pstmt.executeUpdate();
			// System.out.println(pstmt.executeUpdate());
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

	@Override
	public void edit(ProductVO ProductVO) {
//		SET prod_name = ?, prod_price = ?, prod_disc = ?, prod_article = ?,"
//				+ "prod_plate = ? , prod_pic = ?, prod_subPic1 = ?, prod_subPic2 = ?, prod_subPic3 = ?,WHERE prod_id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(EDIT_Product,
					Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, ProductVO.getProdName());
			pstmt.setDouble(2, ProductVO.getProdPrice());
			pstmt.setDouble(3, ProductVO.getProdDisc());
			pstmt.setString(4, ProductVO.getProdArticle());
			pstmt.setString(5, ProductVO.getProdPlate());
			pstmt.setBytes(6, ProductVO.getProdPic());
			pstmt.setBytes(7, ProductVO.getProdSubPic1());
			pstmt.setBytes(8, ProductVO.getProdSubPic2());
			pstmt.setBytes(9, ProductVO.getProdSubPic3());
			pstmt.setInt(10, ProductVO.getProdId());
			System.out.println("here.");
			pstmt.executeUpdate();
			System.out.println("herer");

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

			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

}