<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
	$().ready(function() {
		
	});
</script>

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
				핸드폰 번호
				<input type="text" id="phone" 
						name="phone" placeholder="Phone"
						value="${memberVO.phone}" />
				<div>
					<form:errors path="phone" />
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
				닉네임
				<input type="text" id="nickname" 
						name="nickname" placeholder="Nickname"
						value="${memberVO.nickname}" />
				<div>
					<form:errors path="nickname" />
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
