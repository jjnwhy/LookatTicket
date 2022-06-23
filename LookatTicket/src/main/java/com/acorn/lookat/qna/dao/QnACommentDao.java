package com.acorn.lookat.qna.dao;

import java.util.List;

import com.acorn.lookat.qna.dto.QnACommentDto;

public interface QnACommentDao {
	public List<QnACommentDto> getList(QnACommentDto dto);
	public void delete(int num);
	public void insert(QnACommentDto dto);
	public int getSequence();
	public void update(QnACommentDto dto);
	public QnACommentDto getData(int num);
	public int getCount(int ref_group);
}
