package com.acorn.lookat.notice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.notice.dto.NoticeDto;

public interface NoticeService {
	public void getList(HttpServletRequest request);
	public void getData(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveNotice(NoticeDto dto);
	public void updateNotice(NoticeDto dto);
	public void deleteNotice(int num, HttpServletRequest request);
}
