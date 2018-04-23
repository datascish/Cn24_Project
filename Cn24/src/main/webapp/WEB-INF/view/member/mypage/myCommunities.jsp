<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
	$().ready(function() {
		$("#toggle").change(function() {
			var checked = $(this).prop("checked");
			var checkbox = $("input[type=checkbox][name=delete]");
			// 일괄 변경
			// checkbox.prop("checked",checked);
			
			// 선택 반전
			checkbox.each(function(index, checkbox) { // 순회 - for:each
				var checked = $(checkbox).prop("checked"); // html tag를 jquery로 변경 : checkbox -> $(checkbox)
				$(checkbox).prop("checked", !checked);
			});
		});
		
		$("input[type=checkbox][name=delete]").change(function() {
			// 체크박스에 체크가 된 것만 가져오기
			var checkedLength = $("input[type=checkbox][name=delete]:checked").length;
			// 전체 체크박스 개수 가져오기
			var checkboxLength = $("input[type=checkbox][name=delete]").length;
			
			if (checkedLength == checkboxLength) {
				// 전체 체크박스를 선택했다면
				$("#toggle").prop("checked", true);
			}
			else {
				$("#toggle").prop("checked", false);
			}
		});
		
		$("#massDeleteBtn").click(function() {
			$("#massDeleteForm").attr({
				"method": "post",
				"action": "<c:url value="/mypage/communities/delete" />"
			}).submit();
		});
	});
</script>

<div id="popup-wrapper">
		<h1 class="title">My Community</h1>
		
		<div>
			<table class="grid" style="width:100%">
				<colgroup>
					<col style="width: 5%"/>
					<col style="width: 90%"/>
					<col style="width: 5%"/>
				</colgroup>
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>
							<input type="checkbox" id="toggle" />
						</th>
					</tr>
				</thead>
				<tbody>
					<form id="massDeleteForm">
						<c:forEach items="${myCommunities}" var="community">
							<tr>
								<td>${community.id}</td>
								<td>${community.title}</td>
								<td>
									<input type="checkbox" name="delete" value="${community.id}" />
								</td>
							</tr>
						</c:forEach>
					</form>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">
							<input type="button" id="massDeleteBtn" value="일괄삭제" />
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>