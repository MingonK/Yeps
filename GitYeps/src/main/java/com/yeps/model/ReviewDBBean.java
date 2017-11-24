package com.yeps.model;

public class ReviewDBBean {
	
	//나중에 no1는 rnum으로 no2는 mnum으로 db랑 dto에 칼럼명,gettter,setter 변경해줘야함!!
	
	private int rvnum;
	private int no1;         //<<외래키1번(yeps_restaurant테이블에 rnum칼럼을 참조하는 rnum칼럼) 
	private int no2;         //<<외래키2번(yeps_member테이블에 mnum칼럼을 참조하는 mnum칼럼)
	private String writer;
	private String content;
	private String joindate;
	private int gradepoint;
	private int filenum;	//<<외래키3번(yeps_file테이블에 filenum칼럼을 참조하는 filenum칼럼)(이미생성했음)
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
