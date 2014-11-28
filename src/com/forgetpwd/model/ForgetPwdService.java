package com.forgetpwd.model;

import com.member.model.MemDAO;
import com.member.model.MemDAO_interface;
import com.member.model.MemVO;

public class ForgetPwdService {
	private ForgetPwdDAO_interface dao;
	private MemDAO_interface memdao;
	
	public ForgetPwdService(){
		dao = new ForgetPwdJDBCDAO();
		memdao = new MemDAO();
		
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
	public MemVO findMemByQQ(String mem_qq){
		return dao.findByQQ(mem_qq);
	}
	
	public void updateMemPwd(MemVO memVO){
		memdao.update(memVO);
	}

}
