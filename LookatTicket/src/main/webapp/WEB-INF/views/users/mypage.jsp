<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/mypage.jsp</title>
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
	
	th{
		vertical-align:middle;
	}
	
	tr{
		text-align:center;
	}
	
</style>

</head>
<body>

	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="mypage" name="thisPage" />
	</jsp:include>
	<div class="container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do">홈</a></li>
				 <li class="breadcrumb-item active">마이페이지</li>
			 </ol>
		</nav>
	<div class="row">
		<div class="col-8 col-md-6 offset-md-3">
		<h2>마이페이지</h2>
		<br />
		<table class="table table-default">
			<colgroup>
				<col style="width:20%">
				<col style="width:40%">
			</colgroup>
			<tr>
				<th scope="row">이름</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th scope="row">아이디</th>
				<td>${id }</td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td><button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='${pageContext.request.contextPath}/users/pwd_updateform.do'">비밀번호 수정</button></td>
			</tr>
			<tr>
				<th scope="row">주소</th>
				<td>(${dto.addrNum }) ${dto.addr }</td>
			</tr>
			<tr>
				<th scope="row">생년월일</th>
				<td>${dto.birth }</td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td>${dto.phone }</td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td>${dto.email }</td>
			</tr>
			<tr>
				<th scope="row">가입일</th>
				<td>${dto.regdate }</td>
			</tr>
		</table>
		<a class="btn btn-outline-secondary btn-sm" href='${pageContext.request.contextPath}/users/updateform.do'">정보수정 하기  </a>
		<a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath }/users/delete.do" onclick="return confirm('정말 탈퇴하시겠습니까?😭');">회원탈퇴</a>
	</div>
	</div>
	</div>	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>