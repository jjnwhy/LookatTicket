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
	#write{
		float: right;
	}
	
	a:hover{
		color: highlight;
	}

	#addItem{
		text-align: right;
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
		<div class="container" style="float:right;">
		<c:if test="${id eq 'admin' }">
			<a href="${pageContext.request.contextPath }/shop/insertform.do" id="write">상품 추가 <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
			  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg></a>
		</c:if>
		</div>
		<br /><br />
		<div class="row" style="float:center;">
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
							<h3 class="card-title">${tmp.name }</h3>
							<h5>${tmp.startdate}~${tmp.enddate}</h4>
							출연 : <strong> ${tmp.cast} </strong><br /> 
							가격 : <strong>${tmp.price }</strong>원<br /> 
							장소 : ${tmp.location} <br /> 
							티켓수량 : <strong>${tmp.remainCount }</strong>장
=======
							<h3 class="card-title">
							<img src="${pageContext.request.contextPath }/${tmp.image }"/><br />
							${tmp.name }</h3>
							<h4>${tmp.startdate}~${tmp.enddate}</h4>
							<p class="card-text">
								출연 : <strong> ${tmp.cast} </strong> <br /> 가격 : <strong>${tmp.price }</strong>원
								<br /> 장소 : ${tmp.location} <br /> 티켓수량 : <strong>${tmp.remainCount }</strong>장
>>>>>>> branch 'master' of https://github.com/jjnwhy/LookatTicket.git
							</p>
							<a href="detail.do?num=${tmp.num }" class="card-link">상세보기</a>
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
<script>
//card 이미지의 부모 요소를 선택해서 imgLiquid  동작(jquery plugin 동작) 하기 
 // $(".img-wrapper").imgLiquid();
  
</script> 
</body>
</html>