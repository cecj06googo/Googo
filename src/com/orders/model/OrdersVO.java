package com.orders.model;

import java.sql.Timestamp;




public class OrdersVO implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	//Orders table欄位
	private Integer ord_id;
	private Integer com_id;
	private Integer mem_id;
	private Timestamp ord_time;
	private Timestamp ord_getday;
	private Timestamp ord_reday;
	private Timestamp ord_lastuptime;
	private Integer item_total;
	private Integer prod_id;
	private Integer acc_id;
	private Integer ord_status;

	//Ord_status table欄位
	private String status_char;
	
	//Ord_item table欄位
	private String item_name;
	private String item_tel;
	private String item_phone;
	private String item_email;
	private String pritem_acc;
	private String item_all;

	//Member table欄位
	private String mem_account;
	
	//Product table欄位
	private String prod_name;  //商品名稱
	private String prod_plate; //車牌
	private Double prod_price; //商品價格
	private Double prod_disc;  //商品折扣
	
	//Accessory(配件) table欄位  
	private Double acc_price;  //配件價格
	private String acc_detail; //配件明細(名稱?)
	
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_plate() {
		return prod_plate;
	}
	public void setProd_plate(String prod_plate) {
		this.prod_plate = prod_plate;
	}
	public Double getProd_price() {
		return prod_price;
	}
	public void setProd_price(Double prod_price) {
		this.prod_price = prod_price;
	}
	public Double getProd_disc() {
		return prod_disc;
	}
	public void setProd_disc(Double prod_disc) {
		this.prod_disc = prod_disc;
	}
	public Double getAcc_price() {
		return acc_price;
	}
	public void setAcc_price(Double acc_price) {
		this.acc_price = acc_price;
	}
	public String getAcc_detail() {
		return acc_detail;
	}
	public void setAcc_detail(String acc_detail) {
		this.acc_detail = acc_detail;
	}
	public Integer getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(Integer ord_id) {
		this.ord_id = ord_id;
	}
	public Timestamp getOrd_time() {
		return ord_time;
	}
	public void setOrd_time(Timestamp ord_time) {
		this.ord_time = ord_time;
	}
	public Integer getCom_id() {
		return com_id;
	}
	public void setCom_id(Integer com_id) {
		this.com_id = com_id;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Timestamp getOrd_getday() {
		return ord_getday;
	}
	public void setOrd_getday(Timestamp ord_getday) {
		this.ord_getday = ord_getday;
	}
	public Timestamp getOrd_reday() {
		return ord_reday;
	}
	public void setOrd_reday(Timestamp ord_reday) {
		this.ord_reday = ord_reday;
	}
	public Timestamp getOrd_lastuptime() {
		return ord_lastuptime;
	}
	public void setOrd_lastuptime(Timestamp ord_lastuptime) {
		this.ord_lastuptime = ord_lastuptime;
	}
	public Integer getItem_total() {
		return item_total;
	}
	public void setItem_total(Integer item_total) {
		this.item_total = item_total;
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
	public Integer getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(Integer ord_status) {
		this.ord_status = ord_status;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_phone() {
		return item_phone;
	}
	public void setItem_phone(String item_phone) {
		this.item_phone = item_phone;
	}
	public String getItem_tel() {
		return item_tel;
	}
	public void setItem_tel(String item_tel) {
		this.item_tel = item_tel;
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
	public String getStatus_char() {
		return status_char;
	}
	public void setStatus_char(String status_char) {
		this.status_char = status_char;
	}
	public String getMem_account() {
		return mem_account;
	}
	public void setMem_account(String mem_account) {
		this.mem_account = mem_account;
	}
}
