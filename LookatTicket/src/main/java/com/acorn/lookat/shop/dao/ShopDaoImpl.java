package com.acorn.lookat.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.lookat.shop.dto.ShopDto;

@Repository
public class ShopDaoImpl implements ShopDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ShopDto> getList() {
		
		return session.selectList("shop.getList");
	}
	//재고의 갯수를 1 줄이기 
	@Override
	public void minusCount(int num) {
		session.update("shop.minusCount", num);
	}
	//상품 번호에 해당하는 상품의 가격을 리턴하는 메소드 
	@Override
	public int getPrice(int num) {
		return session.selectOne("shop.getPrice", num);
	}
	@Override
	public ShopDto getData(int num) {
		return session.selectOne("shop.getData", num);
	}

	public String getLocation(int num) {
		return session.selectOne("shop.getLocation",num);
	}
	public int getSeatNum(int num) {
		return session.selectOne("shop.getSeatNum",num);
	}
	@Override
	public void minusMoney(ShopDto dto) {
		session.update("shop.minusMoney", dto);
		
	}
	@Override
	public void insert(ShopDto dto) {
		session.insert("shop.insert", dto);
	}
	@Override
	public int getCount(ShopDto dto) {
		return session.selectOne("shop.getCount", dto);
	}
	@Override
	public void update(ShopDto dto) {
		session.update("shop.update", dto);
		
	}
	@Override
	public void delete(int num) {
		session.delete("shop.delete", num);
		
	}
	@Override
	public void plusCount(int num) {
		session.update("shop.plusCount",num);
		
	}


}



