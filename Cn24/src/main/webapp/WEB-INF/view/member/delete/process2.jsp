<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<link type="text/css" rel="stylesheet" href="<c:url value="/static/css/delete.css"/>"/>
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
	$().ready(function() {
		$("#deleteBtn").click(function() {
			location.href="<c:url value="/account/delete/y?token=${token}"/>";
		});

		$("#ndeleteBtn").click(function() {
			location.href="<c:url value="/account/delete/n?token=${token}"/>";
		});
		$("#cancelBtn").click(function() {
			location.href="<c:url value="/list"/>";
		});
		$("#myCommunities").click(function() {
			// Popup 띄우기
			window.open("<c:url value="/mypage/communities"/>",
					"My Communities",
					"width=500px, height=500px, scrollbars=yes, resizable=no");
		});
	});
</script>

		<div id="progress">
			<ul>
				<li class="active">본인확인</li>
				<li class="active">게시글 삭제</li>
				<li>탈퇴 완료</li>
			</ul>
		</div>
		
		<div class="box" >
			<p style="text-align: center;">
				<span id="myCommunities">
					${sessionScope.__USER__.nickname}님의 게시글이
					${myCommunitiesCount}개 있습니다.	
				</span>
			</p>
			<p style="text-align: center;">
				모든 게시글을 삭제하시겠습니까?
			</p>
			<div style="text-align: center;">
				<div id="deleteBtn" class="button">삭제합니다.</div>
				<div id="ndeleteBtn" class="button">삭제하지 않습니다.</div>
				<div id="cancelBtn" class="button">홈으로</div>
			</div>
		</div>
