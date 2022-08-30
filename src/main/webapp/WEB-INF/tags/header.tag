<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="header">
	<div id="menulogo">
		<div id="menuwrapper">
			<img alt="전체메뉴" src="images/menu_white.png" id="menu" class="accordion">
			<ul id="menulist">
				<li class="mlist"><a>전체상품보기</a></li>
				<li class="mlist"><a>서울</a></li>
				<li class="mlist"><a>경기</a></li>
				<li class="mlist"><a>인천</a></li>
				<li class="mlist"><a>호남</a></li>
				<li class="mlist"><a>강원</a></li>
				<li class="mlist"><a>부산</a></li>
				<li class="mlist"><a>제주</a></li>
			</ul>
		</div>
		<img alt="로고" src="images/headlogo.png" id="logoimage">
	</div>
	<div id="headersearch" style="display: none">
		<img alt="검색하기" src="images/search.png" class="searchbtn" id="sbtn1">&nbsp;
		<input type="text" id="searchbox" placeholder="&nbsp;숙소명">
	</div>
	<div id="headerright">
		<img alt="검색하기" src="images/search.png" class="searchbtn" id="sbtn2">&nbsp;
		<c:choose>
			<c:when test="${mid != null}">
				<a href="logout.do">logout</a>&nbsp;
				<a href="mypage.do">mypage</a>
			</c:when>
			<c:otherwise>
				<a href="login.jsp">login</a>&nbsp;
				<a href="join.jsp">join</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script>
        
	$(".accordion").click(function() {               
		$("#menulist").slideToggle();
	});
	$("#sbtn2").click(function(){
		$("#headerright").hide();
		$("#headersearch").slideToggle();
	});
	$("#sbtn1").click(function(){
		$("#headersearch").hide();
		$("#headerright").slideToggle();
	});
        
        
</script>