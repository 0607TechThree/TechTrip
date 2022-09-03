<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="type"%>
<%@ attribute name="tvpk"%>

<c:if test="${logininfo.tuid != null}">
	<form action="treviewinsert.do" method="post">
		<input type="hidden" name="tupk" value="${logininfo.tupk}">
		<input type="hidden" name="trpk" value="${data.trpk}">
		<input type="hidden" name="tstar" value="5">
		<!-- 페이징 처리
	<input type="hidden" name="cnt" value="${cnt}">
	 -->
		<c:choose>
			<c:when test="${type=='tboard'}">
				<input type="text" name="tboard">
				<div class="star-container" id="star">

					<span class="star">★</span> <span class="star">★</span> <span
						class="star">★</span> <span class="star">★</span> <span
						class="star">★</span>

				</div>
				<input type="submit" value="글 등록">
			</c:when>

			<c:when test="${type=='tpmsg'}">
				<input type="hidden" name="tvpk" value="${tvpk}">
		댓글: <input type="text" name="tpmsg" required>
				<input type="submit" value="댓글 등록">
			</c:when>
		</c:choose>
	</form>
</c:if>


<c:if test="${logininfo.tuid == null}">
	<c:choose>
		<c:when test="${type=='tboard'}">
			<input type="text" disabled value="등록하려면 로그인하세요!">
		</c:when>

		<c:when test="${type=='tpmsg'}">
		댓글: <input type="text" disabled value="등록하려면 로그인하세요!">
		</c:when>
	</c:choose>
</c:if>