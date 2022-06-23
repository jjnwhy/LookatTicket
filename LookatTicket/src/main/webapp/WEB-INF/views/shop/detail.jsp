<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<table>
			<tr>
				<th>상품 번호</th>
				<td>${dto.num }</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${dto.price }</td>
			</tr>
			<tr>
				<th>출연</th>
				<td>${dto.cast }</td>
			</tr>
			<tr>
				<th>관람시간</th>
				<td>${dto.hours }</td>
			</tr>
			<tr>
				<th>공연장소</th>
				<td>${dto.location }</td>
			</tr>
		</table>
		<div>좌석선택(미구현)</div>
		<!-- 좌석 목록을 가져오고  선택하면 선택한 값을 저장하고 선택한 좌석(seatnum)에 저장 -->
		<a href="booking.do?num=${dto.num }">예매하기</a>
				
	</div>
</body>
</html>