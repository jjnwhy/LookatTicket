<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
   integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"    crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
   crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
   *{
      font-family: 'Nanum Gothic', sans-serif;
   }
   
   a:link, a:visited, a:active
   {
       color: #000000;
       text-decoration: none;
   }
   
   a:hover{
      color: highlight;
   }
   
   #insertform{
      width:50%;
   }
</style>
</head>
<body>
   <jsp:include page="/include/navbar.jsp">
      <jsp:param value="shop" name="thisPage" />
   </jsp:include>
   <div class="container">
      <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);">
       <ol class="breadcrumb">
          <li class="breadcrumb-item">
             <a href="${pageContext.request.contextPath}/home.do">홈</a></li>
          <li class="breadcrumb-item">
             <a href="${pageContext.request.contextPath}/shop/list.do">Ticket</a>
          </li>   
          <li class="breadcrumb-item active">상품추가</li>
       </ol>
      </nav>
      <br />
   <h2>상품 추가 폼</h2>
   <br />
   <form action="insert.do" method="post" id="insertform" enctype="multipart/form-data">
      <div>
         <label class="control-label" for="cateNum">카테고리 번호</label>
         <select class="form-select" name="cateNum" id="cateNum">
            <option value="1">1. 콘서트</option>
            <option value="2">2. 연극</option>
            <option value="3">3. 뮤지컬</option>
         </select>
        <!--  <input class="form-control" type="text" name="cateNum" id="cateNum" value=""/> -->
         
         <!-- <input type="text" name="cateNum" id="cateNum" placeholder="num"/>  -->
      </div>
      <div>
         <label class="control-label" for="name">상품명</label>
         <input class="form-control" type="text" name="name" id="name"/>
      </div>
      <div>
         <label class="control-label" for="price">가격</label>
         <input class="form-control" type="text" name="price" id="price" placeholder="ex. 100000"/>
      </div>
      <div>
         <label class="control-label" for="cast">출연</label>
         <input class="form-control" type="text" name="cast" id="cast"/>
      </div>
      <div>
         <label class="control-label" for="hours">관람 시간</label>
         <input class="form-control" type="text" name="hours" id="hours" placeholder="ex. 0시간"/>
      </div>
      <div>
         <label class="control-label" for="location">공연 장소</label>
         <input class="form-control" type="text" name="location" id="location"/>
      </div>
      <div>
         <label class="control-label" for="startdate">시작일</label>
         <input class="form-control" type="date" name="startdate" id="startdate" />
      </div>
      <div>

         <label class="control-label" for="enddate">종료일</label>
         <input class="form-control" type="date" name="enddate" id="enddate"/>
      </div>
      <div>
         <label class="control-label" for="remainCount">재고 개수</label>
         <input class="form-control" type="text" name="remainCount" id="remainCount"/>
      </div>
      <div>
         <label class="control-label" for="seatNum">좌석 번호</label>
         <input class="form-control" type="text" name="seatNum" id="seatNum"/>
      </div>
      <div>
         <label for="imageFile">이미지</label>
         <input class="form-control mb-2" type="file" name="imageFile" id="imageFile"
            accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
      </div>
      <br />
      <div>
         <button class="btn btn-primary" type="submit">저장</button>
      </div>
   </form>
   </div>
   <jsp:include page="/include/footer.jsp"></jsp:include>
<script>
$('input[name=cateNum]').attr('value',"(#option:selected).val()");
</script>
</body>
</html>