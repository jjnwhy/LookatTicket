package com.acorn.lookat;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.shop.service.ShopService;

@Controller
public class HomeController {
	
	@Autowired
	private ShopService service;
	
//	@RequestMapping("/home")
//	public String home() {
//		return "home";
//	}

	@RequestMapping("/home")
	public ModelAndView home(ModelAndView mView) {		
		service.getList(mView);
		mView.setViewName("home");
		return mView;
	}
	
}
