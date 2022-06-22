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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="home" name="thisPage" />
	</jsp:include>
<div class="row">
		<div class="col-8 col-md-4 offset-md-4">
		<h1>가입정보 수정</h1>
		<br />
		<form action="${pageContext.request.contextPath}/users/update.do" method="post" id="myForm">
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
			<br />
			<button class="btn btn-outline-primary" type="submit">확인</button>
			<button class="btn btn-outline-secondary" type="reset">되돌리기</button>
		</form>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//이메일, 우편번호, 핸드폰번호의 유효성 여부를 관리할 변수를 만들고 초기값 대입
	let isEmailValid = false;
	let isAddrNumValid = false;
	let isphoneValid = false;
	
	//이메일을 입력했을 때 실행할 함수 등록
	document.querySelector("#email").addEventListener("input",function(){
		document.querySelector("#email").classList.remove("is-valid");
		document.querySelector("#email").classList.remove("is-invalid");
		
		//1. 입력한 이메일을 읽어와서
		const inputEmail=this.value;
		//2. 이메일 검증할 정규 표현식 객체를 만들어서
		const reg_email=/@/;
		//3. 정규표현식 매칭 여부에 따라 분기하기
		if(reg_email.test(inputEmail)){//만일 매칭된다면
			isEmailValid = true;
			document.querySelector("#email").classList.add("is-valid");
		}else{
			isEmailValid=false;
			document.querySelector("#email").classList.add("is-invalid");
		}
	});
	
	//우편번호를 입력했을 때 실행할 함수 등록
	document.querySelector("#addrNum").addEventListener("input", function(){
		document.querySelector("#addrNum").classList.remove("is-valid");
		document.querySelector("#addrNum").classList.remove("is-invalid");
		
		//1.입력한 우편번호 읽어오기
		const inputAddrNum=this.value;
		//2.우편번호를 검증할 정규표현식 객체를 만들기
		const reg_addrNum=/[0-9]/g;
		//3.정규표현식 매칭 여부에 따라 분기하기
		if(reg_addrNum.test(inputAddrNum)){
			isAddrNumValid = true;
			document.querySelector("#addrNum").classList.add("is-valid");
		}else{
			isAddrNumValid = false;
			document.querySelector("#addrNum").classList.add("is-invalid");
		}
	});
	
	//핸드폰번호를 입력했을 때 실행할 함수 등록
	document.querySelector("#phone").addEventListener("input", function(){
		document.querySelector("#phone").classList.remove("is-valid");
		document.querySelector("#phone").classList.remove("is-invalid");
		
		//1.입력한 핸드폰번호 읽어오기
		const inputPhone=this.value;
		//2.핸드폰번호를 검증할 정규표현식 객체를 만들기
		const reg_phone=/^\d{3}-\d{3,4}-\d{4}$/;
		//3.정규표현식 매칭 여부에 따라 분기하기
		if(reg_phone.test(inputPhone)){
			isPhoneValid = true;
			document.querySelector("#phone").classList.add("is-valid");
		}else{
			isPhoneValid = false;
			document.querySelector("#phone").classList.add("is-invalid");
		}
	});

</script>		
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>