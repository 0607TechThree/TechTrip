<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="type"%>
<%@ attribute name="tvpk"%>
<%@ attribute name="tstar"%>

<c:if test="${logininfo.tuid != null}">
		<c:choose>
			<c:when test="${type=='tboard' && tbookvo.tupk == logininfo.tupk}">
				<form action="treviewinsert.do" method="post">
					<input type="hidden" name="tupk" value="${logininfo.tupk}">
					<input type="hidden" name="trpk" value="${data.trpk}">
				<input type="text" name="tboard">
				<span class="star-input">
  					<span class="input">
						<input type="radio" name="star-input" value="1" id="p1"><label for="p1">1</label>
						<input type="radio" name="star-input" value="2" id="p2"><label for="p2">2</label>
						<input type="radio" name="star-input" value="3" id="p3"><label for="p3">3</label>
						<input type="radio" name="star-input" value="4" id="p4"><label for="p4">4</label>
						<input type="radio" name="star-input" value="5" id="p5"><label for="p5">5</label>
						<input type="radio" name="star-input" value="6" id="p6"><label for="p6">6</label>
    					<input type="radio" name="star-input" value="7" id="p7"><label for="p7">7</label>
    					<input type="radio" name="star-input" value="8" id="p8"><label for="p8">8</label>
    					<input type="radio" name="star-input" value="9" id="p9"><label for="p9">9</label>
    					<input type="radio" name="star-input" value="10" id="p10"><label for="p10">10</label>
					</span>
					<output for="star-input" name="tstar"><b>0</b>점</output>
				</span>
				<input type="submit" value="글 등록">
				</form>
			</c:when>
			<c:when test="${type=='tpmsg' && logininfo.tupk == data.tupk}">
			<form action="treplyinsert.do" method="post">
					<input type="hidden" name="trpk" value="${data.trpk}">
					<input type="hidden" name="tupk" value="${logininfo.tupk}">
					<input type="hidden" name="tvpk" value="${tvpk}">
		댓글: <input type="text" name="tpmsg" required>
				<input type="submit" value="댓글 등록">
			</form>
			</c:when>
		</c:choose>
</c:if>

<c:choose>
<c:when test="${logininfo.tuid == null}">
	<c:choose>
		<c:when test="${type=='tboard'}">
			<input type="text" disabled value="등록하려면 로그인하세요!">
		</c:when>

		<c:when test="${type=='tpmsg'}">
		댓글: <input type="text" disabled value="등록하려면 로그인하세요!">
		</c:when>
	</c:choose>
</c:when>

<c:when test="${tbookvo.tupk != logininfo.tupk && logininfo.tupk != data.tupk}">
	<c:choose>
		<c:when test="${type=='tboard'}">
			<input type="text" disabled value="예약자만 등록 가능합니다!">
		</c:when>

		<c:when test="${type=='tpmsg'}">
		댓글: <input type="text" disabled value="예약자만 등록 가능합니다!">
		</c:when>
	</c:choose>
</c:when>
</c:choose>