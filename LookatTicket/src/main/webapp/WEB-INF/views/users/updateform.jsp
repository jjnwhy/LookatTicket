<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
	<div class="row">
		<div class="col-12 col-md-6 offset-md-3">
		<h1>가입정보 수정</h1>
		<form action="${pageContext.request.contextPath}/users/update.do" method="post">
			<div>
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" type="text" id="id" value="${id }" disabled/>
			</div>
			<div>
				<label class="control-label" for="addrNum">우편번호</label>
				<input class="form-control" type="text" id="addrNum" name="addrNum" value="${dto.addrNum }" />
			</div>
			<div>
				<label class="control-label" for="addr">주소</label>
				<input class="form-control" type="text" id="addr" name="addr" value="${dto.addr }" />
			</div>
			<div>
				<label class="control-label" for="phone">전화번호</label>
				<input class="form-control" type="text" id="phone" name="phone" value="${dto.phone }"/>
			</div>
			<div>
				<label class="control-label" for="email">이메일</label>
				<input class="form-control" type="text" id="email" name="email" value="${dto.email }" />
			</div>
			<button class="btn btn-outline-primary" type="submit">확인</button>
		</form>
	</div>	
</body>
</html>