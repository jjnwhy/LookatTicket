package com.acorn.lookat.admin.dao;

import java.util.List;

import com.acorn.lookat.admin.dto.AdminDto;
import com.acorn.lookat.notice.dto.NoticeDto;

public interface AdminDao {
	// 회원 목록
	public List<AdminDto> getList(AdminDto dto);
	// 상품 목록
	public List<AdminDto> getShopList(AdminDto dto);
	// 글의 갯수
	public int getCount(AdminDto dto);
}
