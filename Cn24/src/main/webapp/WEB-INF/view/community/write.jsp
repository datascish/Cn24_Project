<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/bootstrap.min.css"/>" />
<!------ Include the above in your HEAD tag ---------->

<!-- All the files that are required -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.js"/>"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />
<jsp:include page="/WEB-INF/view/template/menu.jsp" />

<style>
    #contentForm {
      width: 40%;
      margin: 0 auto;
      padding-top: 12%;
    }
 
    .table > thead > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
    }
 </style>

<script type="text/javascript">
	$().ready(function() {
	<c:if test="${mode == 'modify' && not empty community.fileName}">
		$("#file").closest("div").hide();
	</c:if>
	
	$("#fileName").change(function() {
		var isChecked = $(this).prop("checked");
		if (isChecked) {
			$("label[for=fileName]").css({
				"text-decoration-line": "line-through",
				"text-decoration-style": "double",
				"text-decoration-color": "#F00"
			});
			$("#file").closest("div").show();
		}
		else {
			$("label[for=fileName]").css({
				"text-decoration": "none"
			});
			$("#file").closest("div").hide();
		}
	});
	
	$("#writeBtn").click(function() {
		
		var mode = "${mode}";
		if (mode == "modify") {
			var url = "<c:url value="/modify/${community.id}"/>";
		}
		else {
			var url = "<c:url value="/write"/>";
		}
		var writeForm = $("#writeForm");
		writeForm.attr({
			"method" : "post",
			"action" : url
		});
		writeForm.submit();
	});

});
</script>

<form:form modelAttribute="writeForm" enctype="multipart/form-data">
	<div id="contentForm">
		<div class="input-group input-group-sm" role="group" aria-label="...">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
				<th style="padding-top: 15px" style="text-align: center;">제목</th> 
					<td>
						<input type="text" id="title" name="title" value="${community.title}"  class="form-control" aria-describedby="basic-addon1"/>
					</td>
				</tr>
			</thead>
			<div>
				<form:errors path="title" />
			</div>
			<tbody>
				<tr>
					<td colspan="2">
						<div>
							<textarea class="form-control" rows="20" cols="50" id="body" name="body">${community.body}</textarea>
						</div>
					</td>
				</tr>
			</tbody>
			
			<!-- /modify로 접근했을 때 -->
			<c:if
				test="${mode == 'modify' && not empty community.fileName}">
				<div>
					<input type="checkbox" id="fileName" name="fileName"
						value="${community.fileName}" /> <label
						for="fileName"> ${community.fileName} </label>
				</div>
			</c:if>
			<tr>
				<th>첨부파일</th>
				<td>
					<div>
						<input type="file" id="file" name="file" class="btn btn-default" />
					</div>
				</td>
			</tr>
			</table>
			</div>
			
			<div>
				<input type="hidden" id="userId" name="userId"
					value="${sessionScope.__USER__.id}" />
			</div>
		
			<div>
				<form:errors path="writeDate" />
			</div>
			
		
		
		<div class="btn-group btn-group-sm" role="group" aria-label="..." style="margin-left: 30%;">
			<input class="btn btn-default" type="button" id="writeBtn" value="등록"  />
		</div>
		<div class="btn-group btn-group-sm" role="group" aria-label="..." >
			<a href="<c:url value="/list"/>"><input class="btn btn-default" type="button" id="listBtn" value="목록으로"  /></a>
		</div>
	</div>
</form:form>
