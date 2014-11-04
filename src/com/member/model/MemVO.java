package com.member.model;

import java.sql.Date;
  
public class MemVO implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer mem_id;
	private String mem_account;
	private String mem_pwd;
	private String mem_name;
	private Integer mem_gender;
	private Date mem_bdate;
	private String mem_idnumber;
	private String mem_tel;
	private String mem_phone;
	private String mem_address;
	private Integer mem_open;
	private Integer mem_status;
	
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
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
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public Integer getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(Integer mem_gender) {
		this.mem_gender = mem_gender;
	}
	public Date getMem_bdate() {
		return mem_bdate;
	}
	public void setMem_bdate(Date mem_bdate) {
		this.mem_bdate = mem_bdate;
	}
	public String getMem_idnumber() {
		return mem_idnumber;
	}
	public void setMem_idnumber(String mem_idnumber) {
		this.mem_idnumber = mem_idnumber;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public Integer getMem_open() {
		return mem_open;
	}
	public void setMem_open(Integer mem_open) {
		this.mem_open = mem_open;
	}
	public Integer getMem_status() {
		return mem_status;
	}
	public void setMem_status(Integer mem_status) {
		this.mem_status = mem_status;
	}
	
	
	
}