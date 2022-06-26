<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	#myForm {
  		display: justify-content: center;
 		align-items: center;
	}
	
	a:link, a:visited, a:active
	{
	    color: #000000;
	    text-decoration: none;
	}
	
	a:hover{
		color: highlight;
	}	
  	#regdateDiv{
  		display:none;
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
				 <li class="breadcrumb-item active">회원가입</li>
			 </ol>
		</nav>
		<div class="col-6 col-md-4 offset-md-4">
		<h1>회원 가입</h1>
		<br />
			<form class="row g-3" action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm">
				
				<div class="col-12">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" name="id" id="id" maxlength='10' autofocus/>
					<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small>
				   	<div class="invalid-feedback">사용할 수 없는 아이디 입니다</div>
				</div>
				<div class="col-12">
				   <label class="control-label" for="pwd">비밀번호</label>
				   <input class="form-control" type="password" name="pwd" id="pwd" maxlength='10'/>
				   <small class="form-text text-muted">최소 5글자, 최대 10글자로 입력하세요</small>
				   <div class="invalid-feedback">비밀번호를 확인 하세요</div>
				</div>
				<div class="col-12">
				   <label class="control-label" for="pwd2">비밀번호 확인</label>
				   <input class="form-control" type="password" name="pwd2" id="pwd2" maxlength='10'/>
				</div>
				<div class="col-12">
				   <label class="control-label" for="name">이름</label>
				   <input class="form-control" type="text" name="name" id="name"/>
				</div>
				<div class="col-md-3">
					<label class="control-label" for="addrNum">우편번호</label>
					<input class="form-control" type="text" name="addrNum" id="addrNum" maxlength='5'/>
					<div class="invalid-feedback">숫자5자리</div>
				</div>	
				<div class="col-md-9">
					<label class="control-label" for="addr">주소</label>	
					<input class="form-control" type="text" name="addr" id="addr"/>  		   
				</div>
				<div class="col-12">
				   <label class="control-label" for="birth">생년월일</label>
				   <input class="form-control" type="date" name="birth" id="birth" maxlength='10'/>
				   <small class="form-text text-muted">YYYY-MM-DD 형식으로 입력하세요</small>
				</div>
				<div class="col-12">
				   <label class="control-label" for="phone">전화번호</label>
				   <input class="form-control" type="text" name="phone" id="phone"/>
				   <small class="form-text text-muted">입력 예시: 010-1111-1111</small>
				</div>
				<div class="col-12">
				   <label class="control-label" for="email">이메일</label>
				   <input class="form-control" type="text" name="email" id="email"/>
				   <small class="form-text text-muted">이메일 형식에 맞게 입력하세요</small>
				</div>
				<div class="col-12" id="regdateDiv">
				   <label class="control-label" for="regdate" ></label>
				   <input class="form-control" type="hidden" name="regdate" id="regdate" />
				</div>
				<div class="col-12">
				<button class="btn btn-primary" type="submit">가입</button>
				<button class="btn btn-outline-secondary" type="button" onclick="location.href='${pageContext.request.contextPath}/'">취소</button>
				</div>
			</form>
			
		</div>
