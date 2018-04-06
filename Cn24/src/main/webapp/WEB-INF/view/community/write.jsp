<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/menu.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
	$().ready(function() {
		// 
		
		$("#writeBtn").click(function() {
			writeForm.attr({
				"method" : "post",
				"action" : "<c:url value="/list"/>"
			});
			writeForm.submit();
		});
		
	});
</script>

<form:form modelAttribute="writeForm" enctype="multipart/form-data">
	<div>
		제목 <input type="text" id="title" name="title"
			value="${communityVO.title}" />
	</div>
	<div>
		<form:errors path="title" />
	</div>
	<div>
		<textarea rows="10" cols="50" id="body" name="body">${communityVO.body}</textarea>
	</div>
	<!-- /modify로 접근했을 때 -->
	<c:if
		test="${mode == 'modify' && not empty communityVO.fileName}">
		<div>
			<input type="checkbox" id="fileName" name="fileName"
				value="${communityVO.fileName}" /> <label
				for="fileName"> ${communityVO.fileName} </label>
		</div>
	</c:if>
	<div>
		<form:errors path="body" />
	</div>
	<div>
		<input type="hidden" id="userId" name="userId"
			value="${sessionScope.__USER__.id}" />
	</div>

	<div>
		<form:errors path="writeDate" />
	</div>

	<div>
		<input type="file" id="file" name="file" />
	</div>

	<div>
		<input type="button" id="writeBtn" value="등록" />
	</div>
</form:form>
