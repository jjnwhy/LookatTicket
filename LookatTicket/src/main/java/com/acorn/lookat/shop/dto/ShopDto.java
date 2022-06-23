package com.acorn.lookat.shop.dto;

public class ShopDto {
	private int num;
	private int catenum;
	private String name;
	private String image;
	private int	price;
	private String cast;
	private String hours;
	private String location;
	private String startdate;
	private String enddate;
	private int remainCount;
	private String tel;
	private int seatnum;
	
	public ShopDto() {}

	public ShopDto(int num, int catenum, String name, String image, int price, String cast, String hours,
			String location, String startdate, String enddate, int remainCount, String tel, int seatnum) {
		super();
		this.num = num;
		this.catenum = catenum;
		this.name = name;
		this.image = image;
		this.price = price;
		this.cast = cast;
		this.hours = hours;
		this.location = location;
		this.startdate = startdate;
		this.enddate = enddate;
		this.remainCount = remainCount;
		this.tel = tel;
		this.seatnum = seatnum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCatenum() {
		return catenum;
	}

	public void setCatenum(int catenum) {
		this.catenum = catenum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public int getRemainCount() {
		return remainCount;
	}

	public void setRemainCount(int remainCount) {
		this.remainCount = remainCount;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getSeatnum() {
		return seatnum;
	}

	public void setSeatnum(int seatnum) {
		this.seatnum = seatnum;
	}

	public void setId(String id) {
		// TODO Auto-generated method stub
		
	};
	
	
}