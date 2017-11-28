package com.yeps.model;

public class EventDTO {

	private int evnum;			// EventDTO ���� �ѹ�
	private int rnum;			// 외래키
	private String periode1;  //기간설정 앞
	private String periode2;  //기간설정 뒤
	private String discount;
	private String place;// 레스토랑 외래키를 이용하여 장소값을 받아온다.
	private String title;
	private String content;
	private int filesize; 
	private String filename;
	private String reg_date;
	
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getPeriode1() {
		return periode1;
	}
	public void setPeriode1(String periode1) {
		this.periode1 = periode1;
	}
	public String getPeriode2() {
		return periode2;
	}
	public void setPeriode2(String periode2) {
		this.periode2 = periode2;
	}
	
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getEvnum() {
		return evnum;
	}
	public void setEvnum(int evnum) {
		this.evnum = evnum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}



}
