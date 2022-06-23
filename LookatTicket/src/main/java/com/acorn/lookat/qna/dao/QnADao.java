package com.acorn.lookat.qna.dao;

import java.util.List;

import com.acorn.lookat.qna.dto.QnADto;

public interface QnADao {
	public List<QnADto> getList(QnADto dto);
	public int getCount(QnADto dto);
	public void insert(QnADto dto);
	public QnADto getData(int num);
	public QnADto getData(QnADto dto);
	public void addViewCount(int num);
	public void delete(int num);
	public void update(QnADto dto);
}
