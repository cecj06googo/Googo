package com.forgetpwd.model;

public class ForgetPwdVO implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private Integer com_id;
	private String com_account;
	private String com_pwd;
	private String mem_account;
	private String mem_pwd;
	private Integer mem_id;
	public Integer getCom_id() {
		return com_id;
	}
	public void setCom_id(Integer com_id) {
		this.com_id = com_id;
	}
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
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
