package com.yeps.model;


public class RestaurantDTO {
	private int rnum;		// primary Key
	private int cnum;
	private String rname;
	private String zipno;
	
	private String filename;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	private String roadAddrPart1;
	private String addrDetail;
	private String roadAddrPart2;
	private String raddress;
	private String hp2;
	private String hp3;
	private String foodstyle;
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String sun;

	private String reststyle;	// 좌석/테이블/야외석
	private String reserv;		// 예약가능여부
	private String delivery;	// 배달가능여부
	private String takeout;		// 테이크아웃가능여부
	private String parking;		// 주차장보유여부
	private String kidzone;		// 놀이방보유여부
	private String groupreserv;		// 단체예약가능여부
	private String noise;		//소음정도
	private String alcohol;		// 주류판매여부
	private String waiting;		// 대기석 유무
	private String wifi;		// 와이파이유무
	private String toilet;		// 화장실 남녀분리형인지
	private String tablecount;	// 테이블 총 갯수
	private String standard;
	private String busytime;	// 바쁜시간
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRoadAddrPart1() {
		return roadAddrPart1;
	}
	public void setRoadAddrPart1(String roadAddrPart1) {
		this.roadAddrPart1 = roadAddrPart1;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getRoadAddrPart2() {
		return roadAddrPart2;
	}
	public void setRoadAddrPart2(String roadAddrPart2) {
		this.roadAddrPart2 = roadAddrPart2;
	}
	public String getRaddress() {
		return raddress;
	}
	public void setRaddress(String raddress) {
		this.raddress = raddress;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getFoodstyle() {
		return foodstyle;
	}
	public void setFoodstyle(String foodstyle) {
		this.foodstyle = foodstyle;
	}
	
	public String getReststyle() {
		return reststyle;
	}
	public void setReststyle(String reststyle) {
		this.reststyle = reststyle;
	}
	public String getReserv() {
		return reserv;
	}
	public void setReserv(String reserv) {
		this.reserv = reserv;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getTakeout() {
		return takeout;
	}
	public void setTakeout(String takeout) {
		this.takeout = takeout;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getKidzone() {
		return kidzone;
	}
	public void setKidzone(String kidzone) {
		this.kidzone = kidzone;
	}
	public String getGroupreserv() {
		return groupreserv;
	}
	public void setGroupreserv(String groupreserv) {
		this.groupreserv = groupreserv;
	}
	public String getNoise() {
		return noise;
	}
	public void setNoise(String noise) {
		this.noise = noise;
	}
	public String getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(String alcohol) {
		this.alcohol = alcohol;
	}
	public String getWaiting() {
		return waiting;
	}
	public void setWaiting(String waiting) {
		this.waiting = waiting;
	}
	public String getWifi() {
		return wifi;
	}
	public void setWifi(String wifi) {
		this.wifi = wifi;
	}
	public String getToilet() {
		return toilet;
	}
	public void setToilet(String toilet) {
		this.toilet = toilet;
	}
	public String getTablecount() {
		return tablecount;
	}
	public void setTablecount(String tablecount) {
		this.tablecount = tablecount;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getBusytime() {
		return busytime;
	}
	public void setBusytime(String busytime) {
		this.busytime = busytime;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public String getTue() {
		return tue;
	}
	public void setTue(String tue) {
		this.tue = tue;
	}
	public String getWed() {
		return wed;
	}
	public void setWed(String wed) {
		this.wed = wed;
	}
	public String getThu() {
		return thu;
	}
	public void setThu(String thu) {
		this.thu = thu;
	}
	public String getFri() {
		return fri;
	}
	public void setFri(String fri) {
		this.fri = fri;
	}
	public String getSat() {
		return sat;
	}
	public void setSat(String sat) {
		this.sat = sat;
	}
	public String getSun() {
		return sun;
	}
	public void setSun(String sun) {
		this.sun = sun;
	}
	public String getZipno() {
		return zipno;
	}
	public void setZipno(String zipno) {
		this.zipno = zipno;
	}
		
}
