<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/bootstrap.min.css"/>" />
<!------ Include the above in your HEAD tag ---------->

<!-- All the files that are required -->
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'>
<style class="cp-pen-styles"></style>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.js"/>"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />
<jsp:include page="/WEB-INF/view/template/menu.jsp" />

<style>
    #container {
      width: 70%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #A9E2F3;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
      text-align: center;
    }
     
    .hit {
      animation-name: blink;
      animation-duration: 1.5s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
     
    /* 애니메이션 지점 설정하기 */
    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
  </style>


<script type="text/javascript">
	$().ready(function() {
		$("#searchKeyword").keyup(function(event) {
			if (event.key == "Enter") {
				movePage('0');
			}
		});
	});
</script>
	<div id="container">
		<div align="right">
			<div id="list" style="font-size: 11pt;">
				${pageExplorer.totalCount}건의 게시글이 검색되었습니다.
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="10%">ID</th>
						<th width="50%">제목</th>
						<th width="10%">작성자</th>
						<th width="20%">작성일</th>
						<th width="10%">조회수</th>
					</tr>
				</thead>
				<tbody>
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
				</tbody>
			</table>
			
			<form id="searchForm" onsubmit="movePage('0')">
				${pageExplorer.make()}
				<div id="list" style="font-size: 10pt;">
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
			
			<div id="write">
				<a href="<c:url value="/write"/>">글쓰기</a>
			</div>
			<div>
				<a href="<c:url value="/account/delete"/>">탈퇴하기</a>
			</div>
		</div>
	</div>