<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
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
	<div class="container">
		<jsp:include page="/include/navbar.jsp">
			<jsp:param value="users" name="thisPage" />
		</jsp:include>
		<br />
		<br />
		<br />
		<br />
		<c:choose>
			<c:when test="${not empty sessionScope.id }">
				<h4><strong>${sessionScope.id }</strong>님, 로그인 되었습니다.🙌</h4>
				<br />
				<br />
				<h6><a href="${requestScope.url }">이전페이지로</a></h6>
			</c:when>
			<c:otherwise>
				<p>
					<h4>아이디 혹은 비밀번호가 달라요.😓</h4>					
					<br />
					<h6><a href="loginform.do?url=${requestScope.encodeUrl }">다시 시도하기</a></h6>			
				</p>
			</c:otherwise>
		</c:choose>
	</div>	
	<br />
	<br />
	<br />
	<br />
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>