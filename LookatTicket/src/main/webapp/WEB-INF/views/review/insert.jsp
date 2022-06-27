<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/review/insert.jsp</title>
</head>
<body>
	<script>
		alert("새 리뷰가 추가되었습니다.")
		location.href="${pageContext.request.contextPath}/review/list.do";
	</script>
</body>
</html>