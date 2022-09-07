<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<ul>
		<li style="margin-left: 10%; margin-right: 20%;"><div id="naverIdLogin"></div></li>
		<li style="margin-right: 20%;"><a><span><img alt=""
					src="images/kakao_login_medium_narrow.png" onclick="kakaoLogin();"
					style="cursor: pointer;" title="카카오아이디로 로그인"></span></a></li>
	</ul>
	<script type="text/javascript">
		// 네이버
		var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "oX_Kd3_jRt98OWIDVini",
					callbackUrl: "http://localhost:8088/TechTrip/snsLogin/NewFile1.jsp",
					isPopup: false, /* 팝업을 통한 연동처리 여부 */
					loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
				}
			);
			
			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init();
	</script>

	<script type="text/javascript">
		function saveToDos(token) { //item을 localStorage에 저장합니다. 
			typeof (Storage) !== 'undefined'
					&& sessionStorage.setItem('AccessKEY', JSON
							.stringify(token));
		};
		window.Kakao.init('e08cd4365622920b7af0ecadb2c06fc9'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		 function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    saveToDos(response.access_token)  // 로그인 성공하면 사용자 엑세스 토큰 sessionStorage에 저장
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            alert('로그인 성공');
                            var email = kakao_account.email;
                            console.log(email);
                            
                            window.location.replace("http://localhost:8088/TechTrip/snsLogin/NewFile2.jsp?email="+email);
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        };
	</script>
</body>
</html>