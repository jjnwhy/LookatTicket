package com.acorn.lookat.shop.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.shop.dao.BookingDao;
import com.acorn.lookat.shop.dao.ShopDao;
import com.acorn.lookat.shop.dto.BookingDto;
import com.acorn.lookat.shop.dto.ShopDto;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private BookingDao bookingDao;
	
	@Override
	public void getList(ModelAndView mView) {
		//상품 목록
		List<ShopDto> list=shopDao.getList();
		//ModelAndView  객체에 list 라는 키값으로 담는다.
		mView.addObject("list", list);
	}

	@Transactional
	@Override
	public void buy(HttpServletRequest request, ModelAndView mView) {
		
		//구입자의 아이디
		String id=(String)request.getSession().getAttribute("id");
		//1. 파라미터로 전달되는 구입할 상품 번호
		int num=Integer.parseInt(request.getParameter("num"));
		//2. 상품의 가격을 얻어온다.
		int price=shopDao.getPrice(num);
		int seatNum=shopDao.getSeatNum(num);
		String location=shopDao.getLocation(num);
		//3. 상품명
		//String name=(String)request.getParameter("name");
		//4. 콘서트 날짜
		String concertdate=(String)request.getParameter("concertdate");
		//5. 재고의 갯수를 1 줄인다.
		shopDao.minusCount(num);
		//6. 주문 테이블(배송) 에 정보를 추가 한다. 
		BookingDto dto2=new BookingDto();
		dto2.setNum(num);//상품번호
		//dto2.setName(name);
		dto2.setId(id); //누가
		dto2.setShopNum(num); //어떤 상품을 
		dto2.setPrice(price);
		dto2.setSeatNum(seatNum);
		dto2.setLocation(location);
		dto2.setConcertdate(concertdate);
		bookingDao.insert(dto2);
	}
	

	
	@Override
	public void getDetail(ModelAndView mView, int num) {
		//dao 로 해당 게시글 num 에 해당하는 데이터(dto)를 가져온다.
		ShopDto dto = shopDao.getData(num);
		//ModelAndView 에 가져온 ShopDto 를 담는다.
		mView.addObject("dto", dto);
	}


	@Override
	public void cancel(int num) {
		bookingDao.delete(num);
		
	}


	@Override
	public void saveConcert(ShopDto dto, HttpServletRequest request) {
		MultipartFile image= dto.getImageFile();
		String orgFileName=image.getOriginalFilename();
		long fileSize=image.getSize();
		String realPath=request.getServletContext().getRealPath("/upload");
		String filePath=realPath+File.separator;
		File upload=new File(filePath);

		if(!upload.exists()) {
			upload.mkdir();
		}
		String saveFileName=System.currentTimeMillis() + orgFileName;
		try {
			image.transferTo(new File(filePath + saveFileName));
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String id=(String)request.getSession().getAttribute("id");
		dto.setWriter(id);
		dto.setImage("/upload/" + saveFileName);
		shopDao.insert(dto);
		System.out.println(upload);
	}


	@Override
	public void updateConcert(ShopDto dto) {
		shopDao.update(dto);
	}


	@Override
	public void deleteConcert(int num, HttpServletRequest request) {
		shopDao.delete(num);
	}


	@Override
	public void getData(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		ShopDto dto=shopDao.getData(num);
		request.setAttribute("dto", dto);
		
	}

}










