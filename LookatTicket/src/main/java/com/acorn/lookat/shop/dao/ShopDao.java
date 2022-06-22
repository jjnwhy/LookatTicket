package com.acorn.lookat.shop.dao;

import java.util.List;

import com.acorn.lookat.shop.dto.ShopDto;

public interface ShopDao {
	//상품 목록을 리턴해주는 메소드
	public List<ShopDto> getList();
	//상품 하나의 정보를 리턴해주는 메소드
	public ShopDto getData(int num); 
	//상품 재고를 감소 시키는 메소드
	public void minusCount(int num);
	//상품의 가격을 리턴해주는 메소드
	public int getPrice(int num);
}






