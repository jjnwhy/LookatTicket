package com.acorn.lookat.shop.dto;

public class BookingDto {
	private int num;
	private String name;
	private int shopNum;
	private String id;
	private String dday;
	private int price;
	private int seatNum;
	private String location;
	private String concertdate;
	
	public BookingDto() {}

	public BookingDto(int num, String name, int shopNum, String id, String dday, int price, int seatNum,
			String location, String concertdate) {
		super();
		this.num = num;
		this.name = name;
		this.shopNum = shopNum;
		this.id = id;
		this.dday = dday;
		this.price = price;
		this.seatNum = seatNum;
		this.location = location;
		this.concertdate = concertdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getShopNum() {
		return shopNum;
	}

	public void setShopNum(int shopNum) {
		this.shopNum = shopNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDday() {
		return dday;
	}

	public void setDday(String dday) {
		this.dday = dday;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getConcertdate() {
		return concertdate;
	}

	public void setConcertdate(String concertdate) {
		this.concertdate = concertdate;
	}

	
	
}
