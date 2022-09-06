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
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmRXJ2n2XITfPx9iI8fUP8QpOjbUVx0uk&sensor=true"></script>
<script src="jquery.rating.js" type="text/javascript" language="javascript"></script>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
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
				<div id="rctcname">
					${data.trname}
				</div>
				<div id="rctcprice">
					${data.trprice}원
				</div>
				<div id="rctccheckinout">
					${data.checkin} ~ ${data.checkout}
				</div>
				<div id="rctcaddress">
					주소 : ${data.traddress}
				</div>
				<div id="rctcinfo">
					사장님 한마디: ${data.trinfo}
				</div>
			</div>
			<div id="rctcbottom">
				<c:if test="${data.trdel == 0}">
					<div class="soldout">이미 예약된 상품입니다</div>
				</c:if>
				<c:if test="${data.trdel != 0}">
				<c:if test="${logininfo != null}">
					<c:set var="v" value="${cart}"/>
					<c:if test="${flag==true}">
						<a href="tcartinsert.do?trpk=${data.trpk}" class="buttonatag"><div class="insertcart">장바구니담기</div></a>				
					</c:if>
					<c:if test="${flag==false}">
						<div id="hascart">장바구니담기</div>		
					</c:if>
				</c:if>
				<c:if test="${logininfo != null}">
					<c:if test="${data.trdel == 1}">
						<a href="tpay.do?trpk=${data.trpk}" class="buttonatag"><div id="paybutton">예약(결제)하기</div></a>
					</c:if>
					<c:if test="${wflag==true}">
						<a href="twishinsert.do?trpk=${data.trpk}&tupk=${logininfo.tupk}" class="buttonatag"><img alt="찜해제하기" src="images/ht2.png" class="heartimg"></a>
					</c:if>
					<c:if test="${wflag==false}">
						<a href="twishdelete.do?trpk=${data.trpk}&tupk=${logininfo.tupk}" class="buttonatag"><img alt="찜하기" src="images/ht1.png" class="heartimg"></a>
					</c:if>
				</c:if>
				<c:if test="${logininfo == null}">
					<a class="buttonatag"><div id="nonepaybutton">예약(결제)하기</div></a>
					<a class="buttonatag"><img alt="찜하기" src="images/ht2.png" id="noneheart"></a>
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
		<div id="rcbreview">
			<div id="">
				<h2>리뷰</h2>
				<tt:write type="tboard"/>
			</div>
		
			<c:if test="${trdatas.size() == 0}">작성된 리뷰가 없습니다</c:if>
			
			<c:forEach var="v" items="${trdatas}">
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
				<div class="">
					<tt:write type="tpmsg" tvpk="${b.tvpk}" />
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
	
	// star rating
	var starRating = function(){
	  var $star = $(".star-input"),
	      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".star-input>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".star-input>.input", function(){
	    var $this = $(this);
	    setTimeout(function(){
	      if($this.find(":focus").length === 0){
	        $this.removeClass("focus");
	      }
	    }, 100);
	  })
	    .on("change", ".star-input :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".star-input label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".star-input>.input", function(){
	    var $checked = $star.find(":checked");
	    if($checked.length === 0){
	      $result.text("0");
	    } else {
	      $result.text($checked.next().text());
	    }
	  });
	};
	starRating();
	</script>
	
</body>
</html>