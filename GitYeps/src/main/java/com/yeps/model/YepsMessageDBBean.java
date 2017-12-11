package com.yeps.model;

public class YepsMessageDBBean {

	private int msgNum;
	private int mNum;
	private String title;
	private String receiver;
	private String sender;
	private String content;
	private String reg_date;
	private String readDate;

	public int getMsgnum() {
		return msgNum;
	}
	public void setMsgnum(int msgnum) {
		this.msgNum = msgnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getreceiver() {
		return receiver;
	}
	public void setreceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


}
