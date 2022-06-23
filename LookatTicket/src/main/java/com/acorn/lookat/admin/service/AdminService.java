package com.acorn.lookat.admin.service;

import javax.servlet.http.HttpServletRequest;

public interface AdminService {
	public void getList(HttpServletRequest request); // 회원 목록
	public void getShopList(HttpServletRequest request); // 상품 목록
}
