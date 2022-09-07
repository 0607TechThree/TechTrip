<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>techTrip</title>
<!--  favicon -->
<link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
<link rel="stylesheet" href="css/css.css" type="text/css">
<link rel="
	preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
	
</head>
<body>

<tt:header/>

<div id="maincontent">
	<!-- Swiper -->
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img class="swiperimg" src="images/mainswiper1.jpg" alt="명소이미지1">
			</div>
			<div class="swiper-slide">
				<img class="swiperimg" src="images/mainswiper2.jpg" alt="명소이미지2">
			</div>
			<div class="swiper-slide">
				<img class="swiperimg" src="images/mainswiper3.jpg" alt="명소이미지3">
			</div>
		</div>
	</div>
	
	<!-- Category -->
	<div id="maincategory">
		<a href="troomselectall.do?trregion=서울">
			<img alt="1번 서울" src="images/flaticon/1seoul.png">
		</a>
		<a href="troomselectall.do?trregion=경기">
			<img alt="2번 경기" src="images/flaticon/2gyeongi.png">
		</a>
		<a href="troomselectall.do?trregion=인천">
			<img alt="3번 인천" src="images/flaticon/3incheon.png">
		</a>
		<a href="troomselectall.do?trregion=호남">
			<img alt="4번 호남" src="images/flaticon/4honam.png">
		</a>
		<a href="troomselectall.do?trregion=강원">
			<img alt="5번 강원" src="images/flaticon/5kangwon.png">
		</a>
		<a href="troomselectall.do?trregion=부산">
			<img alt="6번 부산" src="images/flaticon/6busan.png">
		</a>
		<a href="troomselectall.do?trregion=제주">
			<img alt="7번 제주" src="images/flaticon/7jeju.png">
		</a>

	</div>
	
	<div id="apibox">
		<!-- 웨더 API -->
		<div id="weatherapi">
			<div id="weatherapicity">
				<div id="city"></div>	
			</div>
			<br style="font-size: 20px">
			<div id="weatherapibox">
				<div class="dayweather">
					<span id="weatherdate1"></span><br>
					<span id="wimg1"></span><br>
					<span id="weather1"></span>
				</div>
				<div class="dayweather">
					<span id="weatherdate2"></span><br>
					<span id="wimg2"></span><br>
					<span id="weather2"></span>
				</div>
				<div class="dayweather">
					<span id="weatherdate3"></span><br>
					<span id="wimg3"></span><br>
					<span id="weather3"></span>
				</div>
				<div class="dayweather">
					<span id="weatherdate4"></span><br>
					<span id="wimg4"></span><br>
					<span id="weather4"></span>
				</div>
				<div class="dayweather">
					<span id="weatherdate5"></span><br>
					<span id="wimg5"></span><br>
					<span id="weather5"></span>
				</div>
			</div>
		</div>
		<!-- 우리은행 환율 -->
		<div class="exchangerate">
		<iframe src="https://sbiz.wooribank.com/biz/Dream?withyou=FXCNT0002&rc=0&divType=3&lang=KOR" frameBorder=0
	width=600 scrolling=no height=184 topmargin="0" name=irate marginWidth=0 marginHeight=0 title="무료환율표A형"></iframe>			
		</div>
	</div>
	<div id="mainbottom">
		<div class="mainbottomcontent" onclick="alertmsg()">
			<div class="mainbcl">
				<div class="mbcltitle">
					TechTrip
				</div>
				<div class="mbclcontent">
					광고 신청하기
				</div>
			</div>
			<div class="mainbcr">
				<img alt="" src="images/mainpic1.png" class="mainpic">
			</div>
		</div>
		<div class="mainbottomcontent" onclick="togithub()">
			<div class="mainbcl">
				<div class="mbcltitle">
					깃 허브
				</div>
				<div class="mbclcontent">
					구경 하기
				</div>
			</div>
			<div class="mainbcr">
				<img alt="" src="images/mainpic2.png" class="mainpic2">
			</div>
		</div>
	</div>
