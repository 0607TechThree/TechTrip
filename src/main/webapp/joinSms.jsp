<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>

</body>
</html>