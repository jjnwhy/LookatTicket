package com.acorn.lookat.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.lookat.booking.dao.BookingDao;
import com.acorn.lookat.booking.dto.BookingDto;
import com.acorn.lookat.users.dao.UsersDao;
import com.acorn.lookat.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao dao;
	@Autowired
	private BookingDao dao2;
	
	@Override
	public Map<String, Object> isExistId(String inputId) {
		//Map객체 생성하기
		Map<String, Object> map = new HashMap<String, Object>();
		//isExist라는 키값으로 아이디가 존재하는지 여부를 담기
		map.put("isExist", dao.isExist(inputId));
		//Map객체 리턴하기
		return map;
	}

	@Override
	public void addUser(UsersDto dto) {
		//사용자가 입력한 비밀번호를 읽어와서
		String pwd = dto.getPwd();
		//암호화 해서 
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		//dto에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		
		dao.insert(dto);
	}

	@Override
	public void loginProcess(UsersDto dto, HttpSession session) {
		//입력한 정보가 맞는지 여부
		boolean isValid = false;
		
		//로그인 폼에 입력한 아이디를 이용해서 해당정보를 select 한다.
		UsersDto result = dao.getData(dto.getId());
		if(result!=null) {//만일 존재하는 id라면
			//비밀번호가 일치하는지 확인한다.
			String encodedPwd = result.getPwd();//DB에 저장된 암호화된 비밀번호
			String inputPwd = dto.getPwd(); //로그인 폼에 입력한 비밀번호
			//BCrypt 클래스의 static 메소드를 이용해서 일치여부를 얻어낸다.
			isValid = BCrypt.checkpw(inputPwd, encodedPwd);
		}
		
		if(isValid) {//만일 유효한 정보이면 
			//로그인 처리를 한다.
			session.setAttribute("id", dto.getId());
		}
	}

	@Override
	public void getMypage(HttpSession session, ModelAndView mView) {
		//로그인된 아이디를 읽어온다.
		String id = (String)session.getAttribute("id");
		//DB에서 회원정보를 읽어와서
		UsersDto dto = dao.getData(id);
		//ModelAndView 객체에 담아준다.
		mView.addObject("dto", dto);
	}
	

	@Override
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView) {
		//세션 영역에서 로그인된 아이디 읽어오기
		String id=(String)session.getAttribute("id");
		//DB 에 저장된 회원정보 얻어오기
		UsersDto resultDto=dao.getData(id);
		//DB 에 저장된 암호화된 비밀 번호
		String encodedPwd=resultDto.getPwd();
		//클라이언트가 입력한 비밀번호
		String inputPwd=dto.getPwd();
		//두 비밀번호가 일치하는지 확인
		boolean isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		//만일 일치 한다면
		if(isValid) {
			//새로운 비밀번호를 암호화 한다.
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String encodedNewPwd=encoder.encode(dto.getNewPwd());
			//암호화된 비밀번호를 dto 에 다시 넣어준다.
			dto.setNewPwd(encodedNewPwd);
			//dto 에 로그인된 아이디도 넣어준다.
			dto.setId(id);
			//dao 를 이용해서 DB 에 수정 반영한다.
			dao.updatePwd(dto);
			//로그아웃 처리
			session.removeAttribute("id");
		}
		//작업의 성공여부를 ModelAndView 객체에 담아 놓는다(결국 HttpServletRequest 에 담긴다)
		mView.addObject("isSuccess", isValid);
		//로그인된 아이디도 담아준다.
		mView.addObject("id", id);

	}

	@Override
	public void updateUser(UsersDto dto, HttpSession session) {
		//수정할 회원의 아이디 읽어오기
		String id = (String)session.getAttribute("id");
		//UsersDto에 id를 담아서
		dto.setId(id);
		//UsersDao를 이용해서 수정 반영한다.
		dao.update(dto);
		
	}

	@Override
	public void deleteUser(HttpSession session, ModelAndView mView) {
		//삭제할 회원의 아이디 읽어오기
		String id =(String)session.getAttribute("id");
		//해당 정보를 DB에서 삭제
		dao.delete(id);
		//로그아웃 처리
		session.removeAttribute("id");
		//ModelAndView객체에 탈퇴한 회원의 아이디를 담아준다.
		mView.addObject("id", id);
		
	}

	@Override
	public void getBookingList(HttpSession session, ModelAndView mView) {
		//로그인된 아이디를 읽어온다.
		String id = (String)session.getAttribute("id");
		//DB에서 예약정보를 읽어와서
		BookingDto dto=new BookingDto();
		List<BookingDto> list = dao2.getList(dto);
		//ModelAndView 객체에 담아준다.
		mView.addObject("list", list);
		
	}



}
