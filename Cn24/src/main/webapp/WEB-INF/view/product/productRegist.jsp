<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/bootstrap.min.css"/>" />
<!------ Include the above in your HEAD tag ---------->

<!-- All the files that are required -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.js"/>"></script>

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
	
	$("#addBtn").click(function() {
		var url = "<c:url value="/productRegist"/>";
		 $("#proForm").attr({
			"method" : "post",
			"action" : url
		}).submit();
	});

});
</script>

<form:form modelAttribute="proForm" enctype="multipart/form-data">
	<div id="contentForm">
		<div class="input-group input-group-sm" role="group" aria-label="...">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
				<th style="padding-top: 15px" style="text-align: center;">상품 이름</th> 
					<td>
						<input type="text" id="productName" name="productName" value="${product.productName}"  class="form-control" aria-describedby="basic-addon1"/>
					</td>
				</tr>
			</thead>
			<div>
				<form:errors path="productName" />
			</div>
			<tbody>
				<tr>
					<td colspan="2">
						<div>
							가격<textarea class="form-control" rows="1"  id="productPrice" name="productPrice">${product.productPrice}</textarea>
						</div>
						<div>
							상품 설명<textarea class="form-control" rows="20" cols="30" id="productDesc" name="productDesc">${product.productDesc}</textarea>
						</div>
					</td>
				</tr>
			</tbody>
			
			<!-- /edit로 접근했을 때 -->
			<c:if test="${edit == 'edited' && not empty product.productUrl}">
				<div>
					<input type="checkbox" id="productUrl" name="productUrl"
						value="${product.productUrl}" /> <label
						for="productUrl"> ${product.productUrl} </label>
				</div>
			</c:if>
			<tr>
				<th>상품 이미지</th>
				<td>
					<div>
						<input type="file" id="productUrl" name="productUrl" class="btn btn-default" />
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
				<form:errors path="productRegistDate" />
			</div>
		
		
		<div class="btn-group btn-group-sm" role="group" aria-label="..." style="margin-left: 15%;">
			<input class="btn btn-default" type="button" id="addBtn" value="상품 등록"  />
		</div>
		<div class="btn-group btn-group-sm" role="group" aria-label="..." >
			<a href="<c:url value="/product"/>"><input class="btn btn-default" type="button" id="listBtn" value="목록으로"  /></a>
		</div>
		<div class="btn-group btn-group-sm" role="group" aria-label="..." >
			<a href="<c:url value="/edit/${product.id}"/>"><input class="btn btn-default" type="button" id="editBtn" value="수정"  /></a>
		</div>
	</div>
</form:form>