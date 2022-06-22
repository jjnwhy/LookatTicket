<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.navbar-brand{
		transition: transform 0.2s ease-out;
	}
	
	.navbar-brand:hover{
		transform: scale(1.1);
	}
</style>
</head>
<body>

	<%--
		포함시킬 jsp 페이지의 위치를 page 요소의 값으로 넣어준다.
		/ 는 webapp 폴더가 된다.
		이렇게 포함시키면 index.jsp 페이지와 navbar.jsp 페이지가 공동으로 클라이언트에게 응답을 하게된다.
		
		포함시킬 페이지에 파라미터를 전달할 수 있다.
		thisPage라는 파라미터명으로 index라는 문자열을 전달하는 방법은 아래와 같다.
		<jsp:param value="index" name="thisPage"/> -> 반드시 jsp:include의 자식요소로 쓰기!
		
	 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="home" name="thisPage" />
	</jsp:include>

	<div class="container">
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath }/images/lookat_foot.jpg" class="d-block w-100" width="600" height="400">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath }/images/lookat_foot.jpg" class="d-block w-100" width="600" height="400">
    </div>
    
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div class="card-group">
  <div class="card">
    <img src="${pageContext.request.contextPath }/images/lookat_foot.jpg" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title" style="text-align:center;">오늘의 추천 콘서트</h5>
      <p class="card-text">출연진: 마동석, 손석구 <br /> 간단한 줄거리: 안녕하세요.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">일정: 2022-07-07</small>
    </div>
  </div>
  <div class="card">
    <img src="${pageContext.request.contextPath }/images/lookat_foot.jpg" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>
  <div class="card">
    <img src="${pageContext.request.contextPath }/images/lookat_foot.jpg" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>
</div>
	</div>
	
	

	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>