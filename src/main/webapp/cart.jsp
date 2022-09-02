<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 | techTrip</title>
<!--  favicon -->
<link rel="icon" type="image/x-icon" href="images/fav/favicon.jpg" />
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
	<div>
		카트페이지다~
	</div>
	<div>
		<c:if test="${cartlist.size() != 0}">
		<c:forEach var="cartlist" items="${cartlist}">
			${cartlist.trname}
			${cartlist.trprice}
		</c:forEach>
		</c:if>
		<c:if test="${cartlist.size() == 0}">
			장바구니 목록이 존재 x
		</c:if>
	</div>
	<tt:footer />

	<script type="text/javascript">
		
	</script>
</body>
</html>