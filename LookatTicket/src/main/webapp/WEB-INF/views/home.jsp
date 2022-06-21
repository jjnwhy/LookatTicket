<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>

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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />

</head>
<body>
	<div class="container">
	<h1>lookat Ticket 페이지</h1>
	<c:choose>
		<c:when test="${empty sessionScope.id }">
			<a href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>
			<a href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<p>
				<a href="${pageContext.request.contextPath}/users/mypage.do">${sessionScope.id }</a>로그인 중..
				<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a> 
			</p>
		</c:otherwise>
	</c:choose>
	<div class="container">
	<a href="${pageContext.request.contextPath }/home.do">홈</a>
	<a href="${pageContext.request.contextPath }/shop/list.do">티켓</a>
	<a href="${pageContext.request.contextPath }/review/list.do">리뷰</a>
	<a href="${pageContext.request.contextPath }/qna/list.do">QnA</a>
	<a href="${pageContext.request.contextPath }/notice/list.do">공지사항</a>
	</div>
	</div>
	
</body>
</html>