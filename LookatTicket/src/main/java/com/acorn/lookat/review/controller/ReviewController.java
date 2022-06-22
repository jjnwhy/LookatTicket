package com.acorn.lookat.review.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.review.dto.ReviewDto;
import com.acorn.lookat.review.service.ReviewService;


@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@RequestMapping("/review/list")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		
		return "review/list";
	}
	@RequestMapping("/review/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("review/insertform");
	}
	@RequestMapping("/review/insert")
	public ModelAndView authInsert(ReviewDto dto, HttpSession session, HttpServletRequest request) {
		
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		service.saveContent(dto);
		
		return new ModelAndView("review/insert");	
	}
	@RequestMapping("/review/detail")
	public String detail(HttpServletRequest request) {
		service.getDetail(request);
		return "review/detail";
	}
	@RequestMapping("review/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		
		service.deleteContent(num, request);
		
		return new ModelAndView("redirect:/review/list.do");
	}
	@RequestMapping("/review/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request) {
		service.getData(request);
		return new ModelAndView("review/updateform");
	}
	@RequestMapping(value="/review/update", method=RequestMethod.POST)
	public ModelAndView authUpdate(ReviewDto dto, HttpServletRequest request) {
		service.updateContent(dto);
		return new ModelAndView("review/update");
	}
	@RequestMapping("/review/like")
	@ResponseBody
	public Map<String, Object> authLikeCount(@RequestParam int num, HttpServletRequest request) {
		int count=service.likeCount(num, request);
		System.out.println(num);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("likeCount", count);
		
		return map;
	}
	
}








