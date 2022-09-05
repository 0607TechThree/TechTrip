<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜백</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript">
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "oX_Kd3_jRt98OWIDVini",
			callbackUrl: "http://localhost:8088/TechTrip/snsLogin/NewFile1.jsp",
			isPopup: false,
			callbackHandle: true
			/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		}
	);

	/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();

	/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				var email = naverLogin.user.getEmail();
				var mobile = naverLogin.user.getMobile();
				console.log(email); // 사용자 이메일 정보를 받을수 있습니다.
				console.log(mobile); // 사용자 전화번호 정보를 받을수 있습니다.
        		console.log(naverLogin.user); //사용자 정보를 받을수 있습니다.
                if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}
        		
                if( mobile == undefined || mobile == null) {
					alert("전화번호는 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함*/
					naverLogin.reprompt();
					return;
				}
        		

				window.location.replace("NewFile2.jsp?email="+email+"&mobile="+mobile);
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
</script>
</head>
<body>이게 왜 나옴??
</body>
</html>