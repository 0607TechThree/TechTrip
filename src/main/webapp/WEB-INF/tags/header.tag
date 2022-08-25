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
	<div id="headersearch">
		<img alt="검색하기" src="images/search.png" class="searchbtn">&nbsp;
		<input type="text" id="searchbox" placeholder="&nbsp;숙소명">
	</div>
	<div id="headerright">
		<img alt="검색하기" src="images/search.png" class="searchbtn">&nbsp;
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