</div>

<tt:footer/>

<!-- Script -->
	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<!-- Initialize Swiper -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">

// 광고
function alertmsg(){
	alert("테크트립 광고문의는 고객센터(1500-0000)를 이용해주세요!");
}

function togithub(){
	window.open("https://github.com/0607TechThree/TechTrip");
}

// 스와이퍼 플러그인
$("document").ready(function() {
// 문서의 dom이 준비되면
// .mySwiper 클래스를 swiper 슬라이더로 만듦
// 이후에 swiper변수에 할당했기 때문에 스크립트로 제어할 수도 있음.
	var swiper = new Swiper(".mySwiper", {
		slidesPerView : 'auto',
		spaceBetween : 80,
		loop : true,

		// pagination 기본은 bullet
		pagination : {
			el : ".swiper-pagination"
		},

		// 좌우 화살표 navigation element 지정
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev"
		},
		// 반응형
		breakpoints : {
		// 600px 이하가 되면 슬라이드 간 간격을 0으로
			600 : {
				spaceBetween : 0
			},
		},

		on : {
			init : function() {
			$('.swiper-slide').addClass('changed');
			// fraction에 현재 인덱스와 전체 인덱스 표시
			// this.loopedSlides는 loop, slidesPerView: 'auto'일 때 제대로 동작
			$('.custom-fraction .current').text(this.realIndex + 1);
			$('.custom-fraction .all').text(this.loopedSlides);
			// console.log(this);
			// console.log(this.loopedSlides)
		},

		slideChangeTransitionStart : function() {
			// 기본적으로 제공하는 swiper-slide-active 클래스를 이용해
			// css transition 애니메이션 작성 가능하다.
			// 다만 루프 모드일 때에는 루프 픽스를 하며 slide를 바꿔치기를 하는데,
			// 이 때 플리커링이 발생할 수 있다.
			// css transition을 서로 다르게 설정한 changed, changing 클래스를 이용
			$('.swiper-slide').addClass('changing');
			$('.swiper-slide').removeClass('changed');
			// 페이지 넘어갈 때마다 fraction 현재 인덱스 변경
			$('.custom-fraction .current').text(this.realIndex + 1);
		},

		slideChangeTransitionEnd : function() {
			// changing : transition O
			// changed : transition X
			$('.swiper-slide').removeClass('changing');
			$('.swiper-slide').addClass('changed');
			}
		},
		autoplay : { //자동슬라이드 (false-비활성화)      
			delay : 2000, // 시간 설정       
			disableOnInteraction : false, // false-스와이프 후 자동 재생        
		},
	});
});
// 날씨 API 사용
$(document).ready(function() {
	
	const wimg1 = document.getElementById("wimg1");
	const weather1 = document.querySelector("#weather1");
	const weatherdate1 = document.getElementById("weatherdate1")
	const wimg2 = document.getElementById("wimg2");
	const weather2 = document.querySelector("#weather2");
	const weatherdate2 = document.getElementById("weatherdate2")
	const wimg3 = document.getElementById("wimg3");
	const weather3 = document.querySelector("#weather3");
	const weatherdate3 = document.getElementById("weatherdate3")
	const wimg4 = document.getElementById("wimg4");
	const weather4 = document.querySelector("#weather4");
	const weatherdate4 = document.getElementById("weatherdate4")
	const wimg5 = document.getElementById("wimg5");
	const weather5 = document.querySelector("#weather5");
	const weatherdate5 = document.getElementById("weatherdate5")
	
	const city = document.querySelector("#city");
	// 나중에 innerText로 지역정보를 넣어줄 예정
	const API_KEY = "ca5f05a569c385a6de4deba784f6976c"; // API의 키를 변수로 저장

	function onGeoOk(position) {//위치정보를 확인하면 실행할 함수 매개변수로 현재위치 넣어줌
	// position은 다양한 현재 위치의 정보를 담고 있음 : 위도, 경도, 고도, 현재시간 등
	const lat = position.coords.latitude;
	// 현재 위치 정보의 위도 저장
	const lon = position.coords.longitude;
	// 현재 위치 정보의 경도 저장
	const url = "https://api.openweathermap.org/data/2.5/forecast?lat="+lat+"&lon="+lon+"&appid="+API_KEY+"&units=metric";
	// 위도 경도 및 API 키를 입력하여 해당 URL을 변수로 지정해줌
	// 위의 URL로 들어가보면 해당 위치의 모든 정보를 json 파일의 형태로 보여줌
	  
		fetch(url) // url변수(URL)를 통해 fetch를 진행
		// 자바스크립트를 사용할 때 서버에 네트워크 요청을 보내고, 새로운 정보를 받아오는 역할을 하는 API를 사용함 
	      .then((response) => response.json()) // 응답 객체를 자바 스크립트 객체로 변환
	      .then((data) => { 
	      	city.innerText = data.city.name;
	      	// data.name 은 지역정보를 나타냄
	      	// 지역정보를 받아와서 #city내부에 innerText 해줌
	      	weatherdate1.innerText = data.list[3].dt_txt.substring(0,10);
	      	weather1.innerText = data.list[3].main.temp+"°C";
	      	const icon1 = data.list[3].weather[0].icon;
	      	wimg1.innerHTML = "<img style='width:40px; height:40px;' src='images/weather/"+icon1+".png'>";
	      	
	      	weatherdate2.innerText = data.list[11].dt_txt.substring(0,10);
	      	weather2.innerText = data.list[11].main.temp+"°C";
	      	const icon2 = data.list[11].weather[0].icon;
	      	wimg2.innerHTML = "<img style='width:40px; height:40px;' src='images/weather/"+icon2+".png'>";
	      	
	      	weatherdate3.innerText = data.list[19].dt_txt.substring(0,10);
	      	weather3.innerText = data.list[19].main.temp+"°C";
	      	const icon3 = data.list[19].weather[0].icon;
	      	wimg3.innerHTML = "<img style='width:40px; height:40px;' src='images/weather/"+icon3+".png'>";

	      	weatherdate4.innerText = data.list[27].dt_txt.substring(0,10);
	      	weather4.innerText = data.list[27].main.temp+"°C";
	      	const icon4 = data.list[27].weather[0].icon;
	      	wimg4.innerHTML = "<img style='width:40px; height:40px;' src='images/weather/"+icon4+".png'>";

	      	weatherdate5.innerText = data.list[35].dt_txt.substring(0,10);
	      	weather5.innerText = data.list[35].main.temp+"°C";
	      	const icon5 = data.list[35].weather[0].icon;
	      	wimg5.innerHTML = "<img style='width:40px; height:40px;' src='images/weather/"+icon5+".png'>";
	      	
	      	// innerHTML을 통해 img 태그를 추가해주는데 src속성의 파일명을 받아온 아이콘번호로 입력
	      	// 해당 파일명을 가진 파일을 40 x 40 px로 설정까지 해줌
	      });
	  console.log(url);
	  // 현재위치에 관련된 날씨정보가 담긴 정보의 url
	}
	function onGeoError() { // 위치 정보 확인 못할때 실행할 함수
		alert("Can't find you. No weather for you.");
	}
	navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
	});
	// 현재 유저의 위치를 가져오는함수 navigator.geolocation.getCurrentPosition
	// 유저의 위치를 완벽하게 가져오는것이 아니라 가장 빠르게 가져오는 방법이기 때문에
	// 완벽한 위치를 찾는 것은 아니고 근처에서 위치를 참조할 수 있는 곳의 위치정보를 나타낸다
	// 인자로는 위치를 가져왔을때 실행할 내용과, 위치를 가져오지 못했을 때 실행할 내용을 전달해준다.
	// navigator : 브라우저 공급자 및 버전 정보 등을 포함한 브라우저에 대한 다양한 정보를 저장하는 객체
</script>
</body>
</html>