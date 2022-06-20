-- 회원 테이블
CREATE TABLE users(
   id VARCHAR2(100) PRIMARY KEY, -- 회원 아이디
   pwd VARCHAR2(100), -- 비밀번호
   name VARCHAR2(20), -- 이름
   addrNum NUMBER, -- 우편번호
   addr VARCHAR2(100), -- 주소
   gender VARCHAR2(3), -- 성별
   birth DATE, -- 생일
   phone VARCHAR2(20), -- 전화번호
   email VARCHAR2(50), -- 이메일
   regdate DATE -- 가입일
);

