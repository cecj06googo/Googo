package com.forgetpwd.model;

public interface ForgetPwdDAO_interface {
	public void update(String userEmail, String userIdentity);
	public ForgetPwdVO findByUseremail(String userEmail, String userIdentity);

}
