package com.acorn.lookat.booking.dao;

import java.util.List;

import com.acorn.lookat.booking.dto.BookingDto;



public interface BookingDao {
	//예약 정보를 추가하는 메소드
	public void insert(BookingDto dto);
	//예약 정보를 가져오는 메소드
	public BookingDto getData(String id);
	//예약 정보를 삭제하는 메소드
	public void delete(int num);
	//예약 목록을 가져오는 메소드
	public List<BookingDto> getList(BookingDto dto);
}
