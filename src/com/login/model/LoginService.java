package com.login.model;




public class LoginService {
	private LoginDAO_interface dao;

	public LoginService() {
		dao = new LoginJDBCDAO();
	}

	public LoginVO loginCheck(String user_account, String user_pwd,
			String user_identity) {
		return dao.login(user_account ,user_pwd,user_identity);
	} // end 

}
