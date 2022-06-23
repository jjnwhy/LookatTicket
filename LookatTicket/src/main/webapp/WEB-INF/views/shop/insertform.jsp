<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/shop/insertform.jsp</title>
</head>
<body>
<div class="container">
	<h1>상품 추가 폼</h1>
	<form action="insert.do" method="post" id="insertform">
		<div>
			<label for="cateNum">카테고리명</label>
			<input type="text" name="cateNum" id="cateNum" />
		</div>
		<div>
			<label for="name">상품명</label>
			<input type="text" name="name" id="name"/>
		</div>
		<div>
			<label for="num">상품 번호</label>
			<input type="text" name="num" id="num"/>
		</div>
		<div>
			<label for="price">가격</label>
			<input type="text" name="price" id="price"/>
		</div>
		<div>
			<label for="cast">출연</label>
			<input type="text" name="cast" id="cast"/>
		</div>
		<div>
			<label for="hours">관람 시간</label>
			<input type="text" name="hours" id="hours"/>
		</div>
		<div>
			<label for="location">공연 장소</label>
			<input type="text" name="location" id="location"/>
		</div>
		<div>
			<label for="startdate">시작일</label>
			<input type="text" name="startdate" id="startdate"/>
		</div>
		<div>
			<label for="enddate">종료일</label>
			<input type="text" name="enddate" id="enddate"/>
		</div>
		<div>
			<label for="remainCount">재고 개수</label>
			<input type="text" name="remainCount" id="remainCount"/>
		</div>
		<div>
			<label for="tel">문의전화번호</label>
			<input type="text" name="tel" id="tel"/>
		</div>
		<div>
			<label for="seatNum">좌석 번호</label>
			<input type="text" name="seatNum" id="seatNum"/>
		</div>
		<div>
			<label for="image">이미지</label>
			<input type="file" name="image" id="image"/>
		</div>
	</form>
</div>

</body>
</html>