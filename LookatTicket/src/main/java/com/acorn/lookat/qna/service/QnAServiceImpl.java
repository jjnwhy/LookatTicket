package com.acorn.lookat.qna.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.lookat.exception.NotDeleteException;
import com.acorn.lookat.qna.dao.QnACommentDao;
import com.acorn.lookat.qna.dao.QnADao;
import com.acorn.lookat.qna.dto.QnACommentDto;
import com.acorn.lookat.qna.dto.QnADto;

@Service
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnADao qnaDao;
	@Autowired
	private QnACommentDao qnaCommentDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		final int PAGE_ROW_COUNT=15;
		final int PAGE_DISPLAY_COUNT=5;
		
		int pageNum=1;
		
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null) {
			pageNum=Integer.parseInt(strPageNum);
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		if(keyword==null) {
			keyword="";
			condition="";
		}
		
		String encodedK=URLEncoder.encode(keyword);
		
		QnADto dto=new QnADto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		if(!keyword.equals("")) {
			if(condition.equals("title_content")) {
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {
				dto.setWriter(keyword);
			}
		}
		List<QnADto> list=qnaDao.getList(dto);
		int totalRow=qnaDao.getCount(dto);
		int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
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
		qnaDao.addViewCount(num);
		
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		if(keyword==null) {
			keyword="";
			condition="";
		}
		QnADto dto=new QnADto();
		dto.setNum(num);
		if(!keyword.equals("")) {
			if(condition.equals("title_content")) {
				dto.setTitle(keyword);
				dto.setContent(keyword);			
			}else if(condition.equals("title")){ //제목 검색인 경우
				dto.setTitle(keyword);	
			}else if(condition.equals("writer")){ //작성자 검색인 경우
				dto.setWriter(keyword);	
			}
		}
		dto=qnaDao.getData(dto);
		String encodedK=URLEncoder.encode(keyword);
		
		final int PAGE_ROW_COUNT=10;
		int pageNum=1;
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		QnACommentDto commentDto=new QnACommentDto();
		commentDto.setRef_group(num);
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		
		List<QnACommentDto> commentList=qnaCommentDao.getList(commentDto);
		
		int totalRow=qnaCommentDao.getCount(num);

		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);

		request.setAttribute("dto", dto);
		request.setAttribute("commentList", commentList);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("totalPageCount", totalPageCount);
	}

	@Override
	public void saveContent(QnADto dto) {
		qnaDao.insert(dto);
	}

	@Override
	public void updateContent(QnADto dto) {
		qnaDao.update(dto);
	}

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String writer=qnaDao.getData(num).getWriter();
		if(!writer.equals(id)) {
			throw new NotDeleteException("남의 파일 지울 수 없음");
		}
		qnaDao.delete(num);
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		String target_id=request.getParameter("target_id");
		String content=request.getParameter("content");
		
		String comment_group=request.getParameter("comment_group");
		String writer=(String)request.getSession().getAttribute("id");
		int seq=qnaCommentDao.getSequence();
		QnACommentDto dto=new QnACommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		
		if(comment_group == null){
			dto.setComment_group(seq);
		}else{
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		qnaCommentDao.insert(dto);
	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		QnACommentDto dto=qnaCommentDao.getData(num);
		String id=(String)request.getSession().getAttribute("id");
		if(!dto.getWriter().equals(id)) {
			throw new NotDeleteException("남의 댓글을 지울 수 없습니다!");
		}
		
		qnaCommentDao.delete(num);
		
	}

	@Override
	public void updateComment(QnACommentDto dto) {
		qnaCommentDao.update(dto);
	}

	@Override
	public void moreCommentList(HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int num=Integer.parseInt(request.getParameter("num"));
		
		final int PAGE_ROW_COUNT=10;
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		QnACommentDto commentDto=new QnACommentDto();
		commentDto.setRef_group(num);
		
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		
		List<QnACommentDto> commentList=qnaCommentDao.getList(commentDto);
		int totalRow=qnaCommentDao.getCount(num);

		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);

		request.setAttribute("commentList", commentList);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
	}

	@Override
	public void getData(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		QnADto dto=qnaDao.getData(num);
		request.setAttribute("dto", dto);
	}

}
