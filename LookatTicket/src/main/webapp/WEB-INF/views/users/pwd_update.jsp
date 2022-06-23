<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/pwd_update.jsp</title>
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
	
	h4,h6{
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="users" name="thisPage" />
	</jsp:include>
		<br />
		<br />
		<br />
		<br />
	<div class="container">
		<c:choose>
			<c:when test="${isSuccess }">
				<h4>비밀번호를 수정하고 로그아웃되었습니다.</h4>
				<br />
				<br />
				<h6><a href="${pageContext.request.contextPath}/users/loginform.do">다시 로그인 하기</a></h6>
			</c:when>
			<c:otherwise>
				<h4>기존 비밀번호를 확인해주세요.😵<h4>
				<br />
				<h6><a href="${pageContext.request.contextPath}/users/pwd_updateform.do">다시시도</a></h6>	
			</c:otherwise>
		</c:choose>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>