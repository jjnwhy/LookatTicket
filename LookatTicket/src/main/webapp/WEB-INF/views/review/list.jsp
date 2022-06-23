<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/view/review/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	#write{
			float: right;
	}
	
	th, td{
		text-align: center;
	}
	
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="review" name="thisPage" />
	</jsp:include>
	<div class="container">
	<a href="insertform.do">후기작성</a>
	<h1>후기 목록</h1>
	<table class="table table-hover">

	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do">홈</a></li>
				 <li class="breadcrumb-item active">Review</li>
			 </ol>
	</nav>
	<h2>후기 목록</h2>
	<a href="insertform.do" id="write">후기작성</a>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>상품번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>등록일</th>
				<<c:if test="${id eq 'admin' }">
				<th>삭제</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>shopNum</td>
				<td>${tmp.writer }</td>
				<td>
					<a href="detail.do?num=${tmp.num }&keyword=${encodedK }&condition=${condition}">${tmp.title }</a>
				</td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.likeCount }</td>
				<td>${tmp.regdate }</td>
				<c:if test="${id eq 'admin' }">
				<td><a href="delete.do?num=${tmp.num }">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
					  <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
					</svg>
				</a></td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
		<ul class="pagination" >
			<c:if test="${startPageNum ne 1 }">
				<li class="page-item">
					<a class="page-link" href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li class="page-item">
					<c:choose>
						<c:when test="${pageNum eq i }">
							<a class="page-link" class="active" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount }">
				<li class="page-item">
					<a class="page-link" href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
				</li>
			</c:if>	
		</ul>
	
	
	<div style="clear:both;"></div>
	
	<form class="row g-3" action="list.do" method="get">
	<div class="col-md-3">
		<select class="form-select" name="condition" id="condition">
			<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
		</select>

	</div>
	<div class="col-md-7">	
		<input class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }" />
	</div>
	<div class="col-md-2">	
		<button type="submit" class="btn btn-primary">검색</button>
	</div>

	</form>
	<c:if test="${not empty condition }">
		<p>
			<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
		</p>
	</c:if>
	</div>
		<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>