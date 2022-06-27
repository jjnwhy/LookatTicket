<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/shop/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	<h1>상품 정보 수정</h1>
	<form action="update.do" method="post" id="updateform">
		<div>
			<label for="cateNum">카테고리명</label>
			<input type="text" name="cateNum" id="cateNum" value="${dto.cateNum }" />
		</div>
		<div>
			<label for="name">상품명</label>
			<input type="text" name="name" id="name" value="${dto.name }"/>
		</div>
		<div>
			<label for="num">상품 번호</label>
			<input type="text" name="num" id="num" value="${dto.num }"/>
		</div>
		<div>
			<label for="price">가격</label>
			<input type="text" name="price" id="price" value="${dto.price }"/>
		</div>
		<div>
			<label for="cast">출연</label>
			<input type="text" name="cast" id="cast" value="${dto.cast }"/>
		</div>
		<div>
			<label for="hours">관람 시간</label>
			<input type="text" name="hours" id="hours"value="${dto.hours }"/>
		</div>
		<div>
			<label for="location">공연 장소</label>
			<input type="text" name="location" id="location" value="${dto.location }"/>
		</div>
		<div>
			<label for="startdate">시작일</label>
			<input type="text" name="startdate" id="startdate" value="${dto.startdate }"/>
		</div>
		<div>
			<label for="enddate">종료일</label>
			<input type="text" name="enddate" id="enddate" value="${dto.enddate }"/>
		</div>
		<div>
			<label for="remainCount">재고 개수</label>
			<input type="text" name="remainCount" id="remainCount" value="${dto.remainCount }"/>
		</div>
		<div>
			<label for="tel">문의전화번호</label>
			<input type="text" name="tel" id="tel" value="${dto.tel }"/>
		</div>
		<div>
			<label for="seatNum">좌석 번호</label>
			<input type="text" name="seatNum" id="seatNum" value="${dto.seatNum }"/>
		</div>
		<div>
			<label for="image">이미지</label>
			<input type="file" name="image" id="image" value="${dto.image }"/>
		</div>
	</form>
</div>
</body>
</html>