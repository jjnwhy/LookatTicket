package com.acorn.lookat.qna.controller;

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

import com.acorn.lookat.qna.dto.QnACommentDto;
import com.acorn.lookat.qna.dto.QnADto;
import com.acorn.lookat.qna.service.QnAService;

@Controller
public class QnAController {
	@Autowired
	private QnAService service;
	
	@RequestMapping("/qna/list")
	public String getList(HttpServletRequest request) {
		service.getList(request);
		return "qna/list";
	}
	
	@RequestMapping("/qna/insertform")
	public ModelAndView authInsertFrom(HttpServletRequest request) {
		return new ModelAndView("qna/insertform");
	}
	
	@RequestMapping("/qna/insert")
	public ModelAndView authInsert(QnADto dto, HttpSession session, HttpServletRequest request) {
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		service.saveContent(dto);
		return new ModelAndView("qna/insert");
	}
	@RequestMapping("/qna/commnet_insert")
	public ModelAndView authCommentInsert(HttpServletRequest request, @RequestParam int ref_group) {
		service.saveComment(request);
		return new ModelAndView("redirect:/qna/detail.do?num="+ref_group);
	}
	@RequestMapping("/qna/ajax_comment_list")
	public String ajaxCommentList(HttpServletRequest request) {
		service.moreCommentList(request);
		return "qna/ajax_comment_list";
	}
	@RequestMapping("/qna/comment_delete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(HttpServletRequest request){
		service.deleteComment(request);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	
	@RequestMapping("/qna/comment_update")
	@ResponseBody
	public Map<String, Object> authCommentUpdate(QnACommentDto dto, HttpServletRequest request){
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	@RequestMapping("/qna/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		service.deleteContent(num, request);
		return new ModelAndView("redirect:/qna/list.do");
	}
	@RequestMapping("/qna/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request) {
		service.getData(request);
		return new ModelAndView("qna/updateform");
	}
	@RequestMapping(value="/qna/update", method = RequestMethod.POST)
	public ModelAndView authUpdate(QnADto dto, HttpServletRequest request) {
		service.updateContent(dto);
		return new ModelAndView("qna/update");
	}
}
