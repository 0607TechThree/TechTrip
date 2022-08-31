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
		$(document).ready(function() {
			$("#header").load("header3.html");
			$("#footer").load("footer.html");
			$("#userid").focus();
		});
		function Validation() {

			var RegExp = /^[a-zA-Z0-9]{6,12}$/; // 아이디 유효성 검사

			var BrExp = /^[0-9]{4}$/; // 년도

			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 유효성 검사

			var nameExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; // 이름 유효성 검사

			var phoneExp = /^\d{3}-\d{3,4}-\d{4}$/;

			var userId = document.getElementById("userid");

			var userPs = document.getElementById("userPs");

			var userPc = document.getElementById("userPc");

			var userM = document.getElementById("userm");

			var userN = document.getElementById("usern");

			var userR = document.getElementById("userRe");

			var userBr = document.getElementById("birth");

			var userh = document.getElementById("userh");
			
			var userad = document.getElementById("sample6_postcode");

			// 아이디에 아무것도 안들어가있을 경우

			if (userId.value == "") {

				alert("아이디를 입력해주세요");
				$("#userid").focus();
				return false;

			}
			// 아이디가 6자리 영문대소문자와 숫자로만 입력

			if (!RegExp.test(userId.value)) {

				alert("아이디는 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userid").focus();
				return false;

			}
			//id와 password가 같을 경우

			if (userId.value == userPs.value) {

				alert("아이디와 비밀번호가 같습니다.");
				$("#userPs").focus();
				return false;

			}

			//==============================================================

			//password가 입력되지 않을 경우

			if (userPs.value == "") {

				alert("비밀번호가 입력되지 않았습니다.");
				$("#userPs").focus();
				return false;

			}

			//password 6~12자리 영문대소문자와 숫자로만 입력

			if (!RegExp.test(userPs.value)) {

				alert("비밀번호를 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userPs").focus();
				return false;

			}

			//id와 password_check가 같을 경우

			if (userId.value == userPc.value) {

				alert("아이디와 비밀번호 확인이 같습니다.");
				$("#userPc").focus();
				return false;

			}

			//password_check가 입력되지 않을 경우

			if (userPc.value == "") {

				alert("비밀번호 확인이 입력되지 않았습니다.");
				$("#userPc").focus();
				return false;

			}

			//password_check 6~12자리 영문대소문자와 숫자로만 입력

			if (!RegExp.test(userPc.value)) {

				alert("비밀번호 확인을 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userPc").focus();
				return false;

			}
			
			if (!(userPs.value==userPc.value)){
				alert("비밀번호가 비밀번호 확인과 일치하지 않습니다");
				$("#userPc").focus();
				return false;
			}

			//===========================================================

			// 이름이 영문자 썩여서 입력될 경우

			if (nameExp.test(userN.value) == false) {

				alert("이름형식이 맞지 않습니다.");
				$("#usern").focus();
				return false;

			}
			// 이메일이 이메일 형식과 맞지 않을 경우

			if (exptext.test(userM.value) == false) {

				alert("이메일형식이 맞지 않습니다.");
				$("#userm").focus();
				return false;

			}

			// 전화번호
			if (userh.value == "") {

				alert("전화번호가 입력되지 않았습니다.");
				$("#userh").focus();
				return false;
			}
			if (phoneExp.test(userh.value) == false) {

				alert("전화번호 형식이 맞지 않습니다.");
				$("#userh").focus();
				return false;
			}
			if (userad.value == "") {

				alert("우편번호가 입력되지 않았습니다.");
				$("#sample6_postcode").focus();
				return false;
			}
			// 년도 

			if (BrExp.test(userBr.value) == false) {

				alert("년도 형식이 맞지 않습니다.");
				$("#birth").focus();
				return false;
			}

			if (userBr.value == "") {

				alert("년도가 입력되지 않았습니다.");
				$("#birth").focus();
				return false;
			}
			if (!("1900" <= userBr.value && userBr.value <= "2022")) {

				alert("년도는 1900~2022 사이의 값을 입력해주세요");
				$("#birth").focus();
				return false;
			}

		}
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
						theme: {
									   bgColor: "#6F42C1", //바탕 배경색
									   searchBgColor: "#FFFFFF", //검색창 배경색
									   contentBgColor: "#FFFFFF" //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
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
	<div id="header"></div>

	<form action="MTmain.html" id="joinbox" onsubmit="return Validation();"
		method="post">
		<div id="joincontentbox">
			<div class="subject">
				<span>회원가입</span>
			</div>
			<table id="join_table">
				<tr>
					<td><div class="join_name_box">아이디</div></td>
					<td><input class="join_input" id="userid" required
						placeholder="6~12자리 영문 혹은 영문과 숫자를 조합"></td>
					<td><div></div></td>
				</tr>
				<tr>
					<td><div class="join_name_box">비밀번호</div></td>
					<td><input type="password" class="join_input" id="userPs" required
						placeholder="비밀번호를 입력해주세요"></td>
					<td><div></div></td>
				</tr>
				<tr>
					<td><div class="join_name_box">비밀번호 확인</div></td>
					<td><input type="password" class="join_input" id="userPc" required
						placeholder="비밀번호를 한번 더 입력해주세요"></td>
					<td><div></div></td>
				</tr>
				<tr>
					<td><div class="join_name_box">이름</div></td>
					<td><input class="join_input" id="usern" required
						placeholder="이름을 입력해주세요"></td>
					<td><div></div></td>
				</tr>
				<tr>
					<td><div class="join_name_box">이메일</div></td>
					<td><input class="join_input" id="userm" required
						placeholder="예: techtrip@three.com"></td>
					<td></td>
				</tr>
				<tr>
					<td><div class="join_name_box">휴대폰</div></td>
					<td><input class="join_input" id="userh" required
						placeholder="예: 010-0000-0000"></td>
					<td><div></div></td>
				</tr>
				<tr>
					<td><div class="join_name_box">주소</div></td>
					<td class="1111"><input type="text" id="sample6_postcode"
						placeholder="우편번호" disabled> <input type="button" class="sample6"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소" disabled><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목" disabled></td>
				</tr>
				<tr>
					<td><div class="join_name_box">성별</div></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;남&nbsp;<input type="radio"
						name="gender"> 여&nbsp;<input type="radio" name="gender">
						&nbsp;선택안함&nbsp;<input type="radio" name="gender"
						checked="checked"></td>
					<td><div></div></td>
				</tr>
				<tr>
					<td><div class="join_name_box">생년월일</div></td>
					<td><input type="text" id="birth" placeholder="4자리입력" required/>
						년&nbsp; <select class="mmdd">

							<option value="1">1</option>

							<option value="2">2</option>

							<option value="3">3</option>

							<option value="4">4</option>

							<option value="5">5</option>

							<option value="6">6</option>

							<option value="7">7</option>

							<option value="8">8</option>

							<option value="9">9</option>

							<option value="10">10</option>

							<option value="11">11</option>

							<option value="12">12</option>

					</select>월 &nbsp; <select class="mmdd">

							<option value="1">1</option>

							<option value="2">2</option>

							<option value="3">3</option>

							<option value="4">4</option>

							<option value="5">5</option>

							<option value="6">6</option>

							<option value="7">7</option>

							<option value="8">8</option>

							<option value="9">9</option>

							<option value="10">10</option>

							<option value="11">11</option>

							<option value="12">12</option>

							<option value="13">13</option>

							<option value="14">14</option>

							<option value="15">15</option>

							<option value="16">16</option>

							<option value="17">17</option>

							<option value="18">18</option>

							<option value="19">19</option>

							<option value="20">20</option>

							<option value="21">21</option>

							<option value="22">22</option>

							<option value="23">23</option>

							<option value="24">24</option>

							<option value="25">25</option>

							<option value="26">26</option>

							<option value="27">27</option>

							<option value="28">28</option>

							<option value="29">29</option>

							<option value="30">30</option>

							<option value="31">31</option>

					</select>일 &nbsp;</td>
					<td><div></div></td>
				</tr>
				<tr>
					<td></td>
					<td><button type="submit" value="submit" id="joinbutton">회원가입하기</button></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>