<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | techTrip</title>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

</style>
</head>
<body>
<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#userid").focus();
		});
		function check() {
			var userid = $("#userid").val();
			var RegExp = /^[a-zA-Z0-9]{6,12}$/; // 아이디 유효성 검사
			if (userid == "") {
				alert("아이디를 입력해주세요");
				$("#userid").focus();
				return false;

			};
			// 아이디가 6자리 영문대소문자와 숫자로만 입력

			if (!RegExp.test(userid)) {
				alert("아이디는 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userid").focus();
				return false;
			};
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/checkId.do?userid=' + userid,
				data : {
					userid : userid
				},
				success : function(result) {
					console.log("로그1 [" + result + "]");
					if (result == 1) {
						$("#result").text("사용가능한 아이디입니다");
						$("#result").css("color", "blue");
						$("#idDuplication").val('idCheck');
					} else {
						$("#result").text("이미 사용중인 아이디입니다");
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
		function inputIdChk(){
			document.getElementById("idDuplication").value="idUnCheck";
			$("#result").text("중복검사를 실행해주세요!");
			$("#result").css("color", "black");
		}
		</script>
		<script type="text/javascript">
		function Validation() {
			const form = document.forms[0];
			let validation = true;
			
			var RegExp = /^[a-zA-Z0-9]{6,12}$/; // 아이디 유효성 검사

			var phoneExp = /^\d{3}-\d{3,4}-\d{4}$/; // 휴대폰 유효성 검사

			var userId = document.getElementById("userid");

			var userPs = document.getElementById("userps");

			var userPc = document.getElementById("userpc");

			var userM = document.getElementById("userm");

			var userR = document.getElementById("userRe");

			var userBr = document.getElementById("birth");

			var userh = document.getElementById("userh");
			
			var idDuplication = document.getElementById("idDuplication");

			var userad = document.getElementById("sample6_postcode");

			//id와 password가 같을 경우

			if (userId.value == userPs.value) {
				alert("아이디와 비밀번호가 같습니다.");
				$("#userPs").focus();
				validation=false;

			}
			
			// 아이디 중복검사를 하지 않았을 경우 확인메세지
			if (idDuplication.value != "idCheck") {
				alert("아이디 중복체크를 해주세요.");
				validation=false;
			}

			//==============================================================

			//password가 입력되지 않을 경우

			if (userPs.value == "") {
				alert("비밀번호가 입력되지 않았습니다.");
				$("#userPs").focus();
				validation=false;
			}

			//password 6~12자리 영문대소문자와 숫자로만 입력

			else if (!RegExp.test(userPs.value)) {
				alert("비밀번호를 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userPs").focus();
				validation=false;
			}

			//id와 password가 같을 경우

			else if (userId.value == userPs.value) {
				alert("아이디와 비밀번호 확인이 같습니다.");
				$("#userPc").focus();
				validation=false;
			}

			//password_check가 입력되지 않을 경우

			else if (userPc.value == "") {
				alert("비밀번호 확인이 입력되지 않았습니다.");
				$("#userPc").focus();
				validation=false;
			}

			//password_check 6~12자리 영문대소문자와 숫자로만 입력

			else if (!RegExp.test(userPc.value)) {
				alert("비밀번호 확인을 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userPc").focus();
				validation=false;
			}

			else if (userPs.value != userPc.value) {
				alert("비밀번호가 비밀번호 확인과 일치하지 않습니다");
				$("#userPc").focus();
				validation=false;
			}

			//===========================================================
			
			// 전화번호
			else if (userh.value == "") {
				alert("전화번호가 입력되지 않았습니다.");
				$("#userh").focus();
				validation=false;
			}
			
			else if (!phoneExp.test(userh.value)) {
				alert("전화번호 형식이 맞지 않습니다.");
				$("#userh").focus();
				validation=false;
			}
			
			// 우편번호
			else if (userad.value == "") {
				alert("우편번호가 입력되지 않았습니다.");
				$("#sample6_postcode").focus();
				validation=false;
			}
			
			if(validation) {
		           alert('유효성 검사 통과!!')
		           form.action = 'tuserinsert.do';   //유효성 통과완료되면 서버로 데이터 전달하기.
		           form.method = 'POST';
		       		// 폼을 제출하려면 반드시 폼이 문서 안에 있어야 합니다.
		           form.submit();          // 서버로 데이터 전달하기 동작                                     
		       }else 
		           alert('유효성 검사 실패!!')            
		   };
		
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						},
						theme : {
							bgColor : "#6F42C1", //바탕 배경색
							searchBgColor : "#FFFFFF", //검색창 배경색
							contentBgColor : "#FFFFFF" //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
						//pageBgColor: "", //페이지 배경색
						//textColor: "", //기본 글자색
						//queryTextColor: "", //검색창 글자색
						//postcodeTextColor: "", //우편번호 글자색
						//emphTextColor: "", //강조 글자색
						//outlineColor: "", //테두리
						}
					}).open();
		}
	</script>
