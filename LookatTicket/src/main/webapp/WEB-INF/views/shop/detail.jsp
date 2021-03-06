<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/shop/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script> <!-- jQuery -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.breadcrumb-item > a:link, a:visited, a:active{
		color: #000000;
	    text-decoration: none;
	}
	
	a:hover{
		color: highlight;
	}
	a{
		text-align:center;
	}
	
	.table{
		width:80%;
	}
	
	th, td{
		text-align:center;
	}
	#bookBtn{
		color:white;
	}
	#container{
		align-items: center;
	}

	.seattable tr td{
		border: 1px solid;
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
				 	<a href="${pageContext.request.contextPath}/home.do">Home</a></li>
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/shop/list.do">Ticket</a></li>
				 <li class="breadcrumb-item active">????????????</li>
			 </ol>
		</nav>
		<br />
		<h2 align="center">?????? ????????????</h2>
		<br />
		<table class="table" align="center">
			<colgroup>
				<col style="width:10%">
				<col style="width:30%">
				<col style="width:10%">
				<col style="width:30%">
			</colgroup>
			<tr>
				<th>?????? ??????</th>
				<td>${dto.num }</td>
				<th>?????????</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th>??????</th>
				<td>${dto.price }???</td>
				<th>??????</th>
				<td>${dto.cast }</td>
			</tr>
			<tr>
				<th>????????????</th>
				<td>${dto.hours }</td>
				<th>????????????</th>
				<td>${dto.location }</td>
			</tr>
			<tr>
				<th>????????????</th>
				<td colspan="3">${dto.startdate } ~ ${dto.enddate }</td>
			</tr>
			<tr>
				<th>?????? ?????????</th>
				<td colspan="3"><img src="${pageContext.request.contextPath}${dto.image}" height="100%" width="100%"/></td>
			</tr>
			<tr>

				<c:if test="${dto.remainCount ne 0 }">

				<td colspan="4"><a class="btn btn-primary" href="bookingform.do?num=${dto.num }" onclick="return confirm('${dto.name}???(???) ?????????????????????????')" id="bookBtn">????????????</a>

				</td>
				</c:if>
				<c:if test="${dto.remainCount eq 0 }">
				<td colspan="4"><a class="btn btn-danger" disabled >??????</a>
				</c:if>
			</tr>
		</table>
		<div>????????????(?????????)</div>
		<!-- ?????? ????????? ????????????  ???????????? ????????? ?????? ???????????? ????????? ??????(seatnum)??? ?????? -->
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>