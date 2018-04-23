<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="/static/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/login.css"/>" />

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
	$().ready(function() {
		$(".login-button").click(function() {
			$("#forgotForm").attr({
				"action": "<c:url value="/find" />",
				"method": "post"
			}).submit();
		});
	});
</script>

<!-- FORGOT PASSWORD FORM -->
<div class="text-center" style="padding:50px 0; margin: 10%;">
	<div class="logo" style="padding-left: 10px;">forgot password</div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form:form id="forgotForm" class="text-left">
			<div class="etc-login-form">
				<p style="margin-left: 20px;">가입하신 이메일을 적어주세요.</p>
			</div>
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<input type="text" class="form-control" id="fp_email" name="fp_email" placeholder="Email address">
					</div>
				</div>
				<button type="button" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<p>이미 회원이신가요? <a href="<c:url value="/login"/>">login here</a></p>
				<p>새로 오셨나요? <a href="<c:url value="/regist"/>">create new account</a></p>
			</div>
		</form:form>
	</div>
	<!-- end:Main Form -->
</div>
