<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>http://www.cn24.com</title>
</head>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/button.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/input.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/link.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/wrapper.css"/>" />
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
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
<body>
	<form:form modelAttribute="loginForm">
	<!-- Wrapper box -->
	<div style="display:inline-block; margin: 0 auto; margin-left: 30%; margin-top: 30%;">
		<div class="wrapper">
			<div style="display:inline-block;">
				<div>
					<input type="text" id="userId" name="userId" placeholder="ID"/>
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
	</div>
	</form:form>
</body>
</html>