package com.yeps.model;

public class EventDTO {
	private int evnum;
	private int cnum;				// foreign key
	private String eventname;		// 150byte
	private String start_date;		// 15byte
	private String start_time;		// 15byte
	private String end_date;		// 15byte
	private String end_time;		// 15byte
	private String store_address;	// 200byte
	private String content;			// 4000byte
	private String discount;		// 2000byte
	private String category;		// 60byte
	private String ip;				// 20byte
	private int filenum;			// foreign key
	
	public int getEvnum() {
		return evnum;
	}
	public void setEvnum(int evnum) {
		this.evnum = evnum;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getEventname() {
		return eventname;
	}
	public void setEventname(String eventname) {
		this.eventname = eventname;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getFilenum() {
		return filenum;
	}
	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}
}
