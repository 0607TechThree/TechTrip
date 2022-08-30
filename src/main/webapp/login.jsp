<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	
		
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
	<div class="locontent">
		<div class="login">로그인</div>
		<div class="lomain">
			<form action="MTmain.html" onsubmit="return Validation();"
				method="post">
				<div class="idpw">
					<div class="id-box">
						<div class="loidpw">
							<input data-testid="input-box" id="userid"
								placeholder="아이디를 입력해주세요" type="text" class="lidpw" value="">
						</div>
					</div>
					<div class="pw-box">
						<div class="loidpw">
							<input data-testid="input-box" id="userPs"
								placeholder="비밀번호를 입력해주세요" type="password" class="lidpw"
								value="">
						</div>
					</div>
				</div>
				<div class="find-idpw">
					<a class="fidpw">아이디 찾기</a> <span class="ff-idpw"></span> <a
						class="fidpw">비밀번호 찾기</a>
				</div>
				<div class="bt-idpw">
					<button class="bt-id" type="submit" height="54" radius="3">
						<span class="btn-idpw">로그인</span>
					</button>
					<button class="bt-pw" type="button" height="54" radius="3"
						onclick="location.href='join.html'">
						<span class="btn-idpw">회원가입</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>