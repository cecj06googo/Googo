package com.forgetpwd.model;

import com.company.model.CompanyVO;
import com.member.model.MemVO;

public interface ForgetPwdDAO_interface {
	public void update(String user_identity,String user_account,String user_newPwd);
	public ForgetPwdVO findByUserAccount(String user_account, String user_identity);
	public Integer findUserId(String user_account, String user_identity);
	public MemVO findByQQ(String mem_qq);
	public CompanyVO findByHash(String com_hashURL);
	public void updateCom(CompanyVO comVO);
}
