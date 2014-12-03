package com.orders.model;

public class ProductOrderVO {
	private Integer prodId;//1
	private Integer comId;
	private String prodName;
	private Integer prodType;
	private Integer prodPrice;
	private Double prodDisc;//6
	private byte[] prodPic;
	//not null ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	private String prodArticle;//8
	private byte[] prodSubPic1;
	private byte[] prodSubPic2;
	private byte[] prodSubPic3;//11
	//specify
	private Integer prodKind;// car only 
	private Double prodCc;// 同時儲存機、汽車排氣量資料
	private Integer prodCarrier;// car only
	private Integer prodControl;// car only
	//15個欄位
	
	private String prodPlate;//16
	private Integer prodStatus;//17
	//17
	private Integer priceDiscOK;  // 折扣後的金額
	
	public Integer getPriceDiscOK() {
		return priceDiscOK;
	}
	public void setPriceDiscOK(Integer priceDiscOK) {
		this.priceDiscOK = priceDiscOK;
	}
	public Integer getProdId() {
		return prodId;
	}
	public void setProdId(Integer prodId) {
		this.prodId = prodId;
	}
	public Integer getComId() {
		return comId;
	}
	public void setComId(Integer comId) {
		this.comId = comId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public Integer getProdType() {
		return prodType;
	}
	public void setProdType(Integer prodType) {
		this.prodType = prodType;
	}
	public Integer getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(Integer prodPrice) {
		this.prodPrice = prodPrice;
	}
	public Double getProdDisc() {
		return prodDisc;
	}
	public void setProdDisc(Double prodDisc) {
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
	public Integer getProdKind() {
		return prodKind;
	}
	public void setProdKind(Integer prodKind) {
		this.prodKind = prodKind;
	}
	public Double getProdCc() {
		return prodCc;
	}
	public void setProdCc(Double prodCc) {
		this.prodCc = prodCc;
	}
	public Integer getProdCarrier() {
		return prodCarrier;
	}
	public void setProdCarrier(Integer prodCarrier) {
		this.prodCarrier = prodCarrier;
	}
	public Integer getProdControl() {
		return prodControl;
	}
	public void setProdControl(Integer prodControl) {
		this.prodControl = prodControl;
	}
	public String getProdPlate() {
		return prodPlate;
	}
	public void setProdPlate(String prodPlate) {
		this.prodPlate = prodPlate;
	}
	public Integer getProdStatus() {
		return prodStatus;
	}
	public void setProdStatus(Integer prodStatus) {
		this.prodStatus = prodStatus;
	}
	
	
}
