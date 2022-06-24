<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
	// 이 navbar.jsp 페이지가 어디에 include 되었는지 읽어와보기
	String thisPage = request.getParameter("thisPage"); // "home"|"shop"|"review"|"qna"|"notice"|"mypage"
%>
<style>
.dropdown-menu a.active{
	background-color:black;
	color: white;
}

	.navbar-brand{
		transition: transform 0.2s ease-out;
	}
	
	.navbar-brand:hover{
		transform: scale(1.1);
	}

.navbar-brand{
	transition: transform 0.2s ease-out;
}

.navbar-brand:hover{
	transform: scale(1.1);
}

</style>
<!-- navbar의 배경색이 밝은색 계열이면 navbar-light, 어두운색 계열이면 navbar-dark 클래스를 지정해놓으면 좋다. -->
<nav class="navbar navbar-light navbar-expand-md"
	style="background-color: white;">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/home.do">
			<img src="${pageContext.request.contextPath }/images/lookat_logo.jpg" alt="룩앳티켓" width="140" height="80" />
		</a>

		<!--
				bootstrap에서 data-bs-xxx 형태의 속성을 작성해야 하는 경우도 있다.
				해당속성을 잘 작성해야 UI가 어떤 동작을 하게 된다.
				data-bs-xxx="속성값" 여기에서 속성값은 정해진것을 그대로 작성해야 하는 경우도 있고,
				아니면 상황에 따라 적당한 값을 제공해야 할때도 있다.
				data-bs-target="선택자"
				선택자: 접었다 폈다할 대상을 선택할 선택자(css 선택자와 동일) 
			 -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav flex-glow-1">

				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("home") ? "active":"" %>" href="${pageContext.request.contextPath}/home.do">Home</a>
				</li>

				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("shop") ? "active":"" %>" href="${pageContext.request.contextPath}/shop/list.do">Ticket</a>
				</li>

				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("review") ? "active":"" %>"href="${pageContext.request.contextPath}/review/list.do">Review</a>
				</li>

				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("qna") ? "active":"" %>"href="${pageContext.request.contextPath}/qna/list.do">Q&A</a>
				</li>

				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("notice") ? "active":"" %>" href="${pageContext.request.contextPath}/notice/list.do">Notice</a>
				</li>
				
			</ul>
			
			<div class="w-100 clearfix">
				<c:choose>
					<c:when test="${empty sessionScope.id }">
						<a class="btn btn-outline-dark btn-sm float-end ms-1"
							href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a>
						<a class="btn btn-outline-dark btn-sm float-end ms-1"
							href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>
					</c:when>
					<c:otherwise>
						<a class="btn btn-outline-dark btn-sm float-end ms-1"
							href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a>
						<div class="btn-group float-end">
							<button class="btn btn-outline-dark btn-sm dropdown-toggle"
								type="button" id="dropdownBtn" data-bs-toggle="dropdown"
								aria-expanded="false">
								<strong>${id }</strong>님
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownBtn">
								<li><a class="dropdown-item <%=thisPage.equals("mypage") ? "active":"" %>" 
									href="${pageContext.request.contextPath }/users/mypage2.do">마이페이지</a></li>
									
								<li><a class="dropdown-item <%=thisPage.equals("booking") ? "active":"" %>" 
								href="${pageContext.request.contextPath }/users/bookingpage.do">예매내역</a></li>
								
								<c:if test="${id eq 'admin' }">
								<li><a class="dropdown-item <%=thisPage.equals("admin") ? "active":"" %>" 
								href="${pageContext.request.contextPath }/admin/list.do">관리자 전용</a></li>
								</c:if>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
</nav>
