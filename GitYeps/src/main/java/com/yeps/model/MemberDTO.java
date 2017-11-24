package com.yeps.model;

public class MemberDTO {
	private int mnum;
	private String name;
	private String email;
	private String passwd;
	private String birth;
	private int reviewCount;
	private int imageCount;
	private String isManager;
	private String controlCate;
	private String controlEvent;
	private String controlMember;
	private String controlRestaurant;
	private String controlReview;
	
	
	public int getMnum() {
		return mnum;
	}
	public String getIsManager() {
		return isManager;
	}
	public void setIsManager(String isManager) {
		this.isManager = isManager;
	}
	public String getControlCate() {
		return controlCate;
	}
	public String getControlEvent() {
		return controlEvent;
	}
	public String getControlMember() {
		return controlMember;
	}
	public String getControlRestaurant() {
		return controlRestaurant;
	}
	public String getControlReview() {
		return controlReview;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getImageCount() {
		return imageCount;
	}
	public void setImageCount(int imageCount) {
		this.imageCount = imageCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String isManager() {
		return isManager;
	}
	public void setManager(String isManager) {
		this.isManager = isManager;
	}
	public String isControlCate() {
		return controlCate;
	}
	public void setControlCate(String controlCate) {
		this.controlCate = controlCate;
	}
	public String isControlEvent() {
		return controlEvent;
	}
	public void setControlEvent(String controlEvent) {
		this.controlEvent = controlEvent;
	}
	public String isControlMember() {
		return controlMember;
	}
	public void setControlMember(String controlMember) {
		this.controlMember = controlMember;
	}
	public String isControlRestaurant() {
		return controlRestaurant;
	}
	public void setControlRestaurant(String controlRestaurant) {
		this.controlRestaurant = controlRestaurant;
	}
	public String isControlReview() {
		return controlReview;
	}
	public void setControlReview(String controlReview) {
		this.controlReview = controlReview;
	}
	
	
}
