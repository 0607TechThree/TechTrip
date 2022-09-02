<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 상세정보 | techTrip</title>
<!--  favicon -->
<link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
<!--  css link -->
<link rel="stylesheet" href="css/css.css" type="text/css">
<!--  font setting -->
<link rel="
	preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
	<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmRXJ2n2XITfPx9iI8fUP8QpOjbUVx0uk&sensor=true"></script>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script type="text/javascript">
	function initialize() {

		var mapOptions = {
			zoom : 18, // 지도를 띄웠을 때의 줌 크기
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"
		mapOptions);

		var size_x = 40; // 마커로 사용할 이미지의 가로 크기
		var size_y = 40; // 마커로 사용할 이미지의 세로 크기

		// 마커로 사용할 이미지 주소
		var image = new google.maps.MarkerImage('주소 여기에 기입!',
				new google.maps.Size(size_x, size_y), '', '',
				new google.maps.Size(size_x, size_y));

		// Geocoding *****************************************************
		var address = '${data.traddress}'; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
		var marker = null;
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				marker = new google.maps.Marker({
					map : map,
					icon : image, // 마커로 사용할 이미지(변수)
					title : '${data.trname}', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
					position : results[0].geometry.location
				});

				var content = "${data.trname}"; // 말풍선 안에 들어갈 내용

				// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
				var infowindow = new google.maps.InfoWindow({
					content : content
				});
				google.maps.event.addListener(marker, "click", function() {
					infowindow.open(map, marker);
				});
			} else {
				alert("Geocode was not successful for the following reason: "
						+ status);
			}
		});
		// Geocoding // *****************************************************

	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
<tt:header />

<div id="roomdetailcontent">
	<div id="rctop">
		<div class="rctc">
			<img alt="${data.trname} 이미지" src="images/crawling/${data.trpk}.jpg">
		</div>
		<div class="rctc">
			<div>
				${data.trname}
			</div>
			<div>
				${data.trprice}
			</div>
			<div>
				날짜 (데이터피커)
			</div>
			<div>
				${data.traddress}
			</div>
			<div>
				사장님 한마디: ${data.trinfo}
			</div>
			<div>
				<c:if test="${data.trdel == 0}">
					<div>이미 예약된 상품입니다</div>
				</c:if>
				<c:if test="${data.trdel != 0}">
				<c:if test="${logininfo != null}">
					<c:set var="v" value="${cart}"/>
					<c:if test="${flag==true}">
						<a href="tcartinsert.do?trpk=${data.trpk}"><div class="insertcart">장바구니담기</div></a>				
					</c:if>
					<c:if test="${flag==false}">
						<div class="insertcart">장바구니담기</div>		
					</c:if>
				</c:if>
				<c:if test="${logininfo != null}">
					<c:if test="${data.trdel == 1}">
						<a href="tpay.do?trpk=${data.trpk}"><div>예약(결제)하기</div></a>
					</c:if>
					<c:if test="${wflag==true}">
						<a href="twishinsert.do?trpk=${data.trpk}&tupk=${logininfo.tupk}"><div>찜하기</div></a>
					</c:if>
					<c:if test="${wflag==false}">
						<a href="twishdelete.do?trpk=${data.trpk}&tupk=${logininfo.tupk}"><div>찜하기</div></a>
					</c:if>
				</c:if>
				<c:if test="${logininfo == null}">
					<a>예약(결제)하기</a>
					<a>찜하기</a>
				</c:if>
				</c:if>
			</div>
		</div>
	</div>
	<div id="rcbottom">
		<div id="rcbc">
			<div id="map-canvas" style="width: 100%; height: 340px"
				title="${data.trname} 위치입니다"></div>
		</div>
		<div>
			<h2>리뷰</h2>
			
			<c:if test="${trdatas.size() == 0}">작성한 글이 없습니다</c:if>
			
			<c:forEach var="v" items="${trdatas}">
				<c:set var="b" value="${v.treviewVO}" />
				<h3>
					[${b.tvpk}] ${b.tboard} 
				</h3>

				<div class="reply">
					<ul>
						<c:forEach var="r" items="${v.rList}">
							<li>[${r.tupk}] ${r.tpmsg} </li>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
	
<tt:footer />
	<script type="text/javascript">
	window.onpageshow = function (event) {
		if (event.persisted || (window.performance && (window.performance.navigation.type == 1 || window.performance.navigation.type == 2))) {
			// 현재 브라우저에서 WebStorage를 지원할 때
			location.href="troomselectone.do?trpk=${data.trpk}";
		}
	}
	</script>
</body>
</html>