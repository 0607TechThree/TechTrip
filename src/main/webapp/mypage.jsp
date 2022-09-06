<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>마이페이지 | techTrip</title>
  <style type="text/css">
div[class^=rating_type] .starrat {
    display: inline-block;
    width: 75px;
    height: 13px;
    background: url(images/sp_star.gif) no-repeat 0 0;
    text-align: left;
    vertical-align: middle;
}
div[class^=rating_type] .starrat em {
    display: block;
    height: 12px;
    background: url(images/sp_star.gif) no-repeat 0 -19px;
    text-indent: -9999px;
}
</style>
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
    <li><a href="#fragment-3"><span>회원정보</span></a></li>
    <li><a href="#fragment-4"><span>내가 작성한 리뷰 보기</span></a></li>
    <c:if test="${logininfo.turole == 'host'}">
		<li><a href="#fragment-5"><span>HOST전용</span></a></li>
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
				<a href="tbookdelete.do?trpk=${booklist.trpk}">
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
				<a href="twishdelete.do?trpk=${wr.trpk}&tupk=${logininfo.tupk}" class="buttonatag"><img alt="찜하기" src="images/ht1.png" class="heartimg"></a>
			</div>
		</div>
    </c:forEach>
    <h5 class="mymsg">* 예약된 상품이어도 찜 목록에서 제외되지 않습니다</h5>
    </c:if>
  </div>
  	<div id="fragment-3">
		<div id="joincontentbox">	
			<form action="tuserupdate.do" method="post" name="userInfo" id="joinform">
				<table>
					<tr>
						<td class="jointabletitle"><div>아이디</div></td>
						<td><input name="tuid" class="mypageinfoform"
							readonly value="${logininfo.tuid}">
					</tr>
					<tr>
						<td class="jointabletitle"><div>비밀번호</div></td>
						<td><input type="password" name="tupw"  class="mypageinfoform"
							readonly value="${logininfo.tupw}"></td>
					</tr>
					<tr class="tablebordertop">
						<td class="jointabletitle"><div>닉네임</div></td>
						<td><input required  class="mypageinfoform" name="tunickname"
							placeholder="닉네임을 입력해주세요" value="${logininfo.tunickname}"></td>
					</tr>
					<tr class="tablebordertop">
						<td class="jointabletitle"><div>휴대폰</div></td>
						<td><input readonly class="mypageinfoform" name="tuph" id="userh"
							value="${logininfo.tuph}"></td>
					</tr>
					<tr class="tablebordertop">
						<td></td>
						<td>
							<input type="text" class="mypageinfoform" name="tuaddresszipcode"
							placeholder="우편번호" readonly value="${logininfo.tuaddresszipcode}">
							
						</td>
					<tr>
						<td class="jointabletitle"><div>주 소</div></td>
						<td>
							<input type="text" name="tuaddress"
							class="mypageinfoform" readonly value="${logininfo.tuaddress}">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>	
							<input name="tuaddressdetail"
							type="text" class="mypageinfoform" value="${logininfo.tuaddressdetail}" readonly>
						</td>
					</tr>
					<tr class="tablebordertop">
						<td class="jointabletitle"><div>생년월일</div></td>
						<td><input type="text" class="mypageinfoform" name="tubirth" value="${logininfo.tubirth}"></td>
					</tr>
					<tr class="tablebordertop">
						<td class="jointabletitle">성별</td>
						<td><input type="text" name="tugender" value="${logininfo.tugender}"
						class="mypageinfoform" readonly>
						</td>
					</tr>
					<tr class="tablebordertop">
						<td class="jointabletitle">국적</td>
						<td><input type="text" name="tunation" value="${logininfo.tunation}"
						class="mypageinfoform" readonly></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<br>
							<center>
							<input type="submit" value="수정하기">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
  
  <div id="fragment-4">
  	<c:if test="${reviewlist.size() == 0}">
  		<div>작성한 리뷰가 존재하지 않습니다</div>
  	</c:if>
  	<c:if test="${reviewlist.size() != 0}">
		<c:forEach var="v" items="${reviewlist}">
			<c:set var="b" value="${v.treviewVO}" />
			<h3>
				내용 : ${b.tboard} <div class="rating_type"><span class="starrat"><em style="width:${b.tstar*10}%">별점</em></span></div>
			</h3>
			<div class="reply">
				<ul>
					<c:forEach var="r" items="${v.rList}">
						<li>[${r.tupk}] ${r.tpmsg} </li>
					</c:forEach>
				</ul>
			</div>
		</c:forEach>
  	</c:if>
	</div>
	<c:if test="${logininfo.turole == 'host'}">
  	<div id="fragment-5">
 		<a href="hostregister.jsp" id="hosthref"><div id="hostbox">+ 상품 등록하기</div></a>
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