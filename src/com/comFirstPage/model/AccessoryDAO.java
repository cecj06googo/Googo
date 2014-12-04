package com.comFirstPage.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AccessoryDAO implements AccessoryDAO_interface {
//	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
//	String userid = "sa";
//	String passwd = "sa123456";
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://i64nhzkqmt.database.windows.net:1433;database=GGDB";
	String userid = "googocar@i64nhzkqmt";
	String passwd = "Sa123456";

	private static final String INSERT_ACCESSORY = "INSERT INTO Accessory "
			+ "(acc_name, com_id, acc_detail, acc_pic, acc_price, acc_status) "
			+ "VALUES (?, ?, ?, ?, ?, ?)";//6個
	// ACC ID  IDENTITY
	private static final String GET_ALL_ACCESSORYS = "SELECT * FROM Accessory WHERE com_id = ? AND acc_status = 1";

	private static final String DELETE_ACCESSORY = "UPDATE Accessory SET acc_status = 0 WHERE prod_id = ? ";

	// 無法解決重新上架的問題
	
	private static final String EDIT_ACCESSORY = "UPDATE Accessory "
			+ "SET ac_name = ?, acc_detail = ?, acc_pic = ?, acc_price = ?, WHERE prod_id = ?";
	
	@Override
	public void insert(AccessoryVO accVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		System.out.println(accVO.getComId());
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_ACCESSORY,
					Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, accVO.getAccName());
			pstmt.setInt(2, accVO.getComId());
			pstmt.setString(3, accVO.getAccDetail());
			pstmt.setBytes(4, accVO.getAccPic());
			pstmt.setDouble(5, accVO.getAccPrice());
			pstmt.setInt(6, accVO.getAccStatus());
			System.out.println("herer");
			pstmt.executeUpdate();


			System.out.println("hererr accDAO");

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
	public List<AccessoryVO> getAccVosByComId(int ComId) {
		List<AccessoryVO> list = new ArrayList<AccessoryVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AccessoryVO accVO;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_ACCESSORYS);
			pstmt.setInt(1, ComId); 
			// System.out.println(accVO.getComId()+" in VO1");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				accVO = new AccessoryVO();
				accVO.setAccId(rs.getInt("acc_id"));
				accVO.setComId(rs.getInt("com_id"));
				accVO.setAccName(rs.getString("acc_name"));
				accVO.setAccPrice(rs.getDouble("acc_price"));
				accVO.setAccDetail(rs.getString("acc_detail"));
				accVO.setAccPic(rs.getBytes("acc_pic"));
				list.add(accVO);
				// System.out.println("in VO:"+accVO.getComId());
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
	public List<AccessoryVO> getAll(AccessoryVO accVO) {
		List<AccessoryVO> list = new ArrayList<AccessoryVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_ACCESSORYS);
			pstmt.setInt(1, accVO.getComId()); 
			// System.out.println(accVO.getComId()+" in VO1");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				accVO = new AccessoryVO();
				accVO.setAccId(rs.getInt("acc_id"));
				accVO.setComId(rs.getInt("com_id"));
				accVO.setAccName(rs.getString("acc_name"));
				accVO.setAccPrice(rs.getDouble("acc_price"));
				accVO.setAccDetail(rs.getString("acc_detail"));
				accVO.setAccPic(rs.getBytes("acc_pic"));
				list.add(accVO);
				// System.out.println("in VO:"+accVO.getComId());
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
	public void delete(int accId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_ACCESSORY);
			pstmt.setInt(1, accId);
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
	public void edit(AccessoryVO accVO) {
//		SET prod_name = ?, prod_price = ?, prod_disc = ?, prod_article = ?,"
//				+ "prod_plate = ? , prod_pic = ?, prod_subPic1 = ?, prod_subPic2 = ?, prod_subPic3 = ?,WHERE prod_id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(EDIT_ACCESSORY,
					Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, accVO.getAccName());
			pstmt.setString(2, accVO.getAccDetail());
			pstmt.setBytes(3, accVO.getAccPic());
			pstmt.setDouble(4, accVO.getAccPrice());
			pstmt.setInt(5, accVO.getAccId());
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