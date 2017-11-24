package com.yeps.model;

public class EventReviewDTO {
	private int ervnum;		// �̺�Ʈ���� ������ȣ
	private int evnum;		// � �̺�Ʈ�� ��������
	private int mnum;		// � ������ �� �������� Ȯ�ΰ���
	private String writer;
	private String content;
	private String date;
	
	public int getErvnum() {
		return ervnum;
	}
	public void setErvnum(int ervnum) {
		this.ervnum = ervnum;
	}
	public int getEvnum() {
		return evnum;
	}
	public void setEvnum(int evnum) {
		this.evnum = evnum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
