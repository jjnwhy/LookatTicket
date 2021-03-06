<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/qna/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}

	.breadcrumb-item > a:link, a:visited, a:active{
		color: #000000;
	    text-decoration: none;
	}
	
	.container > a:link, a:visited, a:active{
		color: #000000;
	    text-decoration: none;
	}
	
	a:hover{
		color: highlight;
	}

	.page-ui a{
		text-decoration: none;
		color: #000;
	}
	
	.page-ui a:hover{
		text-decoration: underline;
	}
	
	.page-ui a.active{
		color: red;
		font-weight: bold;
		text-decoration: underline;
	}
	.page-ui ul{
		list-style-type: none;
		padding: 0;
	}
	
	.page-ui ul > li{
		float: left;
		padding: 5px;
	}
	
	th, td{
		text-align:center;
	}
	
	td > a:link, a:visited, a:active{
		color: #000000;
	    text-decoration: none;
	}
	
	.container > a:link, a:visited, a:active{
		color: #000000;
	    text-decoration: none;
	}
	
	#write{
			float: right;
	}
</style>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="qna" name="thisPage" />
</jsp:include>
<div class="container">
	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
			 <ol class="breadcrumb">
				 <li class="breadcrumb-item">
				 	<a href="${pageContext.request.contextPath}/home.do">Home</a></li>
				 <li class="breadcrumb-item active">Q&A</li>
			 </ol>
	</nav>
	<br />
	<h2>Q&A ??????</h2>
	<div class="container">
		<a href="insertform.do" id="write">????????? ?????? <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="blue" class="bi bi-pencil-square" viewBox="0 0 16 16">
		  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
		  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
		</svg></a>
		</div>
	<br />
	<table class=table>
		<thead>
			<tr>
				<th>?????????</th>
				<th>?????????</th>
				<th width="45%">??????</th>
				<th>?????????</th>
				<th>?????????</th>
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
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="page-ui clearfix">
		<ul class="pagination" style="justify-content:center;">
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
					<a class="page-link" href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<div style="clear:both;"></div>
	
	<form class="row g-3" action="list.do" method="get" style="justify-content:center;"> 
	<div class="col-md-2">
		<select class="form-select" name="condition" id="condition">
			<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>??????+??????</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>??????</option>
			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>?????????</option>
		</select>
		</div>
	<div class="col-md-2">	
		<input class="form-control" type="text" id="keyword" name="keyword" placeholder="?????????..." value="${keyword }"/>
	</div>
	<div class="col-md-2">	
		<button type="submit" class="btn btn-primary">??????</button>
	</div>	
	</form>	
	<c:if test="${ not empty condition }">
		<p>
			<strong>${totalRow }</strong> ?????? ?????? ?????? ???????????????.
		</p>
	</c:if>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>












