<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/menu.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
	$().ready(function() {
		
	});
</script>

<!-- 제품 리스트 (이미지 + 제품 이름) -->

		<div>
			<h1>main</h1>
			<div>
			<a href="<c:url value=""/>">구매 제품 목록</a>
			</div>
			<div>
			<a href="<c:url value="/list"/>">커뮤니티 게시판</a>
			</div>
		</div>
