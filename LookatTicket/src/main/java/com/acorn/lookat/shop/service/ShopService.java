package com.acorn.lookat.shop.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.shop.dto.ShopDto;


public interface ShopService {
	//상품 목록을 ModelAndView 객체에 담아주는 메소드 
	public void getList(ModelAndView mView);
	//상품 디테일 처리
	public void getDetail(ModelAndView mView, int num);
	//상품 주문 처리를 하는 메소드
	public void buy(HttpServletRequest request,
			ModelAndView mView);
	//예매 취소하기
	public void cancel(int num);
	//상품 저장
	public void saveConcert(ShopDto dto);
	//상품 수정
	public void updateConcert(ShopDto dto);
	//상품 삭제
	public void deleteConcert(int num, HttpServletRequest request);
	//상품 정보
	public void getData(HttpServletRequest request);
	
}






