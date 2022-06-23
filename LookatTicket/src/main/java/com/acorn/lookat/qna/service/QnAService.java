package com.acorn.lookat.qna.service;

import javax.servlet.http.HttpServletRequest;

import com.acorn.lookat.qna.dto.QnACommentDto;
import com.acorn.lookat.qna.dto.QnADto;

public interface QnAService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(QnADto dto);
	public void updateContent(QnADto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void saveComment(HttpServletRequest request);
	public void deleteComment(HttpServletRequest request);
	public void updateComment(QnACommentDto dto);
	public void moreCommentList(HttpServletRequest request);
	public void getData(HttpServletRequest request);
}
