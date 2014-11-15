package com.products.model;

public class ProductVO {
	private int prodId;//1
	private int comId;
	private String prodName;
	private int prodType;
	private double prodPrice;
	private double prodDisc;//6
	private byte[] prodPic;
	//not null ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	private String prodArticle;//8
	private byte[] prodSubPic1;
	private byte[] prodSubPic2;
	private byte[] prodSubPic3;//11
	//specify
	private int prodKind;// car only 
	private double prodCc;// 同時儲存機、汽車排氣量資料
	private int prodCarrier;// car only
	private int prodControl;// car only
	//15個欄位
	
	private String prodPlate;//16
	private int prodStatus;//17
	//17
	
	
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public int getComId() {
		return comId;
	}
	public void setComId(int comId) {
		this.comId = comId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdType() {
		return prodType;
	}
	public void setProdType(int prodType) {
		this.prodType = prodType;
	}
	public double getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(double prodPrice) {
		this.prodPrice = prodPrice;
	}
	public double getProdDisc() {
		return prodDisc;
	}
	public void setProdDisc(double prodDisc) {
		this.prodDisc = prodDisc;
	}
	public byte[] getProdPic() {
		return prodPic;
	}
	public void setProdPic(byte[] prodPic) {
		this.prodPic = prodPic;
	}
	public String getProdArticle() {
		return prodArticle;
	}
	public void setProdArticle(String prodArticle) {
		this.prodArticle = prodArticle;
	}
	public byte[] getProdSubPic1() {
		return prodSubPic1;
	}
	public void setProdSubPic1(byte[] prodSubPic1) {
		this.prodSubPic1 = prodSubPic1;
	}
	public byte[] getProdSubPic2() {
		return prodSubPic2;
	}
	public void setProdSubPic2(byte[] prodSubPic2) {
		this.prodSubPic2 = prodSubPic2;
	}
	public byte[] getProdSubPic3() {
		return prodSubPic3;
	}
	public void setProdSubPic3(byte[] prodSubPic3) {
		this.prodSubPic3 = prodSubPic3;
	}
	public int getProdKind() {
		return prodKind;
	}
	public void setProdKind(int prodKind) {
		this.prodKind = prodKind;
	}
	public double getProdCc() {
		return prodCc;
	}
	public void setProdCc(double prodCc) {
		this.prodCc = prodCc;
	}
	public int getProdCarrier() {
		return prodCarrier;
	}
	public void setProdCarrier(int prodCarrier) {
		this.prodCarrier = prodCarrier;
	}
	public int getProdControl() {
		return prodControl;
	}
	public void setProdControl(int prodControl) {
		this.prodControl = prodControl;
	}
	public String getProdPlate() {
		return prodPlate;
	}
	public void setProdPlate(String prodPlate) {
		this.prodPlate = prodPlate;
	}
	public int getProdStatus() {
		return prodStatus;
	}
	public void setProdStatus(int prodStatus) {
		this.prodStatus = prodStatus;
	}
	
	
}
