package com.yeps.model;

public class ReviewDBBean {
	
	//���߿� no1�� rnum���� no2�� mnum���� db�� dto�� Į����,gettter,setter �����������!!
	
	private int rvnum;
	private int no1;         //<<�ܷ�Ű1��(yeps_restaurant���̺� rnumĮ���� �����ϴ� rnumĮ��) 
	private int no2;         //<<�ܷ�Ű2��(yeps_member���̺� mnumĮ���� �����ϴ� mnumĮ��)
	private String writer;
	private String content;
	private String joindate;
	private int gradepoint;
	private int filenum;	//<<�ܷ�Ű3��(yeps_file���̺� filenumĮ���� �����ϴ� filenumĮ��)(�̹̻�������)
	private String ip;
	
	public int getRvnum() {
		return rvnum;
	}
	public void setRvnum(int rvnum) {
		this.rvnum = rvnum;
	}
	public int getNo1() {
		return no1;
	}
	public void setNo1(int no1) {
		this.no1 = no1;
	}
	public int getNo2() {
		return no2;
	}
	public void setNo2(int no2) {
		this.no2 = no2;
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
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public int getGradepoint() {
		return gradepoint;
	}
	public void setGradepoint(int gradepoint) {
		this.gradepoint = gradepoint;
	}
	public int getFilenum() {
		return filenum;
	}
	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
}
