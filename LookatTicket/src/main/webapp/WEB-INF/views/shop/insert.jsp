<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
    alert("상품을 등록하였습니다.");
    location.href="${pageContext.request.contextPath}/shop/list.do";
	</script>
</body>
</html>