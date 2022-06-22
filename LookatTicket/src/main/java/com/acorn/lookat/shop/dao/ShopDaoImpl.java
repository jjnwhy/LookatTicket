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
		// TODO Auto-generated method stub
		return session.selectOne("shop.getPrice", num);
	}
	@Override
	public ShopDto getData(int num) {
		return session.selectOne("shop.getData", num);
	}

}



