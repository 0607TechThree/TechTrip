<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>host등록 | techTrip</title>
<!--  favicon -->
<link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
<!--  css link -->
<link rel="stylesheet" href="css/css.css" type="text/css">
<!--  font setting -->
<link rel="
	preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<style type="text/css">
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}
</style>
<body>
	<tt:header />
	<div id="hostTitle">
		<h2>
			관리자 등록페이지
		</h2>
	</div>
	<div>
		<form action="troominsert.do" method="post">
				<input type="hidden" value="${logininfo.tupk}" name="tupk">
			<table id="hostTable">
				<tr>
					<th>구분</th>
					<th>입력</th>
				</tr>
				<tr>
					<td>숙소 종류</td>
					<td>
					<select name="trcategory">
					<option>호 텔</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>지역</td>
					<td>
					<select name="trregion">
						<option>서울</option>
						<option>경기</option>
						<option>인천</option>
						<option>호남</option>
						<option>강원</option>
						<option>부산</option>
						<option>제주</option>
					</select>
					</td>
				</tr>
				<tr class="">
					<td></td>
					<td>
						<input type="text" id="sample6_postcode" name="traddresszipcode"
						placeholder="우편번호" readonly>
						<a class="sample6" href="javascript:sample6_execDaumPostcode();">우편번호 찾기</a>
					</td>
				</tr>
				<tr>
					<td class=""><div>주 소</div></td>
					<td>
						<input type="text" name="1traddress"
						id="sample6_address" placeholder="주소" readonly>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>	
						<input name="traddressdetail"
						type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목"
						readonly>
					</td>
				</tr>
				<tr>
					<td><div>주소</div></td>
					<td><input type="text" name="traddress"></td>
				</tr>
				<tr>
					<td>숙소명</td>
					<td><input type="text" name="trname"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="trpice"></td>
				</tr>
				<tr>
					<td>사장님한마디</td>
					<td><textarea style="resize:none" rows="4" cols="20" name="trinfo"></textarea></td>
				</tr>
				<tr>
					<td>입실날짜 : </td>
					<td><input type="text" id="datepicker" name="checkin"></td>
				</tr>
				<tr>
					<td>퇴실날짜 : </td>
					<td><input type="text" id="datepicker2" name="checkout"></td>
				</tr>
				<tr>
					<td>
    					<label for="file">파일</label> 
    					<input type="file" id="file" name="file"> 
    					<a id="btn_submit" onclick="javascript:fn_submit()">전송</a>    
					</td>
 
       				<td class="img_wrap">
           				<img id="img" />
       				</td>

				</tr>
				<tr>
					<td><input class="reg_btn" type="submit" value="등록하기"></td>
				</tr>
			</table>
		</form>
	</div>
	<tt:footer />
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$( "#datepicker" ).datepicker();
// id가 datepicker인 태그를 datepicker로 설정
$( "#datepicker2" ).datepicker();
// id가 datepicker2인 태그를 datepicker로 설정

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
    ,minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    ,maxDate: "+7D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
});
$('#datepicker').datepicker('setDate', 'today');
// 초기 세팅 날짜
$('#datepicker2').datepicker('setDate', '+1D');
// 초기 세팅 날짜

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
//이미지 미리보기
var sel_file;

$(document).ready(function() {
    $("#file").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

    filesArr.forEach(function(f) {
        if (!f.type.match(reg)) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}
//파일 업로드
function fn_submit(){
        
        var form = new FormData();
        form.append( "file", $("#file")[0].files[0] );
        
         jQuery.ajax({
             url : "${pageContext.request.contextPath}/imgresult"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
               alert("성공하였습니다.");
               console.log(response);
           }
           ,error: function (jqXHR) 
           { 
               alert(jqXHR.responseText); 
           }
       });
}
</script>
</body>
</html>