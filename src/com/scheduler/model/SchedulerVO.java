package com.scheduler.model;

import java.sql.Timestamp;

public class SchedulerVO implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private String prod_name;
	private String prod_plate;
	private Integer prod_type;
	private Integer ord_id;
	private Timestamp ord_getday;
	private Timestamp ord_reday;
	private String item_name;
	private String item_phone;
	
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
	public Integer getProd_type() {
		return prod_type;
	}
	public void setProd_type(Integer prod_type) {
		this.prod_type = prod_type;
	}
	public Integer getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(Integer ord_id) {
		this.ord_id = ord_id;
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
	
}
