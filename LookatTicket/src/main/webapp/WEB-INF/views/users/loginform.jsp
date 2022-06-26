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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}

html,
body {
  height: 100%;
}

body {
  display: justify-content: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: white;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="id"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 50;
  border-top-right-radius: 50;
}
</style>
</head>

<body class="text-center">
	<jsp:include page="/include/navbar.jsp">
			<jsp:param value="users" name="thisPage" />
	</jsp:include>
<main class="form-signin w-100 m-auto">
  <form action="${pageContext.request.contextPath}/users/login.do" method="post">
	    <c:choose>
			<c:when test="${empty param.url }">
				<input type="hidden" name="url" value="${pageContext.request.contextPath}/" />
			</c:when>
			<c:otherwise>
				<input type="hidden" name="url" value="${param.url }" />
			</c:otherwise>
		</c:choose>
    <a href="${pageContext.request.contextPath}"/><img class="mb-4" src="${pageContext.request.contextPath}/images/lookat_logo.jpg" width="90" height="57"></a>
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="text" class="form-control" name="id" id="id" placeholder="id" autofocus>
      <label for="id">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
      <label for="pwd">비밀번호</label>
    </div>
 	<button class="w-100 btn btn-lg btn-secondary" type="submit">Sign in</button>  
  </form>
    
</main>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>