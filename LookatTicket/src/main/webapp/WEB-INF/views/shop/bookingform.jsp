<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   #myTable{
   		width:60%;
   }
   
   #myInput{
   		border-radius:5px;
   }

  </style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="ticket" name="thisPage" />
	</jsp:include>
	<div class="container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do">Home</a></li>
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/shop/list.do">Ticket</a></li>
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/shop/detail.do">상세정보</a></li>	
				 <li class="breadcrumb-item active">예약하기</li>
			 </ol>
		</nav>
		<br />	
		
		<table class="table" id="myTable">
		<colgroup>
			<col style="width:20%">
			<col style="width:40%">
		</colgroup>
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
				<td>${dto.price }원</td>
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
		<form action="booking.do" method="post" id="myForm">
			<input class="form-control" type="hidden" name="num" id="num" value="${dto.num }"/>
			<input class="form-control" type="hidden" name="name" id="name" value="${dto.name }"/>
			<label class="control-label" for="concert">날짜 선택</label>
			<div class="input-group">
				<input type="date" min="${dto.startdate }" max="${dto.enddate }" name="concertdate" style="width:150px;"/>
				<span class="input-group-btn ms-2">
					<button class="btn btn-primary" type="submit" id="submitBtn">전송</button>
				</span>	
			</div>
		</form>

		<script>
		document.querySelector("#myForm").addEventListener("submit",function(e){
			let dateControl = document.querySelector('input[type="date"]').value;
			if(dateControl==""){
				alert("날짜를 선택하세요!");
				e.preventDefault();
				//document.querySelector("#myForm").preventDefault();
			}
		});
		
			
		</script>

		<br />
				<!-- <div>좌석선택(미구현)</div> -->
		<!-- 좌석 현황 표출 
		<div class="showSeatArea">
			<div class="btn-group" data-toggle="buttons" id="F_div">
				<label class="btn btn-big btn-primary" for="F1" id="F1_lb">
				<input type="checkbox" autocomplete="off" id="F1" value="F1">F1</label> 
				<label class="btn btn-big btn-primary" for="F2" id="F2_lb">
				<input type="checkbox" autocomplete="off" id="F2">F2</label> 
				<label class="btn btn-big btn-primary" for="F3" id="F3_lb">
				<input type="checkbox" autocomplete="off" id="F3">F3</label>
			</div>
			<br> <br>
			<div class="btn-group" data-toggle="buttons" id="E_div">
				<label class="btn btn-big btn-primary" for="E1" id="E1_lb">
				<input type="checkbox" autocomplete="off" id="E1">E1</label> 
				<label class="btn btn-big btn-primary" for="E2" id="E2_lb">
				<input type="checkbox" autocomplete="off" id="E2">E2</label> 
				<label class="btn btn-big btn-primary" for="E3" id="E3_lb">
				<input type="checkbox" autocomplete="off" id="E3">E3</label>
			</div>
			<br> <br>
			<div class="btn-group" data-toggle="buttons" id="B_div">
				<label class="btn btn-big btn-primary" for="B1" id="B1_lb">
				<input type="checkbox" autocomplete="off" id="B1">B1</label> 
				<label class="btn btn-big btn-primary" for="B2" id="B2_lb">
				<input type="checkbox" autocomplete="off" id="B2">B2</label> 
				<label class="btn btn-big btn-primary" for="B3" id="B3_lb">
				<input type="checkbox" autocomplete="off" id="B3">B3</label>
			</div>
			<br> <br>
		</div>
		</form>
			-->	
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>

</html>