package com.login.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginJDBCDAO implements LoginDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";

	private static final String MEM_LOGIN_CHECK = "SELECT count(*) FROM  Member WHERE mem_account = ? AND   mem_pwd = ?";

	private static final String COM_LOGIN_CHECK = "SELECT count(*) FROM  Company WHERE com_account = ? AND   com_pwd = ?";

	// 指令碼用""+""時 有可能會發生指令錯誤(原因不明)

	@Override
	public Boolean login(String user_account, String user_pwd,
			String user_identity) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);
			if ("Mem".equals(user_identity)) {
				pstmt = con.prepareStatement(MEM_LOGIN_CHECK);

			} else if ("Com".equals(user_identity)) {
				pstmt = con.prepareStatement(COM_LOGIN_CHECK);
			}

			pstmt.setString(1, user_account);
			pstmt.setString(2, user_pwd);
			rs = pstmt.executeQuery();
			int num = -1;
			while (rs.next()) {
				num = rs.getInt(1);
			}

			if (num == 1) {
				return true;
			} else if (num == 0) {
				return false;
			} else {
				System.out.println("有怪數字");
				return false;
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

		} // end finally
	} // end login

} // end DAO