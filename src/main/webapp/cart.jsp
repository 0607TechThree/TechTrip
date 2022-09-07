<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 | techTrip</title>
<!--  favicon -->
<link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
<!--  css link -->
<link rel="stylesheet" href="css/css.css" type="text/css">
<!--  font setting -->
<link rel="
	preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">


</head>
<body>
	<tt:header />
	
	<div id="cartwrap">
		<div id="carttitle">
			<h2>장바구니 목록</h2>
		</div>
		<div>
			<c:if test="${cartlist.size() != 0}">
			<c:forEach var="cartlist" items="${cartlist}">
				<div id="carttop">
					<div id="cartleft">
						<img alt="${cartlist.trname} 이미지" src="images/crawling/${cartlist.trpk}.jpg" id="payimg">
					</div>
					<div id="cartright">
						<div id="cartname">
							${cartlist.trname}
						</div>
						<div class="cartcheckinout">
							체크인 날짜 : ${cartlist.checkin}
						</div>
						<div class="cartcheckinout">
							체크아웃 날짜 : ${cartlist.checkout}
						</div>
						<br>
						<div id="cartprice">
							금액 : ${cartlist.trprice} 원
						</div>
						<div>
							<a href="troomselectone.do?trpk=${cartlist.trpk}">
								<button id="cartgodetail" type="button">상세페이지 보기</button>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
			<c:if test="${cartlist.size() == 0}">
				<div id="nonecart">
					<h3>현재 장바구니 목록이 존재하지 않습니다!</h3>
				</div>
			</c:if>
		</div>
	</div>
	<tt:footer />

	<script type="text/javascript">
	
	</script>
</body>
</html>