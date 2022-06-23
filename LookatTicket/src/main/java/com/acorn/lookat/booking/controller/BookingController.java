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
	
	@RequestMapping("booking/delete")
	public ModelAndView delete(@RequestParam int num) {
		
		service.cancle(num);
		
		return new ModelAndView("redirect:/users/bookingpage.do");
	}
	
}
