package com.forgetpwd.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.company.model.CompanyVO;
import com.member.model.MemVO;

public class ForgetPwdJDBCDAO implements ForgetPwdDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://i64nhzkqmt.database.windows.net:1433;database=GGDB";
	String userid = "googocar@i64nhzkqmt";
	String passwd = "Sa123456";
/*	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "sa123456";
*/	
	private static final String MEM_PWD_UPDATE = 
			"UPDATE Member set mem_pwd=? where mem_account=? ";
	private static final String COM_PWD_UPDATE = 
			"UPDATE Company set com_pwd=? where com_account=? ";
	private static final String GET_MEM_ACCOUNT =
			"SELECT mem_account, mem_pwd FROM Member where mem_account=? ";
	private static final String GET_COM_ACCOUNT =
			"SELECT com_account, com_pwd FROM Company where com_account=? ";
	private static final String GET_MEM_ID =
			"SELECT mem_id FROM Member where mem_account=?";
	private static final String GET_COM_ID =
			"SELECT com_id FROM Company where com_account=?";
	private static final String GET_ONE_MEM_STMT_BY_QQ = 
			"SELECT mem_id, mem_account,mem_pwd,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address,mem_status,mem_qq FROM Member where mem_qq = ?";
	private static final String GET_ONE_COM_STMT_BY_HASH = 
			"SELECT com_id, com_account,com_pwd,com_name,com_owner, com_vat,com_tel,com_fax,com_address,com_status,com_hashURL FROM Company where com_hashURL = ?";
	private static final String UPDATE_COM = 
			"UPDATE Company set com_account=?,com_pwd=?,com_name=?,com_owner=?,com_vat=?,com_tel=?,com_fax=?,com_address=?,com_status=?,com_hashURL=? where com_id=?";

	@Override
	public void update(String user_identity,String user_account,String user_newPwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			Class.forName("driver");
			con = DriverManager.getConnection(url, userid, passwd);
			if("Mem".equals(user_identity)){
				pstmt = con.prepareStatement(MEM_PWD_UPDATE);
				pstmt.setString(1, user_newPwd);
				pstmt.setString(2, user_account);
				pstmt.executeUpdate();
			}else if("Com".equals(user_identity)){
				pstmt = con.prepareStatement(COM_PWD_UPDATE);
				pstmt.setString(1, user_newPwd);
				pstmt.setString(2, user_account);
				pstmt.executeUpdate();
			}
			
			
			
			
		}catch (ClassNotFoundException e) {
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
	public ForgetPwdVO findByUserAccount(String user_account, String user_identity) {
		ForgetPwdVO forgetPwdVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName("driver");
			con = DriverManager.getConnection(url, userid, passwd);
			if("Mem".equals(user_identity)){
				pstmt = con.prepareStatement(GET_MEM_ACCOUNT);
			}else if("Com".equals(user_identity)){
				pstmt = con.prepareStatement(GET_COM_ACCOUNT);
			}
			pstmt.setString(1, user_account);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if("Mem".equals(user_identity)){
					forgetPwdVO = new ForgetPwdVO();
					forgetPwdVO.setMem_account(rs.getString("mem_account"));
				}else if("Com".equals(user_identity)){
					forgetPwdVO = new ForgetPwdVO();
					forgetPwdVO.setCom_account(rs.getString("com_account"));
				}
			}
			}catch(ClassNotFoundException e){
				throw new RuntimeException("Couldn't load database driver."+e.getMessage());
				
			}catch(SQLException se){
				throw new RuntimeException("A database error occured."+se.getErrorCode());
			}finally{
				if(rs !=null){
					try{
						rs.close();
					}catch(SQLException se){
						se.printStackTrace(System.err);
					}
				}
				if(pstmt != null){
					try{
						pstmt.close();
					}catch(SQLException se){
						se.printStackTrace(System.err);
					}
				}
				if(con != null){
					try{
						con.close();
					}catch(Exception e){
						e.printStackTrace(System.err);
					}
				}
			}
		
		return forgetPwdVO;
	}
	
	public Integer findUserId(String user_account, String user_identity){
		Integer userId = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);
			if ("Mem".equals(user_identity)) {
				pstmt = con.prepareStatement(GET_MEM_ID);

			} else if ("Com".equals(user_identity)) {
				pstmt = con.prepareStatement(GET_COM_ID);
			}

			pstmt.setString(1, user_account);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if ("Mem".equals(user_identity)) {
					userId = rs.getInt("mem_id");
				} else if ("Com".equals(user_identity)) {
					userId = rs.getInt("com_id");
				}
			}
				return userId;
		
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

		} // end finally
	}
	
	public MemVO findByQQ(String mem_qq) {

		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_MEM_STMT_BY_QQ);
			//"SELECT mem_account,mem_pwd,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address FROM Member where mem_id = ?";
			pstmt.setString(1,mem_qq);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				memVO = new MemVO();
				// next line modified by Ranian to get member id
				memVO.setMem_id(rs.getInt("mem_id"));
				memVO.setMem_account(rs.getString("mem_account"));
				memVO.setMem_pwd(rs.getString("mem_pwd"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_gender(rs.getInt("mem_gender"));
				memVO.setMem_bdate(rs.getDate("mem_bdate"));
				memVO.setMem_idnumber(rs.getString("mem_idnumber"));
				memVO.setMem_tel(rs.getString("mem_tel"));
				memVO.setMem_phone(rs.getString("mem_phone"));
				memVO.setMem_address(rs.getString("mem_address"));
				memVO.setMem_status(rs.getInt("mem_status"));
				memVO.setMem_qq(rs.getString("mem_qq"));

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
	
	public CompanyVO findByHash(String com_hashURL) {

		CompanyVO comVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_COM_STMT_BY_HASH);
			//"SELECT mem_account,mem_pwd,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address FROM Member where mem_id = ?";
			pstmt.setString(1,com_hashURL);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				comVO = new CompanyVO();
				// next line modified by Ranian to get member id
				comVO.setComID(rs.getInt("com_id"));
				comVO.setComAccount(rs.getString("com_account"));
				comVO.setComPwd(rs.getString("com_pwd"));
				comVO.setComName(rs.getString("com_name"));
				comVO.setComOwner(rs.getString("com_owner"));
				comVO.setComAddr(rs.getString("com_address"));
				comVO.setComTel(rs.getString("com_tel"));
				comVO.setComFax(rs.getString("com_fax"));
				comVO.setComVAT(rs.getString("com_vat"));
				comVO.setComStatus(rs.getInt("com_status"));
				comVO.setComHashURL(rs.getString("com_hashURL"));

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
		return comVO;
	}
	
	public void updateCom(CompanyVO comVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_COM);

			// com_id=? com_account=?com_pwd=?com_name=?com_owner=?com_vat=?com_tel=?com_fax=?com_address=?com_status=?com_hashURL=?";
			pstmt.setString(1, comVO.getComAccount());
			pstmt.setString(2, comVO.getComPwd());
			pstmt.setString(3, comVO.getComName());
			pstmt.setString(4, comVO.getComOwner());
			pstmt.setString(5, comVO.getComVAT());
			pstmt.setString(6, comVO.getComTel());
			pstmt.setString(7, comVO.getComFax());
			pstmt.setString(8, comVO.getComAddr());
			pstmt.setInt(9, comVO.getComStatus());
			pstmt.setString(10, comVO.getComHashURL());
			pstmt.setInt(11, comVO.getComID());
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


}
