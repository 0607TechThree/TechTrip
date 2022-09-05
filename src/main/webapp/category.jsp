<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 | techTrip</title>
<!--  favicon -->
<link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
<link rel="stylesheet" href="css/css.css" type="text/css">
<link rel="
	preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>
<body>
<tt:header/>

<div id="categorycontent">
	<div id="categoryhead">
		<h2 id="categorytitle">
			<c:choose>
				<c:when test="${searchresultr != null}">
					${searchresultr}지역
				</c:when>
				<c:when test="${searchresultn != null}">
					[${searchresultn}] 검색 결과
				</c:when>
				<c:otherwise>
					전체 상품 목록
				</c:otherwise>
			</c:choose>
		</h2>
	</div>
	<div id="categorylist">
		<c:if test="${datas.size()==0}">
			<div>목록이 존재하지 않습니다 ㅠㅅㅠ</div>
		</c:if>
		<c:forEach var="datas" items="${datas}">
		<div class="roomlistwrapper">
			<a href="troomselectone.do?trpk=${datas.trpk}">
				<img class="roomlist" alt="${datas.trname}상품사진" src="images/crawling/${datas.trpk}.jpg">
			</a>
			<div class="roomname">
				<div class="roomnametitle">
					${datas.trname}
				</div>
				<div>
					IN : ${datas.checkin}
						<br>
					OUT : ${datas.checkout}
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	
</div>

<tt:footer/>
<script type="text/javascript">
		
	</script>
</body>
</html>