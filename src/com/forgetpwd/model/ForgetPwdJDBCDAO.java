package com.forgetpwd.model;

public class ForgetPwdJDBCDAO implements ForgetPwdDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";
	
	private static final String MEM_PWD_UPDATE = 
			"UPDATE dbo.Member set mem_pwd=? where mem_account=? ";
	private static final String COM_PWD_UPDATE = 
			"UPDATE dbo.Company set com_pwd=? where com_account=? ";

	@Override
	public void update(ForgetPwdVO forgetPwdVO) {
		// TODO Auto-generated method stub

	}

}
