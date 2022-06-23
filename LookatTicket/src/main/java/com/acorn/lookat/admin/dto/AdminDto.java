package com.acorn.lookat.admin.dto;

public class AdminDto {
	private String id; // 회원 id
	private String name; // 회원 이름
	private int addrNum; // 회원 우편번호
	private String addr; // 회원 주소
	private String birth; // 회원 생일
	private String phone; // 회원 전화번호
	private String email; // 회원 email
	private String regdate; // 회원 가입일
	
	private int catenum; // 카테고리 번호
	private String shopName; // 상품명
	private int price; // 상품 가격
	private String cast; // 출연진
	private String hours; 
	private String location; // 공연 위치
	private String startdate; // 시작일
	private String enddate; // 종료일
	private String tel; // 문의 전화번호
	private int remainCount; // 티켓 수량
	
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum;
	
	public AdminDto() {}
	
	
	public AdminDto(String id, String name, int addrNum, String addr, String birth, String phone, String email,
			String regdate, int catenum, String shopName, int price, String cast, String hours, String location,
			String startdate, String enddate, String tel, int remainCount, int startRowNum, int endRowNum, int prevNum,
			int nextNum) {
		super();
		this.id = id;
		this.name = name;
		this.addrNum = addrNum;
		this.addr = addr;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.regdate = regdate;
		this.catenum = catenum;
		this.shopName = shopName;
		this.price = price;
		this.cast = cast;
		this.hours = hours;
		this.location = location;
		this.startdate = startdate;
		this.enddate = enddate;
		this.tel = tel;
		this.remainCount = remainCount;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}


	public int getStartRowNum() {
		return startRowNum;
	}

	
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}


	public int getEndRowNum() {
		return endRowNum;
	}

	
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}


	public int getPrevNum() {
		return prevNum;
	}

	
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	

	public int getNextNum() {
		return nextNum;
	}


	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAddrNum() {
		return addrNum;
	}
	public void setAddrNum(int addrNum) {
		this.addrNum = addrNum;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	public int getCatenum() {
		return catenum;
	}



	public void setCatenum(int catenum) {
		this.catenum = catenum;
	}



	public String getShopName() {
		return shopName;
	}



	public void setShopName(String shopName) {
		this.shopName = shopName;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getCast() {
		return cast;
	}



	public void setCast(String cast) {
		this.cast = cast;
	}



	public String getHours() {
		return hours;
	}



	public void setHours(String hours) {
		this.hours = hours;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getStartdate() {
		return startdate;
	}



	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}



	public String getEnddate() {
		return enddate;
	}



	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public int getRemainCount() {
		return remainCount;
	}



	public void setRemainCount(int remainCount) {
		this.remainCount = remainCount;
	}
	
	
	
	

}
