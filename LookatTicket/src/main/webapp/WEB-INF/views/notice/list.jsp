<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" 	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	th, td{
		text-align: center;
	}
	
	#write{
		float: relative;
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
					 	<a href="${pageContext.request.contextPath}/home.do">Home</a></li>
					 <li class="breadcrumb-item active">Notice</li>
				 </ol>
		</nav>
		<br />
			<div class="container">
				<h2>공지사항  <c:if test="${id eq 'admin' }">
						<a href="insertform.do" id="write"><svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="blue" class="bi bi-pencil-square" viewBox="0 0 16 16">
						  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
						  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
						</svg></a>
				</c:if></h2>
				<br />
			</div>
		<div class="container">
			<table class="table" align="center">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th width="40%">제목</th>
						<th>조회수</th>
						<th>등록일</th>
						<c:if test="${id eq 'admin' }">
						<th>삭제</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${list }">
						<tr>
							<td>${tmp.num }</td>
							<td>${tmp.writer }</td>
							<td>
								<a href="detail.do?num=${tmp.num }&keyword=${encodedK }&condition=${condition}">${tmp.title }</a>
							</td>
							<td>${tmp.viewCount }</td>
							<td>${tmp.regdate }</td>
							<c:if test="${id eq 'admin' }">
							<td><a href="delete.do?num=${tmp.num }" onclick="return confirm('공지사항을 삭제하시겠습니까?');"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
	  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
	  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
	</svg></a>				</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<div class="container">
			<div class="page-ui clearfix"> 
			<ul class="pagination" style="justify-content:center;">
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
					<a class="page-link" href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
					<li class="page-item"><a class="page-link"
						href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageNum eq i }">
								<a class="page-link" class="active"
									href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
							</c:when>
							<c:otherwise>
								<a class="page-link"
									href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
					<li class="page-item"><a class="page-link"
						href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		</div>
		<div class="container">
			<form class="row g-3" action="list.do" method="get" style="justify-content:center;">
				<div class="col-md-2"> 
					<select class="form-select" name="condition" id="condition">
						<option value="title_content"
							${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
						<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
					</select>
				</div>	
				<div class="col-md-2">		 
					<input class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어..."
						value="${keyword }" />
				</div>
				<div class="col-md-2">		
					<button class="btn btn-primary" type="submit">검색</button>
				</div>
		</div>		
			</form>
			<c:if test="${ not empty condition }">
				<p>
					<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
				</p>
			</c:if>
	</div>
	</div>
	</div>	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>