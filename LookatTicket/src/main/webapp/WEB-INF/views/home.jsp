<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
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