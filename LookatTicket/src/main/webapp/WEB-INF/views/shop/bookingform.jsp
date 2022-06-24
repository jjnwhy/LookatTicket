<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/shop/bookingform</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="ticket" name="thisPage" />
	</jsp:include>
	<div class="container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do">홈</a></li>
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/shop/list.do">Ticket</a></li>
				 <li class="breadcrumb-item active">상세정보</li>
			 </ol>
		</nav>
		<table class="table">
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
			<tr>
				<th>공연날짜</th>
				<td>${dto.startdate } ~ ${dto.enddate }</td>
			</tr>
		</table>
		<form action="booking.do" method="post">
			<input type="hidden" name="num" id="num" value="${dto.num }"/>
			<!--<input type="hidden" name="price" id="price" value="${dto.price }" />
			<input type="hidden" name="cast" id="cast" value="${dto.cast}" />
			<input type="hidden" name="hours" id="hours" value="${dto.hours }" />
			<input type="hidden" name="location" id="location" value="${dto.location }" /> -->
			<input type="date" min=${dto.startdate } max=${dto.enddate } name="concertdate"/>
			<button type="submit">전송</button>
		</form>
				
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>

</html>