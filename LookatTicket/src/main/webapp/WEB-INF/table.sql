-- 회원 테이블
CREATE TABLE users(
	id VARCHAR2(100) PRIMARY KEY, -- 회원 아이디
    pwd VARCHAR2(100), -- 비밀번호
    name VARCHAR2(20), -- 이름
    addrNum VARCHAR2(10), -- 우편번호
	addr VARCHAR2(100), -- 주소
	gender VARCHAR2(3), -- 성별
	birth DATE, -- 생일
	phone VARCHAR2(20), -- 전화번호
	email VARCHAR2(50), -- 이메일
	regdate DATE -- 가입일
);

CREATE SEQUENCE shop_seq;
-- 상품 테이블
CREATE TABLE shop(
	num NUMBER PRIMARY KEY, -- 상품 번호
 	cateNum NUMBER NOT NULL, -- 카테고리 번호
 	name VARCHAR2(100) NOT NULL, -- 상품명
 	image VARCHAR2(100), -- 상품 이미지
 	price NUMBER NOT NULL, -- 가격
 	cast VARCHAR2(400), -- 출연
 	hours VARCHAR2(20), -- 관람시간
 	location VARCHAR2(100), -- 공연장소
 	startdate DATE, -- 첫 공연일
 	enddate DATE, -- 마지막 공연일
 	remainCount NUMBER CHECK(remainCount>=0), -- 재고 갯수
 	tel VARCHAR2(100), -- 문의 전화번호
 	seatNum NUMBER -- 좌석번호
);


CREATE SEQUENCE booking_seq;
-- 예약 테이블
CREATE TABLE booking(
	num NUMBER PRIMARY KEY, -- 예약 번호
	shopNum NUMBER NOT NULL, -- 상품 번호
	id VARCHAR2(100), -- 예약자 아이디
	dday DATE, -- 예약일
	price NUMBER, -- 가격
	seatNum NUMBER, -- 좌석번호
	location VARCHAR2(100) -- 공연장소
);

CREATE SEQUENCE board_review_seq;
-- 리뷰 테이블
CREATE TABLE board_review(
	num NUMBER PRIMARY KEY, -- 글 번호
	shopNum NUMBER NOT NULL, -- 상품 번호
	writer VARCHAR2(100) NOT NULL, -- 작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, -- 제목
	content CLOB, -- 글 내용
	viewCount NUMBER, -- 조회수
	likeCount NUMBER, -- 좋아요 수
	regdate DATE -- 글 작성일
);

CREATE SEQUENCE board_QnA_seq;
-- QnA 테이블
CREATE TABLE board_QnA(
	num NUMBER PRIMARY KEY, -- 글 번호
	writer VARCHAR2(100) NOT NULL, -- 작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, -- 제목
	content CLOB, -- 글 내용
	viewCount NUMBER, -- 조회수
	regdate DATE, -- 글 작성일
	adminComment VARCHAR2(100) -- 관리자 답변
);

CREATE SEQUENCE notice_seq;
-- 공지사항 테이블
CREATE TABLE notice(
	num NUMBER PRIMARY KEY, -- 글 번호
	title VARCHAR2(100) NOT NULL, -- 글 제목
	content CLOB, -- 글 내용
	writer VARCHAR2(20) NOT NULL, -- 작성자 (관리자만 가능)
	viewCount NUMBER, -- 조회수
	regdate DATE -- 글 작성일
);



alter table booking add concertdate DATE;
alter table booking add name VARCHAR2(200);
