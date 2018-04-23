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
      background-color: #F6CED8;
      text-align: center;
    }
</style>

<script type="text/javascript">
	$().ready(function() {
		loadReplies(0);
		function loadReplies(scrollTop) {
			$.get("<c:url value="/api/reply/${community.id}"/>", {}, 
					function(response) {
						console.log(response);
						for (var i in response) {
							appendReplies(response[i]); // 전체 댓글 목록 불러오기
					}
					$(window).scrollTop(scrollTop);
			});
		}
		
		$("#writeReplyBtn").click(function() {
			$.post("<c:url value="/api/reply/${community.id}" />",
					$("#writeReplyForm").serialize(), 
					function(response) {
						if (response.status) {
							show("댓글 등록 됨");
							
							$("#parentReplyId").val("0");
							$("#body").val("");
							
							$("#createReply").appendTo($("#createReplyDiv"));
							//appendReplies(response.reply); // 내가 작성한 하나의 댓글 불러오기
							var scrollTop = $(window).scrollTop();
							
							$("#replies").html("");
							loadReplies();
						}
						else {
							alert("등록에 실패했습니다. 잠시 후에 다시 시도하세요.");
						}
			});
		});
		
		// shadow-dom은 dom을 통해 접근해야 함
		// $("dom").on("click","shadow-dom", function() {});
		$("#replies").on("click", ".re-reply", function() {
			var parentReplyId = $(this).closest(".reply").data("id");
			$("#parentReplyId").val(parentReplyId);
			
			// $("dom").appendTo() : 현재 위치로 dom을 옮겨라
			$("#createReply").appendTo($(this).closest(".reply"));
		});
		
		function appendReplies(reply) {
			var replyDiv = $("<div class='reply' style='padding-left: " + ((reply.level-1)*20) + "px;' data-id='"+ reply.id + "'></div>");
			
			var nickname = reply.memberVO.nickname + "(" 
					+ reply.memberVO.email + ")";
			var top = $("<span class='writer'>"+ nickname + "</span><span class='regist-date'>"
					+ reply.registDate + "</span>");
			replyDiv.append(top);
			
			var body = $("<div class='body'>"+ reply.body + "</div>");
			replyDiv.append(body);
			
			var registReReply = $("<div class='re-reply'>댓글 달기</div>");
			replyDiv.append(registReReply);
			
			$("#replies").append(replyDiv);
			
		}
	});
</script>

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
			<p>조회수 ${community.viewCount}	| 추천수 ${community.recommendCount} | ${community.writeDate}</p>
				<p></p>
				<c:if test="${not empty community.fileName}">
					<p><a href="<c:url value="/get/${community.id}"/>">${community.fileName}</a></p>
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
				<div class="btn-group btn-group-sm" role="group" aria-label="..."><a href="<c:url value="/recommend/${community.id}"/>"><input type="button" class="btn btn-default" value="추천하기"  /></a></div>
				<c:if test="${sessionScope.__USER__.id == community.memberVO.id}">
					<div class="btn-group btn-group-sm" role="group" aria-label="..."><a href="<c:url value="/modify/${community.id}"/>"><input type="button" class="btn btn-default" value="수정하기"  /></a></div>
					<div class="btn-group btn-group-sm" role="group" aria-label="..."><a href="<c:url value="/list"/>"><input type="button" class="btn btn-default" value="목록으로"  /></a></div>
					<div class="btn-group btn-group-sm" role="group" aria-label="..."><a href="<c:url value="/remove/${community.id}"/>"><input type="button" class="btn btn-default" value="게시글 삭제"  /></a></div>
				</c:if>
			</div>
	</div>
</div>