<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
			<h1><strong>${id } </strong>님의 예매내역.</h1>
			
			<c:choose>
				<c:when test="${list !=null }">
						<table class="table">
							<thead>
								<tr>
									<th>예매 번호</th>
									<th>상품 번호</th>
									<th>예약자ID</th>
									<th>예약 일자</th>
									<th>가격</th>
									<th>선택 좌석</th>
									<th>장소</th>
								</tr>
							</thead>
							<tbody>
					<c:forEach var="tmp" items="${list}">
								<tr>
									<td>${tmp.num }</td>
									<td>${tmp.shopNum}</td>
									<td>${tmp.id }</td>
									<td>${tmp.dday }		</td>
									<td>${tmp.price}</td>
									<td>${tmp.seatNum}</td>
									<td>${tmp.location}</td>
									<td><a href="${pageContext.request.contextPath}/booking/delete.do?num=${tmp.num }" onclick="return confirm('예매를 취소하시겠습니까?');">예매 취소하기</a></td>
								</tr>
					 </c:forEach>
							</tbody>
						</table>					
				<%--delete 링크에서 contextPath를 제거하고 링크를 달면 회원탈퇴가 되버리니 조심하세요.. --%>
				
				</c:when>
				<c:otherwise>
					예매 내역이 없어요. ( @.@ )
				</c:otherwise>
			</c:choose>

	
	</div>

		
</body>
</html>