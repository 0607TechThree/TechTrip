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
</head>
<body>
<tt:header />

<div id="roomdetailcontent">
	<div id="rctop">
		<div class="rctc">
			<img alt="${data.trname} 이미지" src="images/crawling/${data.trpk}.jpg">
		</div>
		<div class="rctc">
			<div>
				${data.trname}
			</div>
			<div>
				${data.trprice}
			</div>
			<div>
				날짜 (데이터피커)
			</div>
			<div>
				${data.traddress}
			</div>
			<div>
				사장님 한마디: ${data.trinfo}
			</div>
			<div>
				예약버튼
			</div>
			<div>
				장바구니버튼
			</div>
			<div>
				찜버튼
			</div>
		</div>
	</div>
	<div id="rcbottom">
		<div id="rcbc">
			내용
		</div>
	</div>
</div>
	
<tt:footer />
	<script type="text/javascript">
		
	</script>
</body>
</html>