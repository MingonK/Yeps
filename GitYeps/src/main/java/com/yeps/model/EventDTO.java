package com.yeps.model;

public class EventDTO {
<<<<<<< HEAD

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



=======
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
>>>>>>> branch 'master' of https://github.com/MingonK/Yeps.git
}
