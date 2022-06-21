<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/review/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" 	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="review" name="thisPage" />
	</jsp:include>
<div class="container">
	<c:if test="${dto.prevNum ne 0 }">
		<a href="detail.do?num=${dto.prevNum }&keyword=${encodedK}&condition=${condition}">이전글</a>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
		<a href="detail.do?num=${dto.nextNum }&keyword=${encodedK}&condition=${condition}">다음글</a>
	</c:if>
	<c:if test="${ not empty keyword }">
		<p>
			<strong>${condition }</strong> 조건,
			<strong>${keyword }</strong> 검색어로 검색된 내용 자세히 보기
		</p>
	</c:if>
	<table>
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
		</tr>
		<tr>
			<th>상품 번호</th>
			<td>shopNum</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.viewCount }</td>
		</tr>
		<tr>
			<th>좋아요 수</th>
			<td>${tmp.likeCount }</td>
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

	<ul>
		<li><a href="list.do">목록보기</a></li>
		<c:if test="${dto.writer eq id }">
			<li><a href="updateform.do?num=${dto.num }">수정</a></li>
			<li><a href="delete.do?num=${dto.num }">삭제</a></li>
		</c:if>
		<c:if test="${dto.writer ne id }">
			<button <a href="like.do?num=${dto.num }">좋아요</a>></button>
		</c:if>
	</ul>

</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>