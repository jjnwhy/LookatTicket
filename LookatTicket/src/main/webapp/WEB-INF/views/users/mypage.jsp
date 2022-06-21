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
</style>
</head>
<body>
	<div class="row">
		<div class="col-8 col-md-4 offset-md-4">
		<h1>내 정보</h1>
		<br />
		<table class="table table-lg">
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
				<td><a href="${pageContext.request.contextPath}/users/pwd_updateform.do">수정하기</a></td>
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
		<a href="${pageContext.request.contextPath}/users/updateform.do">정보 수정하기</a> 
		<a href="${pageContext.request.contextPath}/users/delete.do">탈퇴하기</a> 
	</div>
	</div>
</body>
</html>