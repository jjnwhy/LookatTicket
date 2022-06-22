<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="ticket" name="thisPage" />
	</jsp:include>


	<div class="container">
		<h1>상품 목록 입니다.</h1>
		<c:choose>
			<c:when test="${empty id }">
				<p>
					<a href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>
					<a href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a>
				</p>
			</c:when>
			<c:otherwise>
				<p>
					<strong>${id }</strong> 님 로그인중...
				</p>
			</c:otherwise>
		</c:choose>
		<div class="row">
			<c:forEach var="tmp" items="${list }">
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">${tmp.name }</h2>
							<h3>${tmp.startdate}~${tmp.enddate}</h3>
							<p class="card-text">
								출연 : <strong> ${tmp.cast} </strong> <br /> 가격 : <strong>${tmp.price }</strong>원
								<br /> 장소 : ${tmp.location} <br /> 티켓수량 : <strong>${tmp.remainCount }</strong>장
							</p>
							<a href="detail.do?num=${tmp.num }" class="card-link">예매하기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>