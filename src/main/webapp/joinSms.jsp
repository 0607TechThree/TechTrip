<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function sms(){
	var phone = $("#phone").val();
	
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/Sms',
		data:{phone:phone},
		success: function(randNum){
			console.log("로그: ["+randNum+"]")
			if(randNum != null){
				$("#result1").text("인증번호 전송이 완료되었습니다!");
				$("#result1").css("color","blue");
				
				number = randNum;
				
			}
			else{
				$("#result1").text("인증번호 전송이 불가합니다...");
				$("#result1").css("color","red");
			}
			
		},
		
		error: function(request, status, error){ // 요청 보낸 곳(서블릿)에서 에러가 발생할 시 실행
			console.log("code: "+request.status);
			console.log("message: "+request.responseText);
			console.log("error: "+error);
		}
		
	});
}
function checkSms() {
	var userh = $("#userh").val();
	$.ajax({
		type : 'GET',
		url : '${pageContext.request.contextPath}/checkSms.do',
		data : {
			randNum:number,checkNum:checkNum
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