<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/login.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/bootstrap.min.css"/>" />
<!------ Include the above in your HEAD tag ---------->

<!-- All the files that are required -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.js"/>"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
// button click event
$().ready(function() {
		$(".login-button").click(function() {
			$("#loginForm").attr({
				"action": "<c:url value="/login" />",
				"method": "post"
			}).submit();
		});
});
</script>

<!-- Where all the magic happens -->
<!-- LOGIN FORM -->
<div class="text-center" style="padding:50px 0; margin: 10%;">
	<div class="logo">login</div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form:form id="loginForm" class="text-left">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="email" class="sr-only">Email</label>
						<input type="text" class="form-control" id="email" name="email" placeholder="Email">
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Password</label>
						<input type="text" class="form-control" id="password" name="password" placeholder="password">
					</div>
					<div class="form-group login-group-checkbox">
						<input type="checkbox" id="remember" name="remember">
						<label for="remember">remember</label>
					</div>
				</div>
				<button type="button" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<p>비밀번호가 생각이 안나세요? <a href="<c:url value="/find"/>">click here</a></p>
				<p>새로 오셨나요? <a href="<c:url value="/regist" />">create new account</a></p>
			</div>
		</form:form>
	</div>
	<!-- end:Main Form -->
</div>

