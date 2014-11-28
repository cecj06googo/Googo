package com.forgetpwd.model;

import com.member.model.MemVO;

public interface ForgetPwdDAO_interface {
	public void update(String user_identity,String user_account,String user_newPwd);
	public ForgetPwdVO findByUserAccount(String user_account, String user_identity);
	public Integer findUserId(String user_account, String user_identity);
	public MemVO findByQQ(String mem_qq);
}
