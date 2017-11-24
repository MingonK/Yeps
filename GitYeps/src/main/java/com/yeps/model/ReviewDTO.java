package com.yeps.model;

public class ReviewDTO {
	private int rvnum;
	private int rnum;		// �ܷ�Ű (�Ĵ� ��ȣ�� ����ص״ٰ� �ش� �Ĵ��� ����� ã�ư����ֵ���)
	private int mnum;		// � ������ �� �������� Ȯ�ΰ���
	private String writer;
	private String content;
	private String date;
	private int gradePoint;	// ����
	private String image;
	public int getRvnum() {
		return rvnum;
	}
	public void setRvnum(int rvnum) {
		this.rvnum = rvnum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
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
	public int getGradePoint() {
		return gradePoint;
	}
	public void setGradePoint(int gradePoint) {
		this.gradePoint = gradePoint;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}
