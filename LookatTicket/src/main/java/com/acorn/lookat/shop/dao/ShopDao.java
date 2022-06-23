package com.acorn.lookat.shop.dao;

import java.util.List;

import com.acorn.lookat.shop.dto.ShopDto;

public interface ShopDao {
	//상품 목록을 리턴해주는 메소드
	public List<ShopDto> getList();
	//상품 하나의 정보를 리턴해주는 메소드
	public ShopDto getData(int num);
	//상품 갯수
	public int getCount(ShopDto dto);
	//상품 재고를 감소 시키는 메소드
	public void minusCount(int num);
	//잔고 감소 시키는 메소드
	public void minusMoney(ShopDto dto);
	//상품의 가격을 리턴해주는 메소드
	public int getPrice(int num);
	//상품의 좌석을 리턴해주는 메소드
	public int getSeatNum(int num);
	//상품의 장소를 리턴해주는 메소드
	public String getLocation(int num);
	//상품 등록하기
	public void insert(ShopDto dto);
	//상품 수정하기
	public void update(ShopDto dto);
	//상품 삭제하기
	public void delete(int num);
}






