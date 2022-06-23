<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>상품 추가 폼</h1>
	<form action="insert.do" method="post" id="insertform">
		<div>
			<label for="cateNum">카테고리명</label>
			<input type="text" name="cateNum" id="cateNum" />
		</div>
		<div>
			<label for="name">상품명</label>
			<input type="text" name="name" id="name"/>
		</div>
		<div>
			<label for=""></label>
		</div>
	</form>
</div>

</body>
</html>