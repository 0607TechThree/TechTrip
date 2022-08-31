<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<tt:header />
	<div>
		관리자 등록페이지
	</div>
	<div>
		<form action="" method="post">
			<table>
				<tr>
					<th>구분</th>
					<th>입력</th>
				</tr>
				<tr>
					<td>숙소 종류</td>
					<td>
					<select>
					<option>호텔</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>지역</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>숙소명</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number"></td>
				</tr>
				<tr>
					<td>사장님한마디</td>
					<td><textarea style="resize:none" rows="4" cols="20"></textarea></td>
				</tr>
				<input type="hidden" value="">
				<tr>
					<td>입실날짜1 : </td>
					<td><input type="text" id="datepicker"></td>
				</tr>
				<tr>
					<td>퇴실날짜2 : </td>
					<td><input type="text" id="datepicker2"></td>
				</tr>
				<tr>
					<td><input type="submit" value="등록하기"></td>
				</tr>
			</table>
		</form>
	</div>
	<tt:footer />
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
</script>
</body>
</html>