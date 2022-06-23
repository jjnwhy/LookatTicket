package com.acorn.lookat.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.lookat.admin.dto.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<AdminDto> getList(AdminDto dto) {
		return session.selectList("admin.getList",dto);
	}

	@Override
	public List<AdminDto> getShopList(AdminDto dto) {
		return session.selectList("admin.getShopList", dto);
	}

	@Override
	public int getCount(AdminDto dto) {
		return session.selectOne("admin.getCount", dto);
	}

}
