<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | TechTrip</title>
<!--  favicon -->
<link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
<link rel="
	preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/css.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#userid").focus();
		});
		
		function Validation() {
			var RegExp = /^[a-zA-Z0-9]{6,12}$/; // 아이디 유효성 검사

			var userId = document.getElementById("userid");

			var userPs = document.getElementById("userPs");

			// 아이디에 아무것도 안들어가있을 경우

			if (userId.value == "") {

				alert("아이디를 입력해주세요");
				$("#userid").focus();
				return false;

			}
			// 아이디가 6자리 영문대소문자와 숫자로만 입력

			if (!RegExp.test(userId.value)) {

				$("#userid").focus();
				alert("아이디는 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				return false;

			}

			//password가 입력되지 않을 경우

			if (userPs.value == "") {

				alert("비밀번호가 입력되지 않았습니다.");
				$("#userPs").focus();
				return false;

			}

			//password 6~12자리 영문대소문자와 숫자로만 입력

			if (!RegExp.test(userPs.value)) {

				alert("비밀번호는 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userPs").focus();
				return false;

			}
		}
	</script>
	<div id="loginwrap">
	<div class="locontent">
	<a href="main.jsp"><img id="logo" alt="로고" src="images/22.jpg" ></a>
		<div class="login">로그인</div>
		<div class="lomain">
			<form action="tuserselectone.do" onsubmit="return Validation();" method="post">
				<div class="idpw">
					<div class="id-box">
						<div class="loidpw">
							<input data-testid="input-box" id="userid" name="tuid"
								placeholder="아이디를 입력해주세요" type="text" class="lidpw" value="">
						</div>
					</div>
					<div class="pw-box">
						<div class="loidpw">
							<input data-testid="input-box" id="userPs" name="tupw"
								placeholder="비밀번호를 입력해주세요" type="password" class="lidpw"
								value="">
						</div>
					</div>
					<input type="hidden" name="location" value="${location}">
				</div>
				<div class="find-idpw">
					<span>sns 로그인 시 최초 1회 회원가입을 진행해야 합니다</span>
				</div>
				<div>
					<div><div id="naverIdLogin"></div></div>
					<div><a><span><img alt=""
						src="images/kakaologin.png" onclick="kakaoLogin();"
						style="cursor: pointer; width: 340px; height: auto;" title="카카오아이디로 로그인"></span></a></div>
				</div>
				<div class="bt-idpw">
					<button class="bt-id" type="submit" height="54" radius="3">
						<span class="btn-idpw">로그인</span>
					</button>
					<button class="bt-pw" type="button" height="54" radius="3"
						onclick="location.href='join.jsp'">
						<span class="btn-idpw">회원가입</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		// 네이버
		var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "oX_Kd3_jRt98OWIDVini",
					callbackUrl: "http://localhost:8088/TechTrip/NewFile1.jsp",
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
                            
                            window.location.replace("http://localhost:8088/TechTrip/snslogin.do?kemail="+email);
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