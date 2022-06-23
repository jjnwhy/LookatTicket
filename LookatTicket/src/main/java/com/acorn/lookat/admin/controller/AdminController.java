package com.acorn.lookat.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.admin.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin/list.do")
	public String getList(HttpServletRequest request) {
		service.getList(request);
		service.getShopList(request);
		return "admin/list";
	}
	
	@RequestMapping("/admin/userslist")
	public String getUserlist(HttpServletRequest request) {
		service.getList(request);
		return "admin/userslist";
	}
	
	@RequestMapping("admin/shoplist")
	public String getShoplist(HttpServletRequest request) {
		service.getShopList(request);
		return "admin/shoplist";
	}
	
}
