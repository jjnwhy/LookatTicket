<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	#myTable{
		width:60%;
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
		<jsp:param value="notice" name="thisPage" />
	</jsp:include>
	
	<div class="container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do">홈</a></li>
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/notice/list.do">Notice</a></li>
				 <li class="breadcrumb-item active">${dto.title }</li>
			 </ol>
		</nav>
		<c:if test="${dto.prevNum ne 0 }">
			<a
				href="detail.do?num=${dto.prevNum }&keyword=${encodedK }&condition=${condition }">이전글</a>
		</c:if>
		<c:if test="${dto.nextNum ne 0 }">
			<a
				href="detail.do?num=${dto.nextNum }&keyword=${encodedK }&condition=${condition }">다음글</a>
		</c:if>
		<c:if test="${ not empty keyword }">
			<p>
				<strong>${condition }</strong> 조건, <strong>${keyword }</strong> 검색어로
				검색된 내용 자세히 보기
			</p>
		</c:if>
		
		<table class="table" id="myTable">
		<colgroup>
			<col style="width:20%">
			<col style="width:40%">
		</colgroup>
			<tr>
				<th>글번호</th>
				<td>${dto.num }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.writer }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${dto.viewCount }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${dto.regdate }</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="content">${dto.content }</div>
				</td>
			</tr>
		</table>
		
			<li><a href="list.do">목록보기</a></li>
			<c:if test="${id eq 'admin' }">
				<li><a href="updateform.do?num=${dto.num }">수정</a></li>
				<li><a href="delete.do?num=${dto.num }">삭제</a></li>
			</c:if>
				<!-- 아이디가 admin일 경우
			<c:if test="${dto.writer eq id }">
				<li><a href="updateform.do?num=${dto.num }">수정</a></li>
				<li><a href="delete.do?num=${dto.num }">삭제</a></li>
			</c:if>  -->

	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>