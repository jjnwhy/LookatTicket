package com.acorn.lookat.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.lookat.qna.dto.QnACommentDto;

@Repository
public class QnACommentDaoImpl implements QnACommentDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnACommentDto> getList(QnACommentDto dto) {
		return session.selectList("qnaComment.getList",dto);
	}

	@Override
	public void delete(int num) {
		session.update("qnaComment.delete",num);
	}

	@Override
	public void insert(QnACommentDto dto) {
		session.insert("qnaComment.insert",dto);
	}

	@Override
	public int getSequence() {
		return session.selectOne("qnaComment.getSequence");
	}

	@Override
	public void update(QnACommentDto dto) {
		session.update("qnaComment.update",dto);
	}

	@Override
	public QnACommentDto getData(int num) {
		return session.selectOne("qnaComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		return session.selectOne("qnaComment.getCount", ref_group);
	}

}
