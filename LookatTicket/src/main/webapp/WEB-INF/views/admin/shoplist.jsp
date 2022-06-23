<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" 	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	th, td{
		text-align: center;
	}
</style>
</head>
<body>

		<table class="table">
			<caption align="top">상품 관리</caption>
			<thead>
				<tr>
					<th>카테고리</th>
					<th>상품명</th>
					<th>가격</th>
					<th>출연진</th>
					<th>공연시간</th>
					<th>공연기간</th>
					<th>전화번호</th>
					<th>수용인원(티켓수량)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${shopList }">
					<tr>
						<td>${dto.catenum }</td>
						<td>${dto.name }</td>
						<td>${dto.price }</td>
						<td>${dto.cast }</td>
						<td>${dto.hours }</td>
						<td>${dto.startdate } ~ ${dto.enddate }</td>
						<td>${dto.tel }</td>
						<td>${dto.remainCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

</body>
</html>