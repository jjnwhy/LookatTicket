<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/shop/booking.jsp</title>
</head>
<body>
	<script>
    alert("예약을 완료하였습니다.");
    location.href="${pageContext.request.contextPath}/booking.do?num=${dto.num }";
	</script>

</body>
</html>