<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	성공 ㅇ.ㅇb ${param.email} ${param.mobile}
	 <a href="#0" id="kakaoLogout">로그아웃</a> | 
    <a href="#0" id="secession">탈퇴</a>
	<!-- <a href="javascript:deletet()">로그아웃</a>-->

	<script type="text/javascript">
		console.log('${param.deletet}');
	function deletet(){
		var deletet = '${param.deletet}';
		const url="https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=oX_Kd3_jRt98OWIDVini&client_secret=8zjBl7T8Ax&access_token="+deletet+"&service_provider=NAVER";
		console.log(url);
		fetch(url) // url변수(URL)를 통해 fetch를 진행
		// 자바스크립트를 사용할 때 서버에 네트워크 요청을 보내고, 새로운 정보를 받아오는 역할을 하는 API를 사용함 
	      .then((response) => response.json()) // 응답 객체를 자바 스크립트 객체로 변환
	      .then((data) => {
	      });
	  console.log(url);
	};
</script>

<script type="text/javascript">
	window.Kakao.init('e08cd4365622920b7af0ecadb2c06fc9');
    window.Kakao.Auth.setAccessToken(JSON.parse(sessionStorage.getItem('AccessKEY'))); //sessionStorage에 저장된 사용자 엑세스 토큰 받아온다.
    
    function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
            console.log('Not logged in.');
            return;
        }
        Kakao.Auth.logout(function(response) {
            alert(response +' logout');
            window.location.replace("NewFile.jsp");
        });
    };

    function secession() {
        Kakao.API.request({
            url: '/v1/user/unlink',
            success: function(response) {
                console.log(response);
                //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
                window.location.href='/'
            },
            fail: function(error) {
                console.log('탈퇴 미완료')
                console.log(error);
            },
        });
    };

    const logout = document.querySelector('#kakaoLogout');
    const sion = document.querySelector('#secession');

    logout.addEventListener('click', kakaoLogout);
    sion.addEventListener('click', secession);
</script>	
</body>
</html>