<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/list.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	a:link, a:visited, a:active
	{
	    color: #000000;
	    text-decoration: none;
	}
	
	a:hover{
		color: highlight;
	}
	.card-img-top{
		height:15rem;
		object-fit:fill;
	}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="shop" name="thisPage" />
	</jsp:include>
	<div class="container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do">홈</a></li>
				 <li class="breadcrumb-item active">Ticket</li>
			 </ol>
		</nav>
		<br />
		<h2>CONCERT</h2>
		<h1>상품 목록 입니다.</h1>
		<c:if test="${id eq 'admin' }">
			<a href="${pageContext.request.contextPath }/shop/insertform.do">상품추가</a>
		</c:if>
		<div class="row">
			<c:forEach var="tmp" items="${list }">
				<div class="col mb-2">
					<div class="card" style="width: 18rem;" onclick="location.href='detail.do?num=${tmp.num }'">
					<img src="${pageContext.request.contextPath }/${tmp.image }" class="card-img-top"/>
						<div class="card-body">
							<p class="card-text">
								<h6>&lt;${tmp.name }&gt;</h6>
								<strong>${tmp.startdate}~${tmp.enddate}</strong><br />
								출연 : <strong> ${tmp.cast} </strong> <br /> 가격 : <strong>${tmp.price }</strong>원
								<br /> 장소 : <strong>${tmp.location}</strong> <br /> 티켓수량 : <strong>${tmp.remainCount }</strong>장
							</p>
							<c:if test="${tmp.remainCount ne 0 }">
								<button class="btn btn-primary btn-sm" onclick="location.href='detail.do?num=${tmp.num }'">자세히보기</button>
							</c:if>
							<c:if test="${id eq 'admin' }">
								<button class="btn btn-primary btn-sm" onclick="location.href='delete.do?num=${tmp.num }'">상품삭제</button>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 
		<div class="row">
			<c:forEach var="tmp" items="${list }">
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h3 class="card-title">
							<img src="${pageContext.request.contextPath }/${tmp.image }"/><br />
							${tmp.name }</h3>
							<h4>${tmp.startdate}~${tmp.enddate}</h4>
							<p class="card-text">
								출연 : <strong> ${tmp.cast} </strong> <br /> 가격 : <strong>${tmp.price }</strong>원
								<br /> 장소 : ${tmp.location} <br /> 티켓수량 : <strong>${tmp.remainCount }</strong>장
							</p>
							<c:if test="${tmp.remainCount ne 0 }">
								<a href="detail.do?num=${tmp.num }" class="card-link">예매하기</a>
							</c:if><br />		
							<c:if test="${id eq 'admin' }">
								<td><a href="delete.do?num=${tmp.num }">상품삭제</a></td>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		 -->
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>