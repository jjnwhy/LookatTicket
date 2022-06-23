<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" 	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	th, td{
		text-align: center;
	}
	
	.loader{
		/* 로딩 이미지를 가운데 정렬하기 위해 */
		text-align: center;
		/* 일단 숨겨 놓기 */
		display: none;
	}	
	
	.loader svg{
		animation: rotateAni 1s ease-out infinite;
	}
	
	@keyframes rotateAni{
		0%{
			transform: rotate(0deg);
		}
		100%{
			transform: rotate(360deg);
		}
	}
</style>
</head>
<body>
	
	<table class="table">
			<caption align="top">회원 관리</caption>
			<thead>
				<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>주소</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>email</th>
				<th>가입일</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.id }</td>
						<td>${tmp.name }</td>
						<td>(${tmp.addrNum }) ${tmp.addr }</td>
						<td>${tmp.birth }</td>
						<td>${tmp.phone }</td>
						<td>${tmp.email }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	
</body>
