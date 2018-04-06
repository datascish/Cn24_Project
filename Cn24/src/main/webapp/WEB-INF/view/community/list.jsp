<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/menu.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
	$().ready(function() {
		$("#searchKeyword").keyup(function(event) {
			if (event.key == "Enter") {
				movePage('0');
			}
		});
	});
</script>

			<div>
				${pageExplorer.totalCount}건의 게시글이 검색되었습니다.
			</div>
			<table>
				<tr>
					<th>ID</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${pageExplorer.list}" var="community">
				<tr>
					<td>${community.id}</td>
					<td><a href="<c:url value="/read/${community.id}"/>">${community.title}</a>
						<c:if test="${not empty community.fileName}">
							<img src="<c:url value="/static/img/file.png"/>" alt="${community.fileName}"  style="width:15px;"/>
						</c:if>
					</td>
					<td>
						<c:choose>
							<c:when test="${not empty community.memberVO}">
								<!-- nickname(email) -->
								${community.memberVO.nickname}(${community.memberVO.email})
							</c:when>
							<c:otherwise>
								탈퇴한 회원
							</c:otherwise>
						</c:choose>
					</td>
					<td>${community.writeDate}</td>
					<td>${community.viewCount}</td>
				</tr>
				</c:forEach>
				<c:if test="${empty pageExplorer.list}">
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
				</c:if>
			</table>
			
			<form id="searchForm" onsubmit="movePage('0')">
				${pageExplorer.make()}
				<div>
					<select id="searchType" name="searchType">
						<option value="1" ${search.searchType eq 1 ? 'selected' : ''}> 글 제목 </option>
						<option value="2" ${search.searchType eq 2 ? 'selected' : ''}> 글 내용 </option>
						<option value="3" ${search.searchType eq 3 ? 'selected' : ''}> 글 제목 + 글 내용</option>
						<option value="4" ${search.searchType eq 4 ? 'selected' : ''}> 작성자 Nickname </option>
						<option value="5" ${search.searchType eq 5 ? 'selected' : ''}> 작성자 Email </option>
						<option value="6" ${search.searchType eq 6 ? 'selected' : ''}> 첨부파일 이름 </option>
					</select>
					<input type="text" id="searchKeyword" name="searchKeyword"
							value="${search.searchKeyword}" />
					<a href="<c:url value="/reset"/>">검색 초기화</a>
				</div>
			</form>
			
			<div>
				<a href="<c:url value="/write"/>">글쓰기</a>
			</div>
