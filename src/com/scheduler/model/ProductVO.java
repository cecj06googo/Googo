package com.scheduler.model;

import java.math.BigDecimal;


public class ProductVO implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private Integer prod_id;
	private Integer com_id;
	private String prod_name;
	private Integer prod_type;
	private BigDecimal prod_price;
	private BigDecimal prod_disc;
	private String prod_article;
	private byte[] prod_subPic1;
	private byte[] prod_subPic2;
	private byte[] prod_subPic3;
	private Integer prod_kind;
	private Integer prod_cc;
	private Integer prod_carrier;
	private Integer prod_control;
	private String prod_plate;
	private Integer prod_status;
	
	public Integer getProd_id() {
		return prod_id;
	}
	public void setProd_id(Integer prod_id) {
		this.prod_id = prod_id;
	}
	public Integer getCom_id() {
		return com_id;
	}
	public void setCom_id(Integer com_id) {
		this.com_id = com_id;
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
	public BigDecimal getProd_price() {
		return prod_price;
	}
	public void setProd_price(BigDecimal prod_price) {
		this.prod_price = prod_price;
	}
	public BigDecimal getProd_disc() {
		return prod_disc;
	}
	public void setProd_disc(BigDecimal prod_disc) {
		this.prod_disc = prod_disc;
	}
	public String getProd_article() {
		return prod_article;
	}
	public void setProd_article(String prod_article) {
		this.prod_article = prod_article;
	}
	public byte[] getProd_subPic1() {
		return prod_subPic1;
	}
	public void setProd_subPic1(byte[] prod_subPic1) {
		this.prod_subPic1 = prod_subPic1;
	}
	public byte[] getProd_subPic2() {
		return prod_subPic2;
	}
	public void setProd_subPic2(byte[] prod_subPic2) {
		this.prod_subPic2 = prod_subPic2;
	}
	public byte[] getProd_subPic3() {
		return prod_subPic3;
	}
	public void setProd_subPic3(byte[] prod_subPic3) {
		this.prod_subPic3 = prod_subPic3;
	}
	public Integer getProd_kind() {
		return prod_kind;
	}
	public void setProd_kind(Integer prod_kind) {
		this.prod_kind = prod_kind;
	}
	public Integer getProd_cc() {
		return prod_cc;
	}
	public void setProd_cc(Integer prod_cc) {
		this.prod_cc = prod_cc;
	}
	public Integer getProd_carrier() {
		return prod_carrier;
	}
	public void setProd_carrier(Integer prod_carrier) {
		this.prod_carrier = prod_carrier;
	}
	public Integer getProd_control() {
		return prod_control;
	}
	public void setProd_control(Integer prod_control) {
		this.prod_control = prod_control;
	}
	public String getProd_plate() {
		return prod_plate;
	}
	public void setProd_plate(String prod_plate) {
		this.prod_plate = prod_plate;
	}
	public Integer getProd_status() {
		return prod_status;
	}
	public void setProd_status(Integer prod_status) {
		this.prod_status = prod_status;
	}
	
	
}
