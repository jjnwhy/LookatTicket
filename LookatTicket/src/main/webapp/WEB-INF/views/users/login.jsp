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
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<c:choose>
			<c:when test="${not empty sessionScope.id }">
				<p>
					<strong>${sessionScope.id }</strong>님 로그인 되었습니다.
					<a href="${requestScope.url }">확인</a>
				</p>
			</c:when>
			<c:otherwise>
				<p>
					아이디 혹은 비밀번호가 다릅니다.
					<a href="loginform.do?url=${requestScope.encodeUrl }">다시 시도</a>			
				</p>
			</c:otherwise>
		</c:choose>
	</div>	
</body>
</html>