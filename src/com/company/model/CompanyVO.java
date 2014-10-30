package com.company.model;

public class CompanyVO {
	private int comID;
	private String comAccount;
	private String comPwd;
	private String comName;
	private String comOwner;
	private String comAddr;
	private String comTel;
	private String comFax;
	private String comVAT;
	private byte[] comPic;
	
	public int getComID() {
		return comID;
	}
	
	public void setComID(int comID) {
		this.comID = comID;
	}
	
	public String getComAccount() {
		return comAccount;
	}
	
	public void setComAccount(String comAccount) {
		this.comAccount = comAccount;
	}
	
	public String getComPwd() {
		return comPwd;
	}
	
	public void setComPwd(String comPwd) {
		this.comPwd = comPwd;
	}
	
	public String getComName() {
		return comName;
	}
	
	public void setComName(String string) {
		this.comName = string;
	}
	
	public String getComOwner() {
		return comOwner;
	}
	
	public void setComOwner(String comOwner) {
		this.comOwner = comOwner;
	}
	
	public String getComAddr() {
		return comAddr;
	}
	
	public void setComAddr(String comAddr) {
		this.comAddr = comAddr;
	}
	
	public String getComTel() {
		return comTel;
	}
	
	public void setComTel(String comTel) {
		this.comTel = comTel;
	}
	
	public String getComFax() {
		return comFax;
	}
	
	public void setComFax(String comFax) {
		this.comFax = comFax;
	}
	
	public String getComVAT() {
		return comVAT;
	}
	
	public void setComVAT(String comVAT) {
		this.comVAT = comVAT;
	}

	public byte[] getComPic() {
		return comPic;
	}

	public void setComPic(byte[] comPic) {
		this.comPic = comPic;
	}
}
