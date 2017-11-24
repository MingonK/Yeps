package com.yeps.model;

public class MessageDTO {
	private int msgnum;
	private String title;
	private String receiver;
	private String content;
	private String date;
	public int getMsgnum() {
		return msgnum;
	}
	public void setMsgnum(int msgnum) {
		this.msgnum = msgnum;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
