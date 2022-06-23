<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/pwd_updateform.jsp</title>
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
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
			<jsp:param value="users" name="thisPage" />
	</jsp:include>
<div class="container">
	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do">홈</a></li>
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/users/mypage.do">마이페이지</a>
				 </li>	
				 <li class="breadcrumb-item active">비밀번호 수정</li>
			 </ol>
	</nav>
	<div class="col-4 offset-md-4">
	<h2>비밀번호 수정</h2>
	<br />
	<form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id=myForm>
		<div>
			<label class="control-label" for="pwd">기존 비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd" autofocus/>
		</div>
		<div>
			<label class="control-label" for="newPwd">새 비밀번호</label>
			<input class="form-control" type="password" name="newPwd" id="newPwd" />
		</div>
		<div>
			<label class="control-label" for="newPwd2">새 비밀번호 확인</label>
			<input class="form-control" type="password" name="newPwd2" id="newPwd2" />
		</div>
		<br />
		<button class="btn btn-outline-primary bi bi-check-lg" type="submit">완료</button>
		<button class="btn btn-outline-secondary" type="button" onclick="window.location.href='http://localhost:8888/lookat/users/mypage.do'">취소</button>
	</form>
</div>
</div>
<script>
	//폼에 submit이벤트가 일어났을 때 실행할 함수를 등록하고
	document.querySelector("#myForm").addEventListener("submit", function(e){
		let prePwd = document.querySelector("#pwd").value;
		let pwd1 = document.querySelector("#newPwd").value;
		let pwd2 = document.querySelector("#newPwd2").value;
		//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(prePwd==null){
			alert("기존 비밀번호를 입력하세요.")
			e.preventDefault(); //폼 전송 막기
		}else if(pwd1 != pwd2){
			alert("새 비밀번호를 확인하세요.")
			e.preventDefault(); //폼 전송 막기
		}
});
</script>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>