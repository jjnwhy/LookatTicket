<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/admin/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
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
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="admin" name="thisPage" />
	</jsp:include>
	
	<div class="container">
	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do">홈</a></li>
				 <li class="breadcrumb-item active">관리자 전용</li>
			 </ol>
	</nav>
		<h1>관리자 페이지</h1>
		<div class="btn-group" role="group" aria-label="Basic outlined example">
			<button type="button" class="btn btn-outline-primary" id="usersBtn">회원 관리</button>
			<button type="button" class="btn btn-outline-primary" id="shopBtn">상품 관리</button>
			
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
		<script type="text/javascript">
			document.querySelector("#usersBtn").addEventListener("click",function(){
				fetch("${pageContext.request.contextPath }/admin/userslist.do")
				.then(function(response){
					return response.text();
				})
				.then(function(data){
					console.log(data);
					document.querySelector("#m1").innerHTML=data;
				});
			});
			document.querySelector("#shopBtn").addEventListener("click",function(){
				fetch("${pageContext.request.contextPath }/admin/shoplist.do")
				.then(function(response){
					return response.text();
				})
				.then(function(data){
					console.log(data);
					document.querySelector("#m1").innerHTML=data;
				});
			});
		</script>
		<div id="m1">
		
		<table class="table">
			<caption align="top">회원 관리</caption>
			<thead>
				<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>주소</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>email</th>
				<th>가입일</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.id }</td>
						<td>${tmp.name }</td>
						<td>(${tmp.addrNum }) ${tmp.addr }</td>
						<td>${tmp.birth }</td>
						<td>${tmp.phone }</td>
						<td>${tmp.email }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		</div>
		 
	</div>
	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>