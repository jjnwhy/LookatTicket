package com.acorn.lookat.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.lookat.qna.dto.QnADto;

@Repository
public class QnADaoImpl implements QnADao{
	@Autowired
	private SqlSession session;

	@Override
	public List<QnADto> getList(QnADto dto) {
		return session.selectList("qna.getList", dto);
	}

	@Override
	public int getCount(QnADto dto) {
		return session.selectOne("qna.getCount", dto);
	}

	@Override
	public void insert(QnADto dto) {
		session.insert("qna.insert",dto);
	}

	@Override
	public QnADto getData(int num) {
		return session.selectOne("qna.getData",num);
	}

	@Override
	public QnADto getData(QnADto dto) {
		return session.selectOne("qna.getData2",dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("qna.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("qna.delete", num);
	}

	@Override
	public void update(QnADto dto) {
		session.update("qna.update", dto);
	}
	
}
