<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰인증 | techTrip</title>
<link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
<link rel="
	preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/css.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
</head>
<body>
<div id="joincontent">
<div id="joinfirstcontent">
	<div id="joinlogobox">
		<a href="main.do">
			<img alt="로고이미지" src="images/22.jpg" id="joinlogoimg">
		</a>
	</div>
	<div id="joinsubject">
		<h3>전화번호 인증</h3>
	</div>
	<div id="joinphonecheck">
		<form action="join.jsp" method="post" id="sign-up">
			<table id="joinfirsttable">
				<tr>
					<td class="jointabletitle">전화번호</td>
					<td><input type="tel" name="userh" id="userh"></td>
					<td><a href="javascript:sms();"><button class="joinfirsta">인증번호 전송</button></a></td>
				</tr>
				<tr>
					<td colspan="3"><div id="result1"></div></td>
				</tr>
				<tr>
					<td class="jointabletitle">인증번호</td>
					<td><input type="text" name="" id="checkNum"></td>
					<td><a href="javascript:checkSms();"><button class="joinfirsta">인증번호 확인</button></a></td>
				</tr>
				<tr>
					<td colspan="3"><div id="result"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<center>
							<br> <input type="submit" value="다음으로 넘어가기" id="joinfirstbutton">
						</center>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>
	<script type="text/javascript">
	var number = 0; // 랜덤문자인증번호 저장 변수
	var check = 0; // 인증번호 일치, 불일치 변수
	var form=document.forms['sign-up'];
		function sms() {
			var userh = $("#userh").val();

			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/Sms',
				data : {
					userh : userh
				},
				success : function(randNum) {
					console.log("로그: [" + randNum + "]")
					if (randNum != null) {
						$("#result1").text("인증번호 전송이 완료되었습니다!");
						$("#result1").css("color", "blue");

						number = randNum;

					} else {
						$("#result1").text("인증번호 전송이 불가합니다...");
						$("#result1").css("color", "red");
					}

				},

				error : function(request, status, error) { // 요청 보낸 곳(서블릿)에서 에러가 발생할 시 실행
					console.log("code: " + request.status);
					console.log("message: " + request.responseText);
					console.log("error: " + error);
				}

			});
		}
		function checkSms() {
			var checkNum = $("#checkNum").val();
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/checkSms.do',
				data : {
					randNum : number,
					checkNum : checkNum
				},
				success : function(result) {
					console.log("로그1 [" + result + "]");
					if (result == 1) {
						$("#result").text("SMS 인증이 완료되었습니다.");
						$("#result").css("color", "blue");
						check = 1;
					} else {
						$("#result").text("SMS 인증에 실패하였습니다.");
						$("#result").css("color", "red");
						check = -1;
					}
				},
				error : function(request, status, error) {
					console.log("code: " + request.status);
					console.log("message: " + request.responseText);
					console.log("error: " + error);
				}
			});
		}
		function inputSmsChk() {
			document.userInfo.smsDuplication.value = "smsUnCheck";
			$("#result").text("SMS 인증을 해주세요!");
			$("#result").css("color", "black");
		}
		
		form.onsubmit=function(){
			if (document.getElementById("userh").value == "") {
				alert("휴대폰 번호를 입력하세요.");
				return false;
			}
			if(document.getElementById("userh").value.length!=11){
				alert("휴대폰 번호를 모두 입력해주세요!.");
				return false;
			}
			if(check == -1 || check == 0){
				alert("인증번호를 확인해 주세요")
				return false;
			}
		}
	</script>
</body>
</html>