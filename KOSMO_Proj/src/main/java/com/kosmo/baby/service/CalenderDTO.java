package com.kosmo.baby.service;


public class CalenderDTO {
	private String calno;
	private String title;
	private java.util.Date startdate;
	private java.util.Date enddate;
	private String content;
	private String type;
	private String id;

	
	public String getCalNo() {
		return calno;
	}
	public void setCalNo(String calNo) {
		this.calno = calNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public java.util.Date getStartdate() {
		return startdate;
	}
	public void setStartdate(java.util.Date startdate) {
		this.startdate = startdate;
	}
	public java.util.Date getEnddate() {
		return enddate;
	}
	public void setEnddate(java.util.Date enddate) {
		this.enddate = enddate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	

}
