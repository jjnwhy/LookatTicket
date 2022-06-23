package com.acorn.lookat.review.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.lookat.review.dao.ReviewDao;
import com.acorn.lookat.review.dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=7;
		//보여줄 페이지의 번호의 초기값 (1)
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어온다면
		if(strPageNum != null) {
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//검색
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//만일 키워드가 넘어오지 않는다면
		if(keyword==null) {
			keyword="";
			condition="";
		}
		//특수기호 인코딩
		String encodedK=URLEncoder.encode(keyword);
		//ReviewDto 객체에 startRowNum 과 endRowNum 을 담는다.
		ReviewDto dto=new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//만일 검색키워드가 넘어온다면
		if(!keyword.equals("")) {
			//검색 조건이 무엇이냐에 따라 분기
			if(condition.equals("title_content")) {
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {
				dto.setWriter(keyword);
			}
		}
		//후기 목록 얻어오기
		List<ReviewDto> list=reviewDao.getList(dto);
		//전체글의 갯수
		int totalRow=reviewDao.getCount(dto);
		
		
		//하단 시작 페이지 번호
		int startPageNum = 1 +((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(endPageNum > totalPageCount) {
			endPageNum=totalPageCount;
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
		request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		//조회수 올리기
		reviewDao.addViewCount(num);
		//검색
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		if(keyword==null) {
			keyword="";
			condition="";
		}
		//reviewDto 객체를 생성해서
		ReviewDto dto=new ReviewDto();
		//자세히 보여줄 글 번호를 넣어주고.
		dto.setNum(num);
		//만일 검색 키워드가 넘어온다면
		if(keyword.equals("")) {
			if(condition.equals("title_content")) {
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {
				dto.setWriter(keyword);
			}
		}
		dto=reviewDao.getData(dto);
		String encodedK=URLEncoder.encode(keyword);
		
		request.setAttribute("dto", dto);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		
	}

	@Override
	public void saveContent(ReviewDto dto) {
		reviewDao.insert(dto);
		
	}

	@Override
	public void updateContent(ReviewDto dto) {
		reviewDao.update(dto);
	}

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String writer=reviewDao.getData(num).getWriter();
		
		reviewDao.delete(num);
	}

	@Override
	public void getData(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		ReviewDto dto=reviewDao.getData(num);
		request.setAttribute("dto", dto);
		
	}

	@Override
	public int likeCount(int num, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		//like 카운트를 올리고
		reviewDao.likeCount(num);
		//현재 like 카운트를 읽어와서 리턴해 준다.
		int count=reviewDao.getData(num).getLikeCount();
		return count;
	}

}
