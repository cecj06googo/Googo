package com.statistics.model;

import java.sql.Timestamp;

public class DordersVO  implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	//Orders table欄位
	private Integer ord_id;
	private Integer ord_status;
	private String ord_time;
	private String ord_time_day;
	private String ord_time_time;
	private Timestamp ord_getday;
	private Integer item_total;
	private Integer countt;
	private String status_char;
	private Integer prod_type;
	private String prod_name;
	
	
	public String getOrd_time_day() {
		return ord_time_day;
	}
	public void setOrd_time_day(String ord_time_day) {
		this.ord_time_day = ord_time_day;
	}
	public String getOrd_time_time() {
		return ord_time_time;
	}
	public void setOrd_time_time(String ord_time_time) {
		this.ord_time_time = ord_time_time;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public Integer getProd_type() {
		return prod_type;
	}
	public void setProd_type(Integer prod_type) {
		this.prod_type = prod_type;
	}
	public String getStatus_char() {
		return status_char;
	}
	public void setStatus_char(String status_char) {
		this.status_char = status_char;
	}
	public Integer getCountt() {
		return countt;
	}
	public void setCountt(Integer countt) {
		this.countt = countt;
	}
	public Integer getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(Integer ord_id) {
		this.ord_id = ord_id;
	}
	public Integer getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(Integer ord_status) {
		this.ord_status = ord_status;
	}
	public String getOrd_time() {
		return ord_time;
	}
	public void setOrd_time(String ord_time) {
		this.ord_time = ord_time;
	}
	public Timestamp getOrd_getday() {
		return ord_getday;
	}
	public void setOrd_getday(Timestamp ord_getday) {
		this.ord_getday = ord_getday;
	}
	public Integer getItem_total() {
		return item_total;
	}
	public void setItem_total(Integer item_total) {
		this.item_total = item_total;
	}
	

}
