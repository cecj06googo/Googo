package com.comFirstPage.model;

public class AccessoryVO {
/*
			acc_id          int NOT NULL IDENTITY(1,1) Primary Key ,
			acc_name        varchar(32) NOT NULL,
			com_id          int NOT NULL ,
			acc_detail      varchar(max) NOT NULL,
			acc_pic         varbinary(max)  NOT NULL,
			acc_price       decimal NOT NULL,
			*/

	private int accId;
	private String accName;
	private int comId;
	private String accDetail;
	private byte[] accPic;
	private double accPrice;
	private int accStatus;
	
	public int getAccId() {
		return accId;
	}
	public void setAccId(int accId) {
		this.accId = accId;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public int getComId() {
		return comId;
	}
	public void setComId(int comId) {
		this.comId = comId;
	}
	public String getAccDetail() {
		return accDetail;
	}
	public void setAccDetail(String accDetail) {
		this.accDetail = accDetail;
	}
	public byte[] getAccPic() {
		return accPic;
	}
	public void setAccPic(byte[] accPic) {
		this.accPic = accPic;
	}
	public double getAccPrice() {
		return accPrice;
	}
	public void setAccPrice(double accPrice) {
		this.accPrice = accPrice;
	}
	public int getAccStatus() {
		return accStatus;
	}
	public void setAccStatus(int accStatus) {
		this.accStatus = accStatus;
	}
	
}
