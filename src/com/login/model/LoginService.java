package com.login.model;

import com.util.HashService;;




public class LoginService {
	private LoginDAO_interface dao;

	public LoginService() {
		dao = new LoginJDBCDAO();
	}

	public LoginVO loginCheck(String user_account, String user_pwd,
			String user_identity) {
		return dao.login(user_account ,user_pwd,user_identity);
	} // end 

	public Integer loginCheckId(String userAccount, String userPwd, String userIdentity) {
		String encrypedString = HashService.encryptString(userPwd);
		userPwd = HashService.getMD5Endocing(encrypedString);
		return dao.loginId(userAccount, userPwd, userIdentity);
	}
}
