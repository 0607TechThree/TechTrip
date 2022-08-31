<%@ tag language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 API</title>
</head>
<body>
<div>
<span id="wimg"></span>
<span id="weather"></span> 
<span id="city"></span>
</div>

<script type="text/javascript">
const wimg = document.getElementById("wimg");
// 나중에 innerHTML로 날씨 이미지를 추가해줄 예정
const weather = document.querySelector("#weather");
// 나중에 innerText로 날씨정보를 넣어줄 예정
const city = document.querySelector("#city");
// 나중에 innerText로 지역정보를 넣어줄 예정
const API_KEY = ""; // API의 키를 변수로 저장

function onGeoOk(position) {//위치정보를 확인하면 실행할 함수 매개변수로 현재위치 넣어줌
// position은 다양한 현재 위치의 정보를 담고 있음 : 위도, 경도, 고도, 현재시간 등
const lat = position.coords.latitude;
// 현재 위치 정보의 위도 저장
const lon = position.coords.longitude;
// 현재 위치 정보의 경도 저장
const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`;
// 위도 경도 및 API 키를 입력하여 해당 URL을 변수로 지정해줌
// 위의 URL로 들어가보면 해당 위치의 모든 정보를 json 파일의 형태로 보여줌
  
	fetch(url) // url변수(URL)를 통해 fetch를 진행
	// 자바스크립트를 사용할 때 서버에 네트워크 요청을 보내고, 새로운 정보를 받아오는 역할을 하는 API를 사용함 
      .then((response) => response.json()) // 응답 객체를 자바 스크립트 객체로 변환
      .then((data) => { 
      	city.innerText = data.name;
      	// data.name 은 지역정보를 나타냄
      	// 지역정보를 받아와서 #city내부에 innerText 해줌
      	weather.innerText = `${data.main.temp}`+"°C";
      	// data.main.temp 는 기온정보를 나타냄
      	// 기온정보를 받아와서 #weather내부에 innerText 해줌
      	const icon = data.weather[0].icon;
      	// data.weather[0].icon 아이콘의 번호값을 나타냄
      	// 아이콘 번호를 상수에 담아줌
      	wimg.innerHTML = "<img style='width:40px; height:40px;' src='images/weather/"+icon+".png'>";
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
// 현재 유저의 위치를 가져오는함수 navigator.geolocation.getCurrentPosition
// 유저의 위치를 완벽하게 가져오는것이 아니라 가장 빠르게 가져오는 방법이기 때문에
// 완벽한 위치를 찾는 것은 아니고 근처에서 위치를 참조할 수 있는 곳의 위치정보를 나타낸다
// 인자로는 위치를 가져왔을때 실행할 내용과, 위치를 가져오지 못했을 때 실행할 내용을 전달해준다.
// navigator : 브라우저 공급자 및 버전 정보 등을 포함한 브라우저에 대한 다양한 정보를 저장하는 객체
</script>
</body>
</html>