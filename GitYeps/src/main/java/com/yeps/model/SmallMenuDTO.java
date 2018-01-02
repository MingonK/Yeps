package com.yeps.model;

import java.util.List;

public class SmallMenuDTO {
	
	private List<SmallMenuDTO> smallMenuList;
	private int small_menuNum;
	private int rnum;
	private int large_num;
	private String small_name;
	private String small_content;
	private int small_price;
	
	public List<SmallMenuDTO> getSmallMenuList() {
		return smallMenuList;
	}
	public void setSmallMenuList(List<SmallMenuDTO> smallMenuList) {
		this.smallMenuList = smallMenuList;
	}
	public int getSmall_menuNum() {
		return small_menuNum;
	}
	public void setSmall_menuNum(int small_menuNum) {
		this.small_menuNum = small_menuNum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getLarge_num() {
		return large_num;
	}
	public void setLarge_num(int large_num) {
		this.large_num = large_num;
	}
	public String getSmall_name() {
		return small_name;
	}
	public void setSmall_name(String small_name) {
		this.small_name = small_name;
	}
	public String getSmall_content() {
		return small_content;
	}
	public void setSmall_content(String small_content) {
		this.small_content = small_content;
	}
	public int getSmall_price() {
		return small_price;
	}
	public void setSmall_price(int small_price) {
		this.small_price = small_price;
	}
	
}
