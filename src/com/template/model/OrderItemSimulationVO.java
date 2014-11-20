package com.template.model;

public class OrderItemSimulationVO {

	private int item_id;
	private int ord_id;
	private int prod_id;
	private int acc_id;
	private String item_name;
	private String item_tel;
	private String item_phone;
	private String item_email;
	private String pritem_acc;
	private String item_all;
	
	public OrderItemSimulationVO () {
		
	}
	
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(int ord_id) {
		this.ord_id = ord_id;
	}
	public int getProd_id() {
		return prod_id;
	}
	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}
	public int getAcc_id() {
		return acc_id;
	}
	public void setAcc_id(int acc_id) {
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
