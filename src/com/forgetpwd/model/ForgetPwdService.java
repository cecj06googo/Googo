package com.forgetpwd.model;

public class ForgetPwdService {
	private ForgetPwdDAO_interface dao;
	
	public ForgetPwdService(){
		dao = new ForgetPwdJDBCDAO();
	}
	public ForgetPwdVO getOneUser(String user_account, String user_identity){
		return dao.findByUserAccount(user_account, user_identity);
	}
	
	public void updateUser(String user_newPwd,String user_account, String user_identity){
		dao.update(user_newPwd, user_account, user_identity);
	}

}
