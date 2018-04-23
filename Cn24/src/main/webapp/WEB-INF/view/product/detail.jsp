<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="/static/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="/static/js/bootstrap.min.js"></script>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>

<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />
<jsp:include page="/WEB-INF/view/template/menu.jsp" />

<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js'></script>

<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<style class="cp-pen-styles"></style>

<div id="contentForm">
	<div class="input-group input-group-sm" role="group" aria-label="...">
		<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th style="text-align:center;"><h1>${community.title}</h1></th>
			</tr>
		</thead>
			<h3>
				<c:choose>
					<c:when test="${not empty community.memberVO}">
						${community.memberVO.nickname}(${community.memberVO.email})
					</c:when>
					<c:otherwise>
						탈퇴한 회원 ${community.requestIp}
					</c:otherwise>
				</c:choose>
			</h3>
			
			<tbody>
				<tr>
					<td colspan="2">
						<p>
							${community.body}
						</p>
					</td>
				</tr>
			</tbody>
			</table>	
			<p>${product.writeDate}</p>
				<p></p>
				<c:if test="${not empty product.fileName}">
					<p><a href="<c:url value="/getPro/${product.id}"/>">${product.fileName}</a></p>
				</c:if>
			<hr style="size: 2px solid #e6ecff;"/>
			<div id="replies"></div>
			<div id="createReplyDiv">
				<div id="createReply">
					<form id="writeReplyForm">
						<input type="hidden" id="parentReplyId" name="parentReplyId" value="0 " />
						<div>
							<textarea class="form-control" rows="3" id="body" name="body"></textarea>
						</div>
						<div class="btn-group btn-group-sm" role="group" aria-label="..." style="margin-top: 2px;">
							<input class="btn btn-default" type="button" id="writeReplyBtn" value="등록" />
						</div>
					</form>
				</div>
			</div>
			
			<div>
				<div class="btn-group btn-group-sm" role="group" aria-label="..."><a href="<c:url value="/list"/>"><input type="button" class="btn btn-default" value="뒤로"  /></a></div>
				<div class="btn-group btn-group-sm" role="group" aria-label="..."><a href="<c:url value="/recommend/${product.id}"/>"><input type="button" class="btn btn-default" value="추천하기"  /></a></div>
				<c:if test="${sessionScope.__USER__.id == product.memberVO.id}">
					<div class="btn-group btn-group-sm" role="group" aria-label="..."><a href="<c:url value="/modify/${product.id}"/>"><input type="button" class="btn btn-default" value="수정하기"  /></a></div>
					<div class="btn-group btn-group-sm" role="group" aria-label="..."><a href="<c:url value="/list"/>"><input type="button" class="btn btn-default" value="목록으로"  /></a></div>
					<div class="btn-group btn-group-sm" role="group" aria-label="..."><a href="<c:url value="/remove/${product.id}"/>"><input type="button" class="btn btn-default" value="상품글 삭제"  /></a></div>
				</c:if>
			</div>
	</div>
</div>