<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>techTrip</title>
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
				<img class="" src="images/mainswiper1.jpg" alt="명소이미지1">
			</div>
			<div class="swiper-slide">
				<img class="" src="images/mainswiper2.jpg" alt="명소이미지2">
			</div>
			<div class="swiper-slide">
				<img class="" src="images/mainswiper3.jpg" alt="명소이미지3">
			</div>
		</div>
	</div>
	
	<!-- Category -->
	<div id="maincategory">
		<a href="">
			<img alt="1번 서울" src="images/flaticon/1seoul.png">
		</a>
		<a href="">
			<img alt="2번 경기" src="images/flaticon/2gyeongi.png">
		</a>
		<a href="">
			<img alt="3번 인천" src="images/flaticon/3incheon.png">
		</a>
		<a href="">
			<img alt="4번 호남" src="images/flaticon/4honam.png">
		</a>
		<a href="">
			<img alt="5번 강원" src="images/flaticon/5kangwon.png">
		</a>
		<a href="">
			<img alt="6번 부산" src="images/flaticon/6busan.png">
		</a>
		<a href="">
			<img alt="7번 제주" src="images/flaticon/7jeju.png">
		</a>

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
	<script>
		$("document").ready(
				function() {
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
								$('.custom-fraction .current').text(
										this.realIndex + 1);
								$('.custom-fraction .all').text(
										this.loopedSlides);
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
								$('.custom-fraction .current').text(
										this.realIndex + 1);
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

	</script>
</body>
</html>