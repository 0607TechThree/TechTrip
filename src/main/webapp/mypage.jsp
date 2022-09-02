<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>마이페이지 | techTrip</title>
  <!-- favicon -->
  <link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
<link rel="stylesheet" href="css/css.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<link rel="
	preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>
<body>
<tt:header/>
<div id="tabs">
  <ul id="tabsul">
    <li id="tabsmain"><a href="#fragment-1"><span>예약확인</span></a></li>
    <li><a href="#fragment-2"><span>찜 목록 보기</span></a></li>
    <li><a href="#fragment-3"><span>회원정보 수정</span></a></li>
    <li><a href="#fragment-4"><span>내가 작성한 리뷰 보기</span></a></li>
    <c:if test="${logininfo.turole == host}">
	    <li><a href="#fragment-5"><span>HOST 전용 상품관리</span></a></li>
    </c:if>
  </ul>
  <div id="fragment-1">
    <c:forEach var="booklist" items="${booklist}">
	    <div class="">
    		${booklist.trname}<br>
	    	${booklist.trprice}<br>
	    </div>
    	<div>
    		예약 취소하기
 	   	</div>
	</c:forEach>
  </div>
  <div id="fragment-2">
    <c:forEach var="wr" items="${wishroom}">
	    <div>
    		<div>
    			${wr.trname}
    		</div>
	    </div>
    	<div>
    		찜 취소하기
	    </div>
    </c:forEach>
  </div>
  <div id="fragment-3">
	<div>
    	${logininfo.tuid}
    	${logininfo.tuph}
    </div>
  </div>
  <div id="fragment-4">
	<div>
		리뷰목록
	</div>
  </div>
  <c:if test="${logininfo.turole == host}">
  <div id="fragment-5">
	<div>
		관리자 전용 목록
	</div>
  </div>
  </c:if>
</div>
<tt:footer/>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $(document).ready(function() {
    $( "#tabs" ).tabs();
    $("#tabsmain").trigger("click");
  } );
  </script>
</body>
</html>