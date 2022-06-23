package com.acorn.lookat.booking.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.shop.service.ShopService;

@Controller
public class BookingController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("/shop/list")
	public ModelAndView shoplist(ModelAndView mView) {
		service.getList(mView);
		mView.setViewName("shop/list");
		return mView;
	}
	//detail 페이지
	@RequestMapping(value = "/shop/detail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mView, @RequestParam int num) {
		//detail 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(mView, num);
		mView.setViewName("shop/detail");
		
		return mView;
	}
	//예매 하기 요청
	@RequestMapping("/shop/booking")
	public ModelAndView authBuy(HttpServletRequest request,
			ModelAndView mView) {
		service.buy(request, mView);
		mView.setViewName("redirect:/users/bookingpage.do");
		return mView;
	}
	
	@RequestMapping("/booking/delete")
	public ModelAndView delete(@RequestParam int num) {
		
		service.cancel(num);
		
		return new ModelAndView("redirect:/users/bookingpage.do");
	}
	
}
