package com.acorn.lookat.booking.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.lookat.booking.dto.BookingDto;

@Repository
public class BookingDaoImpl implements BookingDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(BookingDto dto) {
		/* 	mapper's namespace: booking
		 * 	sql's id: insert
		 * 	paraType:
		 */
		session.insert("booking.insert",dto);
	}

	@Override
	public BookingDto getData(int num) {
		return session.selectOne("booking.getData",num);
	}

	@Override
	public void delete(int num) {
		session.delete("booking.delete",num);
	}

	@Override
	public List<BookingDto> getList(BookingDto dto) {
		return session.selectList("booking.getList",dto);
	}

}
