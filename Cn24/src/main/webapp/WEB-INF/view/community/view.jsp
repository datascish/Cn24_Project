<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/menu.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<h1>${community.title}</h1>

<h3>
	<c:choose>
		<c:when test="${not empty community.memberVO}">
						${community.memberVO.nickname}(${community.memberVO.email})  ${community.requestIp}
					</c:when>
		<c:otherwise>
						탈퇴한 회원 ${community.requestIp}
					</c:otherwise>
	</c:choose>
</h3>

<p>${community.viewCount}| ${community.recommendCount} |
	${community.writeDate}</p>
<p></p>
<c:if test="${not empty community.fileName}">
	<p>
		<a href="<c:url value="/get/${community.id}"/>">${community.fileName}</a>
	</p>
</c:if>
<p>${community.body}</p>
<hr />
<div id="replies"></div>
<div id="createReplyDiv">
	<div id="createReply">
		<form id="writeReplyForm">
			<input type="hidden" id="parentReplyId" name="parentReplyId"
				value="0 " />
			<div>
				<textarea id="body" name="body"></textarea>
			</div>
			<div>
				<input type="button" id="writeReplyBtn" value="등록" />
			</div>
		</form>
	</div>
</div>
<a href="<c:url value="/"/>">뒤로</a>
<a href="<c:url value="/recommend/${community.id}"/>">추천하기</a>
<c:if test="${sessionScope.__USER__.id == community.memberVO.id}">
	<a href="<c:url value="/modify/${community.id}"/>">수정하기</a>
	<a href="<c:url value="/"/>"> 목록으로 </a>
	<a href="<c:url value="/remove/${community.id}"/>">게시글 삭제</a>
</c:if>