<div id="joincontent">
	<div id="joincontentbox">
		<div id="joinlogobox">
			<a href="main.do">
				<img alt="로고이미지" src="images/22.jpg" id="joinlogoimg">
			</a>
		</div>
			<div id="joinsubject">
				<h3>회원가입</h3>
			</div>
			<form action="" name="userInfo" id="joinform">
						<input type="hidden" name="kemail" value="${param.kemail}">
						<input type="hidden" name="nemail" value="${param.nemail}">
			<table>
				<tr>
					<td class="jointabletitle"><div>아이디</div></td>
					<td><input name="tuid" id="userid"  class="jointablevalueid"
						required placeholder="6~12자리 영문 혹은 영문과 숫자를 조합" onkeydown="inputIdChk()">
						<a class="ck_btn" href="javascript:check();">
							<button type="button" id="joincheckidbutton">중복확인</button>
						</a>
						<input type="hidden" id="idDuplication" value="idUnCheck"></td>
				</tr>
				<tr>
					<td></td>
					<td><div id="result"></div></td>
				</tr>
				<tr>
					<td class="jointabletitle"><div>비밀번호</div></td>
					<td><input type="password" name="tupw"  class="jointablevalue" id="userps"
						required placeholder="아이디와 다른 6~12자리 영문과 숫자를 조합"></td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle"><div>비밀번호확인</div></td>
					<td><input type="password"  class="jointablevalue" id="userpc"
						required placeholder="비밀번호를 한번 더 입력해주세요"></td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle"><div>닉네임</div></td>
					<td><input required  class="jointablevalue" name="tunickname"
						placeholder="닉네임을 입력해주세요"></td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle"><div>휴대폰</div></td>
					<c:if test="${param.userh != null}">
					<td><input required  class="jointablevalue" name="tuph" id="userh"
						value="${param.userh}" readonly></td>
					</c:if>
					<c:if test="${param.userh == null}">
					<td><input required  class="jointablevalue" name="tuph" id="userh"
						placeholder="전화번호를 입력해주세요 ex)010-0000-0000"></td>
					</c:if>
				</tr>
				<tr class="tablebordertop">
					<td></td>
					<td>
						<input type="text" id="sample6_postcode" name="tuaddresszipcode"
						placeholder="우편번호" readonly>
						<a class="sample6" href="javascript:sample6_execDaumPostcode();">
							<button type="button" id="samplesearch">
								우편번호 찾기
							</button>
						</a>
					</td>
				<tr>
					<td class="jointabletitle"><div>주 소</div></td>
					<td>
						<input type="text" name="tuaddress"
						id="sample6_address" placeholder="주소" readonly>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>	
						<input name="tuaddressdetail"
						type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목"
						readonly>
					</td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle"><div>생년월일</div></td>
					<td><input type="text" id="datepicker" name="tubirth"></td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle">성별</td>
					<td>남&nbsp;<input type="radio"
						name="tugender" checked="checked" value="남">여&nbsp;<input type="radio" name="tugender" value="여">
					</td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle">국적</td>
					<td>내국인&nbsp;<input type="radio"
						name="tunation" checked="checked" value="내국인"> 외국인&nbsp;<input type="radio" name="tunation" value="외국인">
						&nbsp;</td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle">회원종류</td>
					<td>
						<select id="joinrole" name="turole">
							<option value="guest">guest</option>
							<option value="host">host</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<br>
						<center>					
							<input type="button" value="회원가입하기" id="joinbutton" onclick="Validation()">
						</center>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript">
$( "#datepicker" ).datepicker();

$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd' //Input Display Format 변경
    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
    ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
    ,changeYear: true //콤보박스에서 년 선택 가능
    ,changeMonth: true //콤보박스에서 월 선택 가능                
    ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
    ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
    ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
    ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
    ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
    ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    ,maxDate: "today" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    ,yearRange: "-100:+0"
});
$('#datepicker').datepicker('setDate', '-30Y');
// 초기 세팅 날짜
</script>
</body>
</html>
