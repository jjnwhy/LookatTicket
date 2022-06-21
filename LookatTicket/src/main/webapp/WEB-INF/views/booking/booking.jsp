<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/booking.jsp</title>
</head>
<body>
<!-- 동료 여러분들께서, 작업을 통해 request.setAttribute("dto", dto) -->
	<div class="container">
		<form action="${pageContext.request.contextPath}/views/booking/confirm.do?num=${dto.num}">
			<!-- 상품 -->
			<br />
			<!-- 일정 -->
			<br />
			<!-- 좌석 -->
			<br />
			<!-- 장소 -->
			<br />
			<!-- 예매번호 -->
			<button type="submit">확인</button>
		</form>
	</div>
</body>
</html>