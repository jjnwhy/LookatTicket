<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	a:visited, a:active
	{
	    color: #000000;
	    text-decoration: none;
	}
	
	#home{
		text-decoration:none;
	}
	
	a:hover{
		color: highlight;
	}
	th,td{
		text-align:center;
	}

</style>	
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="booking" name="thisPage"/>
	</jsp:include>
	
	<div class="container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do" id="home">Home</a></li>
				 <li class="breadcrumb-item active">예매내역</li>
			 </ol>
		</nav>
	</div>	
		<br />
		<div class="container">
			<h2>${id }님의 예매내역</h2>
			<br />
			<c:choose>
				<c:when test="${list !=null }">
						<table class="table">
							<thead>
								<tr>
									<th>예매 번호</th>
									<th>예약 일시</th>
									<th>상품 이름</th>
									<th>상품 번호</th>
									<th>공연명</th>
									<th>가격</th>
									<th>선택 좌석</th>
									<th>장소</th>
									<th>공연 날짜</th>
									<th></th>

								</tr>
							</thead>
							<tbody>
						<c:forEach var="tmp" items="${list}">
						<c:if test="${tmp.id eq sessionScope.id }">
							<tr>
								<td>${tmp.num }</td>
								<td>${tmp.dday }</td>
								<td>${tmp.name }</td>
								<td>${tmp.shopNum}</td>
								<td>${tmp.name }</td>
								<td>${tmp.price}</td>
								<td>${tmp.seatNum}</td>
								<td>${tmp.location}</td>
								<td>${tmp.concertdate }</td>
								<td><a href="${pageContext.request.contextPath}/booking/delete.do?num=${tmp.num }" onclick="return confirm('${tmp.name} 예매를 취소하시겠습니까?');">예매 취소</a></td>
						</c:if>
					 	</c:forEach>
							</tbody>
						</table>					
				<%--delete 링크에서 contextPath를 제거하고 링크를 달면 회원탈퇴가 되버리니 조심하세요.. --%>
				
				</c:when>
				<c:otherwise>
					<p>예매 내역이 없어요. ( @.@ )</p>
				</c:otherwise>

			</c:choose>

	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
		
</body>
</html>