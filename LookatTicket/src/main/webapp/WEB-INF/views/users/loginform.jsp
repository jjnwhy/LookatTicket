<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
	<div class="col-12 col-md-6 offset-md-3">
	<h1>로그인</h1>
	<form action="${pageContext.request.contextPath}/users/login.do" method="post">
		<c:choose>
			<c:when test="${empty param.url }">
				<input type="hidden" name="url" value="${pageContext.request.contextPath}" />
			</c:when>
			<c:otherwise>
				<input type="hidden" name=url" value="${param.url }" />
			</c:otherwise>
		</c:choose>
		<div>
			<label class="control-label" for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id" />
		</div>
		<div>
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd" />
		</div>
		<button class="btn btn-outline-primary" type="submit">로그인</button>
		<button class="btn btn-outline-primary" type="button" onclick="location.href='${pageContext.request.contextPath}'">취소</button>
	</form>
</div>	
</body>
</html>