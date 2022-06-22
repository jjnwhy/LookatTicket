package com.acorn.lookat.shop.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface ShopService {
	//상품 목록을 ModelAndView 객체에 담아주는 메소드 
	public void getList(ModelAndView mView);
	//상품 디테일 처리
	public void getDetail(ModelAndView mView, int num);
	//상품 주문 처리를 하는 메소드
	public void buy(HttpServletRequest request,
			ModelAndView mView);
}






