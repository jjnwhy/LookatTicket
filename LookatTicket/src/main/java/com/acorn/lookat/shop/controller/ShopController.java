package com.acorn.lookat.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.shop.dto.ShopDto;
import com.acorn.lookat.shop.service.ShopService;

@Controller
public class ShopController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("/shop/list")
	public ModelAndView list(ModelAndView mView) {
		service.getList(mView);
		mView.setViewName("shop/list");
		return mView;
	}
	@RequestMapping("/shop/booking")
	public ModelAndView authBuy(HttpServletRequest request, ModelAndView mView) {
		service.buy(request, mView);
		mView.setViewName("redirect:/users/bookingpage.do");
		return mView;
	}
	@RequestMapping("/shop/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		return new ModelAndView("shop/insertform");
	}
	
	@RequestMapping("/shop/insert")
	public ModelAndView authInsert(ShopDto dto, HttpSession session, HttpServletRequest request) {
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		service.saveConcert(dto);
		return new ModelAndView("shop/insert");
	}
	@RequestMapping("/shop/detail")
	public ModelAndView detail(HttpServletRequest request, ModelAndView mView, int num) {
		service.getDetail(mView, num);
		return new ModelAndView("shop/detail");
	}
	@RequestMapping("shop/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		service.deleteConcert(num, request);
		return new ModelAndView("redirect:/shop/list.do");
	}
	@RequestMapping("/shop/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request) {
		service.getData(request);
		return new ModelAndView("shop/updateform");
	}
	@RequestMapping(value="/shop/update", method=RequestMethod.POST)
	public ModelAndView authUpdate(ShopDto dto, HttpServletRequest request) {
		service.updateConcert(dto);
		return new ModelAndView("shop/update");
	}
	@RequestMapping("booking/delete")
	public ModelAndView delete(@RequestParam int num) {
		
		service.cancle(num);
		
		return new ModelAndView("redirect:/users/bookingpage.do");
	}
}















