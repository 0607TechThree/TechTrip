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
    <c:if test="${logininfo.turole == 'host'}">
	    <li><a href="hostregister.jsp">상품등록하기(HOST전용)</a></li>
    </c:if>
  </ul>
  <div id="fragment-1">
  <c:if test="${booklist.size() == 0}">
  		<div>예약목록이 존재하지 않습니다</div>
  </c:if>
  	<c:if test="${booklist.size() != 0}">
    <c:forEach var="booklist" items="${booklist}">
	   <div class="mytop">
			<div class="myleft">
				<a href="troomselectone.do?trpk=${booklist.trpk}">
				<img alt="${booklist.trname} 이미지" src="images/crawling/${booklist.trpk}.jpg" class="myimg">
				</a>
			</div>
			<div class="myright">
				<div class="myname">
					${booklist.trname}
				</div>
				<div class="mycheckinout">
					${booklist.checkin} ~ ${booklist.checkout}
				</div>
				
				<br>
				<div class="myprice">
					금액 : ${booklist.trprice} 원
				</div>
			</div>
			<div class="myrealright">
				<a href="">
					<button class="mygodetail" type="button">예약 취소</button>
				</a>
			</div>
		</div>
	</c:forEach>
		<h5 class="mymsg">* 예약 전날 취소 시 90%만 환불 받으실 수 있습니다</h5>
	</c:if>
  </div>
  <div id="fragment-2">
  	<c:if test="${wishroom.size() == 0}">
  		<div>찜 목록이 존재하지 않습니다</div>
  	</c:if>
  	<c:if test="${wishroom.size() != 0}">
    <c:forEach var="wr" items="${wishroom}">
	    <div class="mytop">
			<div class="myleft">
				<a href="troomselectone.do?trpk=${wr.trpk}">
				<img alt="${wr.trname} 이미지" src="images/crawling/${wr.trpk}.jpg" class="myimg">
				</a>
			</div>
			<div class="myright">
				<div class="myname">
					${wr.trname}
				</div>
				<div class="mycheckinout">
					${wr.checkin} ~ ${wr.checkout}
				</div>
				
				<br>
				<div class="myprice">
					금액 : ${wr.trprice} 원
				</div>
			</div>
			<div class="myrealright">	
				<a href="twishlocation.do?trpk=${wr.trpk}&tupk=${logininfo.tupk}" class="buttonatag"><img alt="찜하기" src="images/ht1.png" class="heartimg"></a>
			</div>
		</div>
    </c:forEach>
    <h5 class="mymsg">* 예약된 상품이어도 찜 목록에서 제외되지 않습니다</h5>
    </c:if>
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