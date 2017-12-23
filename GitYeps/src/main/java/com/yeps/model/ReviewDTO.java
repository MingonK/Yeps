package com.yeps.model;

public class ReviewDTO {
	
	private int rvnum;
	private int rnum;         
	private int mnum;         
	private String writer;
	private String content;
	private String joindate;
	private int gradepoint;
	private int filenum;	
	private String ip;
	private String recentreview;
	private int useful;
	private int funny;
	private int cool;
	
	
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
	public String getRecentreview() {
		return recentreview;
	}
	public void setRecentreview(String recentreview) {
		this.recentreview = recentreview;
	}
	public int getUseful() {
		return useful;
	}
	public void setUseful(int useful) {
		this.useful = useful;
	}
	public int getFunny() {
		return funny;
	}
	public void setFunny(int funny) {
		this.funny = funny;
	}
	public int getCool() {
		return cool;
	}
	public void setCool(int cool) {
		this.cool = cool;
	}
	
	
	
}
