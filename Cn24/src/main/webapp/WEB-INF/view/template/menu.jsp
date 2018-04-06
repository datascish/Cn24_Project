<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<!-- 닉네임(이메일), 카테고리(main, community, myPage, deal - 카트, 주문/배송, 고객센터 ) 회원가입/login or logout,  -->
<script type="text/javascript">
	$().ready(function() {
		
	});
</script>
<ul style="display: inline-block; margin: 0px;">
	
	<li style="display: inline-block;"><a
		href="<c:url value="/main" />">홈으로</a></li>
	
	<li style="display: inline-block;"><a
		href="<c:url value="/list" />">Community</a></li>
	
	<li style="display: inline-block;"><a
		href="<c:url value="/" />">MyPage</a></li>
		
	<li style="display: inline-block;"><a
		href="<c:url value="/" />">카트</a></li>
	
	<li style="display: inline-block;"><a
		href="<c:url value="/" />">주문 / 배송</a></li>
	
	<li style="display: inline-block;"><a
		href="<c:url value="/" />">고객센터</a></li>

	<c:if test="${empty sessionScope.__USER__}">
		<li style="display: inline-block;"><a
		href="<c:url value="/regist" />">회원가입</a></li>
		<li style="display: inline-block;"><a
			href="<c:url value="/login" />"> / Login</a></li>
	</c:if>
	
	<c:if test="${not empty sessionScope.__USER__}">
		<li>(${sessionScope.__USER__.nickname}님) <a
			href="<c:url value="/logout" />"> Logout</a> <a
			href="<c:url value="/delete/process1"/>">탈퇴</a>
		</li>
	</c:if>
</ul>





