<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${empty sessionScope.id }">
			<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
			<a href="${pageContext.request.contextPath}/users/signup_form.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<p>
				<a href="${pageContext.request.contextPath}/users/mypage.do">${sessionScope.id }</a>로그인 중..
				<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a> 
			</p>
		</c:otherwise>
	</c:choose>
	<h1>3조 화이팅</h1>
</div>
	<li><a href="${pageContext.request.contextPath}/review/list.do">리뷰목록</a></li>
</body>
</html>