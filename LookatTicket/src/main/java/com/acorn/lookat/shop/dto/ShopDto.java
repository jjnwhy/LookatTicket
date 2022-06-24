package com.acorn.lookat.shop.dto;

import org.springframework.web.multipart.MultipartFile;

public class ShopDto {
	private int num;//상품번호
	private String writer;//작성자
	private int cateNum;//카테고리 번호
	private String name;//상품명
	private String image;//상품 이미지
	private int	price;//가격
	private String cast;//출연
	private String hours;//관람시간
	private String location;//공연장소
	private String startdate;//첫 공연일
	private String enddate;//마지막 공연일
	private int remainCount;//재고 갯수
	private String tel;//문의 번호
	private int seatNum;//좌석번호
	private MultipartFile imageFile;
	
	public ShopDto() {}

	public ShopDto(int num, String writer, int cateNum, String name, String image, int price, String cast, String hours,
			String location, String startdate, String enddate, int remainCount, String tel, int seatNum,
			MultipartFile imageFile) {
		super();
		this.num = num;
		this.writer = writer;
		this.cateNum = cateNum;
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
		this.seatNum = seatNum;
		this.imageFile = imageFile;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
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

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	
}
