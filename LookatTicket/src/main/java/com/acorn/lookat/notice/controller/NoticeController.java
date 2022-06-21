package com.acorn.lookat.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.notice.dto.NoticeDto;
import com.acorn.lookat.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	@RequestMapping("/notice/list.do")
	public String getList(HttpServletRequest request) {
		service.getList(request);
		return "notice/list";
	}
	
	//글 자세히 보기 요청 처리
	@RequestMapping("/notice/detail")
	public String detail(HttpServletRequest request) {
		service.getDetail(request);
		return "notice/detail";
	}
	
//	@RequestMapping("/notice/insertform")
//	public ModelAndView authInsertForm(HttpServletRequest request) {
//		return new ModelAndView("notice/insertform");
//	}
	
	@RequestMapping("/notice/insertform")
	public ModelAndView InsertForm(HttpServletRequest request) {
		return new ModelAndView("notice/insertform");
	}
	
//	@RequestMapping("/notice/insert")
//	public ModelAndView authInsert(NoticeDto dto,HttpSession session, HttpServletRequest request) {
//		String id = (String)session.getAttribute("id");
//		dto.setWriter(id);
//		service.saveNotice(dto);
//		
//		return new ModelAndView("notice/insert");
//	}
	
	@RequestMapping("/notice/insert")
	public ModelAndView Insert(NoticeDto dto, HttpSession session, HttpServletRequest request) {
		String id = "관리자";
		dto.setWriter(id);
		service.saveNotice(dto);
		
		return new ModelAndView("notice/insert");
	}
	
//	//카페글 삭제 요청 처리 
//	@RequestMapping("/cafe/delete")
//	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
//		
//		service.deleteContent(num, request);
//		
//		return new ModelAndView("redirect:/cafe/list.do");
//	}
	
	@RequestMapping("/notice/delete")
	public ModelAndView Delete(@RequestParam int num, HttpServletRequest request) {
		service.deleteNotice(num, request);
		
		return new ModelAndView("redirect:/notice/list.do");
	}

}
