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
</head>
<body>

<div>
	<form action="join.jsp" method="post">
		<table>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="" id="userh"></td>
				<td><input type="button" value="인증번호 발송" onclick="checkSms()"></td>			
			</tr>
			<tr>
				<td>인증번호</td>
				<td><input type="text" name=""></td>
				<td><input type="button" value="인증번호 확인"></td>
			</tr>
			<tr>
				<td colspan="3"><div id="result"></div></td>
			</tr>
			<tr>
				<td colspan="3">
					<center>
						<br>
						<input type="submit" value="다음으로 넘어가기">
					</center>
				</td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
function checkSms() {
	var userh = $("#userh").val();
	$.ajax({
		type : 'GET',
		url : '${pageContext.request.contextPath}/checkSms.do?userh=' + userh,
		data : {
			userh : userh
		},
		success : function(result) {
			console.log("로그1 [" + result + "]");
			if (result == 1) {
				$("#result").text("SMS 인증이 완료되었습니다.");
				$("#result").css("color", "blue");
			} else {
				$("#result").text("SMS 인증에 실패하였습니다.");
				$("#result").css("color", "red");
			}
		},
		error : function(request, status, error) {
			console.log("code: " + request.status);
			console.log("message: " + request.responseText);
			console.log("error: " + error);
		}
	});
}
function inputSmsChk(){
	document.userInfo.smsDuplication.value="smsUnCheck";
	$("#result").text("SMS 인증을 해주세요!");
	$("#result").css("color", "black");
}
</script>
</body>
</html>