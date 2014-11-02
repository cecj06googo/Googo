package com.template.model;

public class Prototype_OrderTemp_VO {
	
	private int id;
	private int com_id;
	private String content;
	
	public void setId(int id){
		this.id = id;
	}
	
	public int getId(){
		return id;
	}
	
	public void setCom_id(int com_id){
		this.com_id = com_id;
	}
	
	public int getCom_id(){
		return com_id;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public String getContent(){
		return content;
	}
}
