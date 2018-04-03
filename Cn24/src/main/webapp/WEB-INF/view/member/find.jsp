<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>http://www.cn24.com/find</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/link.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/input.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/wrapper.css"/>" />
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		
	});
</script>
</head>
<body>
	<div class="wrapper">
		<div style="margin: 25% 5%; margin-left: 25%;  margin-bottom: 0px;">
			<div>
				이름
				<input type="text" id="name" 
						name="name" placeholder="Name"
						value="${memberVO.name}" />
				<div>
					<form:errors path="name" />
				</div>
			</div>
			<div>
				이메일
				<input type="text" id="email" 
						name="email" placeholder="Email"
						value="${memberVO.email}" />
				<div>
					<form:errors path="email" />
				</div>
			</div>
		</div>
		<hr />
		<div style="margin: 5%; margin-left: 25%;">
			<div >
				이름 
				<input type="text" id="name" 
						name="name" placeholder="Name"
						value="${memberVO.name}" />
				<div>
					<form:errors path="name" />
				</div>
			</div>
			<div>
				아이디
				<input type="text" id="userId" 
						name="userId" placeholder="userId"
						value="${memberVO.userId}" />
				<div>
					<form:errors path="userId" />
				</div>
			</div>
			<div>
				이메일
				<input type="text" id="email" 
						name="email" placeholder="Email"
						value="${memberVO.email}" />
				<div>
					<form:errors path="email" />
				</div>
			</div>
		</div>
		<div>
			<a href="<c:url value="/login"/>">돌아가기</a>
		</div>
	</div>
</body>
</html>