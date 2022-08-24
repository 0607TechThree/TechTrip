<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="header">
	<img alt="로고" src="images/headlogo.png" id="logoimage">
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