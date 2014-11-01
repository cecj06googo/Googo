package com.login.model;





public class LoginVO implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private String com_account;
	private String com_pwd;
	private String mem_account;
	private String mem_pwd;
	
	
	
	
	public String getCom_account() {
		return com_account;
	}
	public void setCom_account(String com_account) {
		this.com_account = com_account;
	}
	public String getCom_pwd() {
		return com_pwd;
	}
	public void setCom_pwd(String com_pwd) {
		this.com_pwd = com_pwd;
	}
	public String getMem_account() {
		return mem_account;
	}
	public void setMem_account(String mem_account) {
		this.mem_account = mem_account;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}


	
	

}
