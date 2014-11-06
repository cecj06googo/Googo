package com.member.model;
  
import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
//JNDI
public class MemDAO implements MemDAO_interface {
	
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";

	private static final String INSERT_STMT = 
		"INSERT INTO Member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = 
		"UPDATE Member set mem_pwd=?, mem_name=?, mem_gender=?, mem_bdate=?, mem_idnumber=?, mem_tel=?, mem_phone=?, mem_address=? where mem_id = ?";
	private static final String DELETE = 
		"UPDATE Member set  mem_status=2 where mem_id = ?";
	private static final String GET_ONE_STMT = 
		"SELECT mem_account,mem_pwd,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address FROM Member where mem_id = ?";
	private static final String GET_ALL_STMT = 
		"SELECT mem_account,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address FROM Member order by empno";
	private static final String OPEN_ACCOUNT= 
		"UPDATE Member set mem_status=1 where mem_qq=?";
	
	@Override
	public void insert(MemVO memVO)  {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, memVO.getMem_account());
			pstmt.setString(2, memVO.getMem_pwd());
			pstmt.setString(3, memVO.getMem_name());
			pstmt.setInt(4, memVO.getMem_gender());
			pstmt.setDate(5, memVO.getMem_bdate());
			pstmt.setString(6, memVO.getMem_idnumber());
			pstmt.setString(7, memVO.getMem_tel());
			pstmt.setString(8, memVO.getMem_phone());
			pstmt.setString(9, memVO.getMem_address());
			pstmt.setInt(10,0);
			pstmt.setString(11,memVO.getMem_qq());
			pstmt.executeUpdate();
			
			// Handle any SQL errors
		} catch (ClassNotFoundException e) {
			System.out.println("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			System.out.println("A database error occured. "
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
	@Override
	public void update(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memVO.getMem_pwd());
			pstmt.setString(2, memVO.getMem_name());
			pstmt.setInt(3, memVO.getMem_gender());
			pstmt.setDate(4, memVO.getMem_bdate());
			pstmt.setString(5, memVO.getMem_idnumber());
			pstmt.setString(6, memVO.getMem_tel());
			pstmt.setString(7, memVO.getMem_phone());
			pstmt.setString(8, memVO.getMem_address());
			pstmt.setInt(9, memVO.getMem_id());
			System.out.println("進入DAO");
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			System.out.println("進入錯誤1");
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			System.out.println("進入錯誤2");
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
	@Override
	public void delete(Integer mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, mem_id);
			
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
	
	@Override
	public MemVO findByPrimaryKey(Integer mem_id) {

		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			//"SELECT mem_account,mem_pwd,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address FROM Member where mem_id = ?";
			pstmt.setInt(1,mem_id);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				memVO = new MemVO();
				memVO.setMem_account(rs.getString("mem_account"));
				memVO.setMem_pwd(rs.getString("mem_pwd"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_gender(rs.getInt("mem_gender"));
				memVO.setMem_bdate(rs.getDate("mem_bdate"));
				memVO.setMem_idnumber(rs.getString("mem_idnumber"));
				memVO.setMem_tel(rs.getString("mem_tel"));
				memVO.setMem_phone(rs.getString("mem_phone"));
				memVO.setMem_address(rs.getString("mem_address"));
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
		return memVO;
	}

	@Override
	public List<MemVO> getAll() {
		return null;
	}
	
	@Override
	public List<MemVO> getAll(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public MemVO open(String mem_qq) {

		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(OPEN_ACCOUNT);

			pstmt.setString(1,mem_qq);
			
			pstmt1 = con.prepareStatement("SELECT mem_id,mem_account,mem_pwd,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address FROM Member where mem_qq = ?");
			pstmt1.setString(1,mem_qq);
			rs = pstmt1.executeQuery();
			
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				memVO = new MemVO();
				memVO.setMem_account(rs.getString("mem_account"));
				memVO.setMem_pwd(rs.getString("mem_pwd"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_gender(rs.getInt("mem_gender"));
				memVO.setMem_bdate(rs.getDate("mem_bdate"));
				memVO.setMem_idnumber(rs.getString("mem_idnumber"));
				memVO.setMem_tel(rs.getString("mem_tel"));
				memVO.setMem_phone(rs.getString("mem_phone"));
				memVO.setMem_address(rs.getString("mem_address"));
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
		return memVO;
	}
	

}
