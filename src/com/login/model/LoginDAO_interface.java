package com.login.model;


public interface LoginDAO_interface {
          public LoginVO login(String user_account, String user_pwd,
      			String user_identity);
          public Integer loginId(String userAccount, String userPwd, String userIdentity);

}
