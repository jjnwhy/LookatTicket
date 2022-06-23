<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/delete.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<style>
.container{
	text-align:center;
}


</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="users" name="thisPage" />
	</jsp:include>
	<div class="container">
		<p>
			<img src="${pageContext.request.contextPath }/images/lookat_foot.jpg" width="500" height="200"/><br /><br />		
			<h5><strong>${requestScope.id }</strong>님 탈퇴처리 되었습니다.</h5><br />
			<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/home.do'">홈으로 가기</button>
			<!-- <a href="${pageContext.request.contextPath}/home.do">메인으로</a> -->
		</p>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>