<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
	// button click event
	$().ready(function() {
		$("#loginBtn").click(function() {
			$("#loginForm").attr({
				"action": "<c:url value="/login" />",
				"method": "post"
			}).submit();
		});
	});
</script>
	<form:form modelAttribute="loginForm">
	<!-- Wrapper box -->
	<div style="display:inline-block; margin: 0 auto; margin-left: 30%; margin-top: 30%;">
		
			<div style="display:inline-block;">
				<div>
					<input type="text" id="email" name="email" placeholder="Email"/>
				</div>
				<div style="display:inline-block;">
					<input  type="text" id="password" name="password" placeholder="Password" />
				</div>
			</div>
			<div>
				<input type="button" id="loginBtn" value="Login" />
			</div>
		</div>
		<div style="display:inline-block;">
			<a href="<c:url value="/regist"/>">회원가입</a>
		</div>
		<div style="display:inline-block; margin-left: 20px;">
			<a href="<c:url value="/find"/>">ID / PW 찾기</a>
		</div>
	
	</form:form>
