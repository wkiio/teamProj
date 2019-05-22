package com.kosmo.baby.service;

import java.sql.Date;

public class GuestBookDTO {

	private String gNo;
	private String gComment;
	private String gPostdate;
	private String id;
	private String refer;
	private String step;
	private String depth;
	/*private String name;*/
	private String image;
	
	// 프로필 이미지
	private String photo;
	
	
	
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	//게터 세터
	public String getgNo() {
		return gNo;
	}
	public String getRefer() {
		return refer;
	}
	public void setRefer(String refer) {
		this.refer = refer;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public void setgNo(String gNo) {
		this.gNo = gNo;
	}
	public String getgComment() {
		return gComment;
	}
	public void setgComment(String gComment) {
		this.gComment = gComment;
	}
	public String getgPostdate() {
		return gPostdate;
	}
	public void setgPostdate(String gPostdate) {
		this.gPostdate = gPostdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	/*
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	*/
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	

	
	
	
	
}