</div>	
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//아이디, 비밀번호, 이메일의 유효성 여부를 관리한 변수를 만들고 초기값 대입
	let isIdValid = false;
	let isPwdValid = false;
	let isEmailValid = false;
	let isAddrNumValid = false;
	let isphoneValid = false;
	
	//아이디를 입력했을 때(input) 실행할 함수 등록
	document.querySelector("#id").addEventListener("input", function(){
		//일단 is-valid, is-invalid 클래스를 제거한다.
		document.querySelector("#id").classList.remove("is-valid");
		document.querySelector("#id").classList.remove("is-invalid");
		
		//1.입력한 아이디 valid 값 읽어오기
		let inputId=this.value;
		//입력한 아이디를 검증할 정규 표현식
		const reg_id=/^[a-z].{4,9}$/; //영문자 소문자로 시작하고 5글자~10글자 이내로 입력
		//만일 입력한 아이디가 정규표현식과 매칭되지 않는다면 
		if(!reg_id.test(inputId)){
			isIdValid=false; //아이디가 매칭되지 않는다고 표시하고
			// is-invalid 클래스를 추가한다.
			document.querySelector("#id").classList.add("is-invalid");
			return; //함수를 여기서 끝낸다.(ajax 전송되지 않도록)
		}
		
		//2.util에 있는 함수를 이용해서 ajax 요청하기
		ajaxPromise("${pageContext.request.contextPath}/users/checkid.do", "get", "inputId="+inputId)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			//data 는 {isExist:true} or {isExist:false} 형태의 object 이다.
			if(data.isExist){//만일 존재한다면
				//사용할 수 없는 아이디라는 피드백을 보이게 한다. 
				isIdValid=false;
				// is-invalid 클래스를 추가한다. 
				document.querySelector("#id").classList.add("is-invalid");
			}else{
				isIdValid=true;
				document.querySelector("#id").classList.add("is-valid");
			}
		});
	});
	
	//비밀번호를 확인하는 함수
	function checkPwd(){
		document.querySelector("#pwd").classList.remove("is-valid");
		document.querySelector("#pwd").classList.remove("is-invalid");
		
		const pwd = document.querySelector("#pwd").value;
		const pwd2 = document.querySelector("#pwd2").value;
		
		//최소 5글자 최대 10글자인지를 검증할 표현식
		const reg_pwd=/^.{5,10}$/;
		if(!reg_pwd.test(pwd)){
			isPwdValid=false;
			document.querySelector("#pwd").classList.add("is-invalid");
			return; //함수를 여기서 종료
		}
		
		if(pwd!=pwd2){//비밀번호 확인란이 다르면
			//비밀번호를 잘못 입력한 것이다.	
			isPwdValid = false;
			document.querySelector("#pwd").classList.add("is-invalid");
		}else{
			isPwdValid = true;
			document.querySelector("#pwd").classList.add("is-valid");
		}
	}
	
	//비밀번호 입력란에 input 이벤트가 일어났을 때 실행할 함수 등록
	document.querySelector("#pwd").addEventListener("input", checkPwd);
	document.querySelector("#pwd2").addEventListener("input", checkPwd);
	
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
	
	//생년월일를 입력했을 때 실행할 함수 등록
	document.querySelector("#birth").addEventListener("input", function(){
		document.querySelector("#birth").classList.remove("is-valid");
		document.querySelector("#birth").classList.remove("is-invalid");
		
		//1.입력한 생년월일 읽어오기
		const inputBirth=this.value;
		//2.생년월일을 검증할 정규표현식 객체를 만들기
		const reg_birth=/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
		//3.정규표현식 매칭 여부에 따라 분기하기
		if(reg_birth.test(inputBirth)){
			isBirthValid = true;
			document.querySelector("#birth").classList.add("is-valid");
		}else{
			isBirthValid = false;
			document.querySelector("#birth").classList.add("is-invalid");
		}
	});
	
	//폼에 submit 이벤트가 발생했을 때 실행할 함수 등록
	document.querySelector("#myForm").addEventListener("submit", function(e){
		//console.log(e);
		/*
			입력한 아이디, 비밀번호, 이메일, 생년월일, 우편번호, 핸드폰번호의 유효성 여부를 확인해서 하나라도 유효하지 않으면 
			e.preventDefault();
			가 수행 되도록 해서 폼의 제출을 막아야 한다.
		*/
		//폼 전체의 유효성 여부 알아내기
		let isFormValid = isIdValid && isPwdValid && isEmailValid && isAddrNumValid && isBirthValid && isPhoneValid;
		if(!isFormValid){//폼이 유효하지 않으면
			//폼 전송막기
			e.preventDefault();
		}
	});
		
</script>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>