package com.kosmo.baby.service;

public class Carpool_borderDTO {
	private String cp_no;
	private String startpoint;
	private String endpoint;
	private String type;
	private String content;
	private String start_xpos;
	private String start_ypos;
	private String end_xpos;
	private String end_ypos;
	private String time;
	private String price;
	private String carseat;
	private String id;
	private String name;
	private String status;
	private String reservationid;
	private String finish;
	private String score;
	// 블록체인시작
	private String opened;
	private String signed;
	private String done;
	private String reviewed;
	// 블록체인끝
	private String photo;
	private String cartype;
	
	//reservation 타이틀
	private String title;
	

	//편의를 위한 추가
	private String partnerstatus;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getPartnerstatus() {
		return partnerstatus;
	}
	public void setPartnerstatus(String partnerstatus) {
		this.partnerstatus = partnerstatus;
	}
	public String getCartype() {
		return cartype;
	}
	public void setCartype(String cartype) {
		this.cartype = cartype;
	}
	public String getCarseat() {
		return carseat;
	}
	public void setCarseat(String carseat) {
		this.carseat = carseat;
	}
	public String getCp_no() {
		return cp_no;
	}
	public void setCp_no(String cp_no) {
		this.cp_no = cp_no;
	}
	public String getStartpoint() {
		return startpoint;
	}
	public void setStartpoint(String startpoint) {
		this.startpoint = startpoint;
	}
	public String getEndpoint() {
		return endpoint;
	}
	public void setEndpoint(String endpoint) {
		this.endpoint = endpoint;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStart_xpos() {
		return start_xpos;
	}
	public void setStart_xpos(String start_xpos) {
		this.start_xpos = start_xpos;
	}
	public String getStart_ypos() {
		return start_ypos;
	}
	public void setStart_ypos(String start_ypos) {
		this.start_ypos = start_ypos;
	}
	public String getEnd_xpos() {
		return end_xpos;
	}
	public void setEnd_xpos(String end_xpos) {
		this.end_xpos = end_xpos;
	}
	public String getEnd_ypos() {
		return end_ypos;
	}
	public void setEnd_ypos(String end_ypos) {
		this.end_ypos = end_ypos;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReservationid() {
		return reservationid;
	}
	public void setReservationid(String reservationid) {
		this.reservationid = reservationid;
	}
	public String getFinish() {
		return finish;
	}
	public void setFinish(String finish) {
		this.finish = finish;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getOpened() {
		return opened;
	}
	public void setOpened(String opened) {
		this.opened = opened;
	}
	public String getSigned() {
		return signed;
	}
	public void setSigned(String signed) {
		this.signed = signed;
	}
	public String getDone() {
		return done;
	}
	public void setDone(String done) {
		this.done = done;
	}
	public String getReviewed() {
		return reviewed;
	}
	public void setReviewed(String reviewed) {
		this.reviewed = reviewed;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	

}
