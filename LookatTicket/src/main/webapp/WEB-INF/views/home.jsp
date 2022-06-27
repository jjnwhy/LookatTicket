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
 
</style>
</head>
<body>
<div class="container">
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="home" name="thisPage" />
</jsp:include>
	<%-- 
		포함시킬 jsp 페이지의 위치를 page 요소의 값으로 넣어준다.
		/ 는 webapp 폴더가 된다.
		이렇게 포함시키면 index.jsp 페이지와 navbar.jsp 페이지가 공동으로 클라이언트에게 응답을 하게된다.
		
		포함시킬 페이지에 파라미터를 전달할 수 있다.
		thisPage라는 파라미터명으로 index라는 문자열을 전달하는 방법은 아래와 같다.
		<jsp:param value="index" name="thisPage"/> -> 반드시 jsp:include의 자식요소로 쓰기!
		
	 --%>



<div id="concertCarousel" class="carousel slide" data-bs-ride="carousel">
  	<div class="carousel-inner">
  		<div class="carousel-item active">
			<img src="${pageContext.request.contextPath }/images/welcome_carousel.bmp" class="d-block w-100">
		</div>
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath }/${list[15].image}" class="d-block w-100" onclick="javascript:location.href='${pageContext.request.contextPath }/shop/detail.do?num=${list[15].num}'">
			<br />
			<div class="carousel-caption d-none d-md-block">
				<h5 style="color:black">${list[15].name }</h5>
				<p style="color:black"><strong>출연진: ${list[15].cast } <br /> 장소: ${list[15].location }</strong></p>
				<p style="color:black"><strong>일정: ${list[15].startdate }~${list[15].enddate} </strong></p>
			</div>
		</div>				
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath }/${list[16].image}" class="d-block w-100" onclick="javascript:location.href='${pageContext.request.contextPath }/shop/detail.do?num=${list[16].num}'">
			<br />
			<div class="carousel-caption d-none d-md-block">
				<h5>${list[16].name }</h5>
				<p>출연진: ${list[16].cast } <br /> 장소: ${list[16].location }</p>
				<p>일정: ${list[16].startdate }~${list[16].enddate} </p>
			</div>
		</div> 
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath }/${list[17].image}" class="d-block w-100" onclick="javascript:location.href='${pageContext.request.contextPath }/shop/detail.do?num=${list[17].num}'">
			<br />
			<div class="carousel-caption d-none d-md-block">
				<h5>${list[17].name }</h5>
				<p>출연진: ${list[17].cast } <br /> 장소: ${list[17].location }</p>
				<p>일정: ${list[17].startdate }~${list[17].enddate} </p>
			</div>
		</div>	
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#concertCarousel" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#concertCarousel" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	</button>
</div>
</div>

	<!--  
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach var="tmp" items="${list }" begin="5" end="7">
			<c:if test="${tmp.remainCount != 0 }">
				<div class="card" onclick="javascript:location.href='${pageContext.request.contextPath }/shop/detail.do?num=${tmp.num}'" padding="0">
			    	<div class="img-wrapper">
			    		<img src="${pageContext.request.contextPath }/${tmp.image}" class="card-img-top" height="300">
			    	</div>
			    	<div class="card-body">
				    	<h5 class="card-title" style="text-align:center;">${tmp.name }</h5>
				      	<p class="card-text">출연진: ${tmp.cast } <br /> 장소: ${tmp.location }</p>
		    		</div>
		    		<div class="card-footer">
		      			<small class="text-muted">일정: ${tmp.startdate }~${tmp.enddate }</small>
		    		</div>
				</div>
			</c:if>	
		</c:forEach>
</div>
</div>

-->



<jsp:include page="/include/footer.jsp"></jsp:include>
<script>
   // card 이미지의 부모 요소를 선택해서 imgLiquid  동작(jquery plugin 동작) 하기 
  // $(".img-wrapper").imgLiquid();
   

   
</script> 
</body>
</html>