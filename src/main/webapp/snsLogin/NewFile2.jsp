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