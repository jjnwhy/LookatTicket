<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/pwd_updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
<div class="row">
	<div class="col-12 col-md-6 offset-md-3">
	<h1>비밀번호 수정 폼</h1>
	<form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id=myForm>
		<div>
			<label for="pwd">기존 비밀번호</label>
			<input type="password" name="pwd" id="pwd" />
		</div>
		<div>
			<label for="newPwd">새 비밀번호</label>
			<input type="password" name="newPwd" id="newPwd" />
		</div>
		<div>
			<label for="newPwd2">새 비밀번호 확인</label>
			<input type="password" name="newPwd2" id="newPwd2" />
		</div>
		<button type="submit">수정하기</button>
		<button type="reset">되돌리기</button>
	</form>
</div>
</div>
<script>
	//폼에 submit이벤트가 일어났을 때 실행할 함수를 등록하고
	document.querySelector("#myForm").addEventListener("submit", function(e){
		let pwd1 = document.querySelector("#newPwd").value;
		let pwd2 = document.querySelector("#newPwd2").value;
		//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(pwd1 != pwd2){
			alert("비밀번호를 확인 하세요.")
			e.preventDefault(); //폼 전송 막기
		}
	});
</script>
</body>
</html>