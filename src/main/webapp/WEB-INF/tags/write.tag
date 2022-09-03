<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="type"%>
<%@ attribute name="tvpk"%>
<%@ attribute name="tstar"%>

<c:if test="${logininfo.tuid != null}">
	<form action="treviewinsert.do" method="post">
		<input type="hidden" name="tupk" value="${logininfo.tupk}">
		<input type="hidden" name="trpk" value="${data.trpk}">
		<input type="hidden" name="tstar" id="tstar" value="">
		<!-- 페이징 처리
	<input type="hidden" name="cnt" value="${cnt}">
	 -->
		<c:choose>
			<c:when test="${type=='tboard'}">
				<input type="text" name="tboard">
				<span class="star-input">
  					<span class="input">
						<input type="radio" name="star-input" value="1" id="p1"><label for="p1">1</label>
						<input type="radio" name="star-input" value="2" id="p2"><label for="p2">2</label>
						<input type="radio" name="star-input" value="3" id="p3"><label for="p3">3</label>
						<input type="radio" name="star-input" value="4" id="p4"><label for="p4">4</label>
						<input type="radio" name="star-input" value="5" id="p5"><label for="p5">5</label>
					</span>
					<output for="star-input" name="tstar"><b>0</b>점</output>
				</span>
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