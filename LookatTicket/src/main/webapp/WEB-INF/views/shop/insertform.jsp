<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" 	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="notice" name="thisPage" />
	</jsp:include>
	
	<div class="container">
	<h1>상품 추가 폼</h1>
	<form action="insert.do" method="post" id="insertform" enctype="multipart/form-data">
		<div>
			<label for="cateNum">카테고리 번호</label>
			<input type="text" name="cateNum" id="cateNum" placeholder="num"/>
		</div>
		<div>
			<label for="name">상품명</label>
			<input type="text" name="name" id="name"/>
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
			<input type="text" name="startdate" id="startdate" />
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
			<input type="file" name="imageFile" id="imageFile"
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div>
		<div>
			<button type="submit">저장</button>
		</div>
	</form>
	</div>


	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>