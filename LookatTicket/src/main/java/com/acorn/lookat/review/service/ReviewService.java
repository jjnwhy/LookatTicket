package com.acorn.lookat.review.service;

import javax.servlet.http.HttpServletRequest;

import com.acorn.lookat.review.dto.ReviewDto;

public interface ReviewService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(ReviewDto dto);
	public void updateContent(ReviewDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request);
}
