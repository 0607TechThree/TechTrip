<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 | techTrip</title>
<!--  favicon -->
<link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
<!--  css link -->
<link rel="stylesheet" href="css/css.css" type="text/css">
<!--  font setting -->
<link rel="
	preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<tt:header />

<div id="paycontent">
	<div id="paytitle">
		<h2>결제 페이지</h2>
	</div>
	<div id="paytop">
		<div id="payleft">
			<img alt="${data.trname} 이미지" src="images/crawling/${data.trpk}.jpg" id="payimg">
		</div>
		<div id="payright">
			<div id="payname">
				${data.trname}
			</div>
			<div class="paycheckinout">
				체크인 날짜 : ${data.checkin}
			</div>
			<div class="paycheckinout">
				체크아웃 날짜 : ${data.checkout}
			</div>
			<br>
			<div id="payprice">
				금액 : ${data.trprice} 원
			</div>	
			<div>
				<button id="check_module" type="button">결제하기</button>
			</div>
		</div>
	</div>
</div>
	
<tt:footer />
<script>
	$("#check_module").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp77677562'); 
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'kakaopay',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '주문명 : ${data.trname}',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: ${data.trprice},
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: '${logininfo.tuid}',
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode: '123-456',
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				alert(msg);
				location.href="tbookinsert.do?tupk=${logininfo.tupk}&trpk=${data.trpk}";
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
				history.forward(-1);
			}
		});
	});
</script>
</body>
</html>