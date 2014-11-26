package com.forgetpwd.model;

public class ForgetPwdService {
	private ForgetPwdDAO_interface dao;
	
	public ForgetPwdService(){
		dao = new ForgetPwdJDBCDAO();
	}
	public ForgetPwdVO getOneUser(String user_account, String user_identity){
		return dao.findByUserAccount(user_account, user_identity);
	}
	
	public void updateUser(String user_identity,String user_account,String user_newPwd){
		dao.update(user_identity,user_account, user_newPwd);
	}
	
	public Integer findId(String user_account, String user_identity){
		return dao.findUserId(user_account, user_identity);
	}

}
