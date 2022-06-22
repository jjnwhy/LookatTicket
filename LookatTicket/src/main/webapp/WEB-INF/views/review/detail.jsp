<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/review/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	#myTable, #myTable2{
		width: 70%;
	}
	
	.content{
		text-align: left;
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
		<jsp:param value="review" name="thisPage" />
	</jsp:include>
<div class="container">
	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
		 <ol class="breadcrumb">
			 <li class="breadcrumb-item">
			 	<a href="${pageContext.request.contextPath}/home.do">Home</a></li>
			 <li class="breadcrumb-item">
			 	<a href="${pageContext.request.contextPath}/review/list.do">Review</a>
			 </li>	
			 <li class="breadcrumb-item active">${dto.title }</li>
		 </ol>
	</nav>
	
	<table class="table" id="myTable" align="center">
		<colgroup>
			<col style="width:20%">
			<col style="width:30%">
			<col style="width:20%">
			<col style="width:30%">
		</colgroup>
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
			<th>상품 번호</th>
			<td>shopNum</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
			<th>조회수</th>
			<td>${dto.viewCount }</td>
		</tr>
		<tr>
			<th>좋아요 수</th>
			<td id="likeCount">${dto.likeCount }</td>
			<th>등록일</th>
			<td>${dto.regdate }</td>
		</tr>
		<table class="table" id="myTable2" align="center">
		<col style="width:20%">
		<col style="width:80%">
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="content">${dto.content }</div>
			</td>
		</tr>
		</table>
		<p>
			<c:if test="${dto.prevNum ne 0 }">
				<a href="detail.do?num=${dto.prevNum }&keyword=${encodedK}&condition=${condition}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-left-fill" viewBox="0 0 16 16">
  <path d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
</svg>이전글</a>
			</c:if>
			<c:if test="${dto.nextNum ne 0 }">
				<a href="detail.do?num=${dto.nextNum }&keyword=${encodedK}&condition=${condition}">다음글<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
</svg></a>
			</c:if>
			<c:if test="${ not empty keyword }">
				<p>
					<strong>${condition }</strong> 조건,
					<strong>${keyword }</strong> 검색어로 검색된 내용 자세히 보기
				</p>
			</c:if>
		</p>
		</table>
	<div>
	<a href="list.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M14.5 1.5a.5.5 0 0 1 .5.5v4.8a2.5 2.5 0 0 1-2.5 2.5H2.707l3.347 3.346a.5.5 0 0 1-.708.708l-4.2-4.2a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 8.3H12.5A1.5 1.5 0 0 0 14 6.8V2a.5.5 0 0 1 .5-.5z"/>
</svg>목록보기</a>
		<c:if test="${dto.writer eq id }">
			<a href="updateform.do?num=${dto.num }">수정</a>
			<a href="delete.do?num=${dto.num }">삭제</a>
		</c:if>
	</div>
	<br />
	<button class="btn btn-primary" id="likeBtn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
</svg>좋아요</button>
</div>

<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	document.querySelector("#likeBtn").addEventListener("click" , function(){
		//좋아요 카운트를 올릴 글번호
		const num=${dto.num};
		//ajax 요청으로 해당 글 번호를 서버에 전달한다.
		ajaxPromise("${pageContext.request.contextPath}/review/like.do", "get", "num="+num)
		.then(function(res){
			return res.json();
		})
		.then(function(data){
			console.log(data);
			document.querySelector("#likeCount").innerText=data.likeCount;
		});
	});
	
</script>

	<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>