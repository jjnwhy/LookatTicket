package com.acorn.lookat.notice.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.lookat.exception.NotDeleteException;
import com.acorn.lookat.notice.dao.NoticeDao;
import com.acorn.lookat.notice.dto.NoticeDto;


@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao dao;
		
	@Override
	public void getList(HttpServletRequest request) {
		// 한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 5;
		// 하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT = 5;

		// 보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum = 1;
		// 페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		// 만일 페이지 번호가 파라미터로 넘어 온다면
		if (strPageNum != null) {
			// 숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum = Integer.parseInt(strPageNum);
		}

		// 보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		/*
		 * [ 검색 키워드에 관련된 처리 ] -검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.
		 */
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");
		// 만일 키워드가 넘어오지 않는다면
		if (keyword == null) {
			// 키워드와 검색 조건에 빈 문자열을 넣어준다.
			// 클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서
			keyword = "";
			condition = "";
		}

		// 특수기호를 인코딩한 키워드를 미리 준비한다.
		String encodedK = URLEncoder.encode(keyword);

		// NoticeDto 객체에 startRowNum 과 endRowNum 을 담는다.
		NoticeDto dto = new NoticeDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		// 만일 검색 키워드가 넘어온다면
		if (!keyword.equals("")) {
			// 검색 조건이 무엇이냐에 따라 분기 하기
			if (condition.equals("title_content")) {// 제목 + 내용 검색인 경우
				// 검색 키워드를 CafeDto 에 담아서 전달한다.
				dto.setTitle(keyword);
				dto.setContent(keyword);
			} else if (condition.equals("title")) { // 제목 검색인 경우
				dto.setTitle(keyword);
			} else if (condition.equals("writer")) { // 작성자 검색인 경우
				dto.setWriter(keyword);
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		// 글 목록 얻어오기
		List<NoticeDto> list = dao.getList(dto);
		// 전체글의 갯수
		int totalRow = dao.getCount(dto);
		
		// 하단 시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		// 하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

		// 전체 페이지의 갯수
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		// 끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if (endPageNum > totalPageCount) {
			endPageNum = totalPageCount; // 보정해 준다.
		}
		// view page 에서 필요한 값을 request 에 담아준다.
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
	public void getData(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeDto dto = dao.getData(num);
		request.setAttribute("dto", dto);
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		// 자세히 보여줄 글번호를 읽어온다.
		int num = Integer.parseInt(request.getParameter("num"));
		// 조회수 올리기
		dao.addViewCount(num);

		/*
		 * [ 검색 키워드에 관련된 처리 ] -검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.
		 */
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");
		// 만일 키워드가 넘어오지 않는다면
		if (keyword == null) {
			// 키워드와 검색 조건에 빈 문자열을 넣어준다.
			// 클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서
			keyword = "";
			condition = "";
		}
		// NoticeDto 객체를 생성해서
		NoticeDto dto = new NoticeDto();
		// 자세히 보여줄 글번호를 넣어준다.
		dto.setNum(num);
		// 만일 검색 키워드가 넘어온다면
		if (!keyword.equals("")) {
			// 검색 조건이 무엇이냐에 따라 분기 하기
			if (condition.equals("title_content")) {// 제목 + 내용 검색인 경우
				// 검색 키워드를 CafeDto 에 담아서 전달한다.
				dto.setTitle(keyword);
				dto.setContent(keyword);
			} else if (condition.equals("title")) { // 제목 검색인 경우
				dto.setTitle(keyword);
			} else if (condition.equals("writer")) { // 작성자 검색인 경우
				dto.setWriter(keyword);
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		// NoticeDto 객체를 메소드의 인자로 전달해서 새로운 NoticeDto 객체의 참조값을 얻어온다.
		dto = dao.getData(dto);

		// 특수기호를 인코딩한 키워드를 미리 준비한다.
		String encodedK = URLEncoder.encode(keyword);
//		
//		/*
//		 * [ 댓글 페이징 처리에 관련된 로직 ]
//		 */
//		// 한 페이지에 몇개씩 표시할 것인지
//		final int PAGE_ROW_COUNT = 10;
//
//		// detail.jsp 페이지에서는 항상 1페이지의 댓글 내용만 출력한다.
//		int pageNum = 1;
//
//		// 보여줄 페이지의 시작 ROWNUM
//		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
//		// 보여줄 페이지의 끝 ROWNUM
//		int endRowNum = pageNum * PAGE_ROW_COUNT;
//
//		// 원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
//		CafeCommentDto commentDto = new CafeCommentDto();
//		commentDto.setRef_group(num);
//		// 1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서
//		commentDto.setStartRowNum(startRowNum);
//		commentDto.setEndRowNum(endRowNum);
//
//		// 1페이지에 해당하는 댓글 목록만 select 되도록 한다.
//		List<CafeCommentDto> commentList = cafeCommentDao.getList(commentDto);
//
//		// 원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
//		int totalRow = cafeCommentDao.getCount(num);
//		// 댓글 전체 페이지의 갯수
//		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		
		// view page 에서 필요한 값 request 에 담아주기
		request.setAttribute("dto", dto);
		//request.setAttribute("commentList", commentList);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		//request.setAttribute("totalRow", totalRow);
		//request.setAttribute("totalPageCount", totalPageCount);
	}

	@Override
	public void saveNotice(NoticeDto dto) {
		dao.insert(dto);
	}

	@Override
	public void updateNotice(NoticeDto dto) {
		dao.update(dto);
	}

	@Override
	public void deleteNotice(int num, HttpServletRequest request) {
//		//세션에서 로그인된 아이디를 읽어와서
//		String id=(String)request.getSession().getAttribute("id");
//		//삭제할 글의 작성자
//		String writer=dao.getData(num).getWriter();
//		//만일 글의 작성자가 로그인된 아이디와 다르다면 
//		if(!writer.equals(id)) {
//			//예외를 발생시켜서 응답을 예외 Controller 에서 하도록 한다.
//			throw new NotDeleteException("남의 파일 지우기 없기!");
//		}
		String id = "admin";
		String writer = dao.getData(num).getWriter();
		if(!writer.equals(id)) {
			throw new NotDeleteException("관리자가 아닙니다");
		}
		//본인이 작성한 글이 아니면 아래의 코드가 실행이 안되야 된다. 
		dao.delete(num);
	}

}
