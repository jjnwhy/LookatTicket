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
		float: right;
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
				 <li class="breadcrumb-item active">Notice</li>
			 </ol>
	</nav>
	<h2>공지사항</h2>
		<c:if test="${id eq 'admin' }">
		<a href="insertform.do" id="write">글 작성</a>
		</c:if>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
					<c:if test="${id eq 'admin' }">
					<th>삭제</th></c:if>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.num }</td>
						<td>
							<a href="detail.do?num=${tmp.num }&keyword=${encodedK }&condition=${condition}">${tmp.title }</a>
						</td>
						<td>${tmp.writer }</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
						<c:if test="${id eq 'admin' }">
						<td><a href="delete.do?num=${tmp.num }">X</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="page-ui clearfix">
			<ul>
				<c:if test="${startPageNum ne 1 }">
					<li><a
						href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li><c:choose>
							<c:when test="${pageNum eq i }">
								<a class="active"
									href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
							</c:when>
							<c:otherwise>
								<a
									href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li><a
						href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<div style="clear: both;"></div>

		<form action="list.do" method="get">
			<label for="condition">검색조건</label> <select name="condition"
				id="condition">
				<option value="title_content"
					${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
				<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
				<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
			</select> <input type="text" id="keyword" name="keyword" placeholder="검색어..."
				value="${keyword }" />
			<button type="submit">검색</button>
		</form>
		<c:if test="${ not empty condition }">
			<p>
				<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
			</p>
		</c:if>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>