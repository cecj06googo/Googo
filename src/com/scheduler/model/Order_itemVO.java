package com.scheduler.model;

public class Order_itemVO implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer item_id;
	private Integer ord_id;
	private Integer prod_id;
	private Integer acc_id;
	private String item_name;
	private String item_tel;
	private String item_phone;
	private String item_email;
	private String pritem_acc;
	private String item_all;
	
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}
	public Integer getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(Integer ord_id) {
		this.ord_id = ord_id;
	}
	public Integer getProd_id() {
		return prod_id;
	}
	public void setProd_id(Integer prod_id) {
		this.prod_id = prod_id;
	}
	public Integer getAcc_id() {
		return acc_id;
	}
	public void setAcc_id(Integer acc_id) {
		this.acc_id = acc_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_tel() {
		return item_tel;
	}
	public void setItem_tel(String item_tel) {
		this.item_tel = item_tel;
	}
	public String getItem_phone() {
		return item_phone;
	}
	public void setItem_phone(String item_phone) {
		this.item_phone = item_phone;
	}
	public String getItem_email() {
		return item_email;
	}
	public void setItem_email(String item_email) {
		this.item_email = item_email;
	}
	public String getPritem_acc() {
		return pritem_acc;
	}
	public void setPritem_acc(String pritem_acc) {
		this.pritem_acc = pritem_acc;
	}
	public String getItem_all() {
		return item_all;
	}
	public void setItem_all(String item_all) {
		this.item_all = item_all;
	}
	
	
	
}
