<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="/static/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<style class="cp-pen-styles"></style>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.js"/>"></script>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js'></script>

<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />
<jsp:include page="/WEB-INF/view/template/menu.jsp" />

<style>
    #container {
      width: 80%;
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
		console.log("${sessionScope.__USER__.id}");
		console.log("${sessionScope.__USER__.userType}");
	});
</script>

<div id="container">
		<div align="right">
			<div id="list" style="font-size: 10pt;">
				${pageExplorer.totalCount}건의 상품 게시글이 검색되었습니다.
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="10%">ID</th>
						<th width="40%">상품 이름</th>
						<th width="15%">가격</th>
						<th width="10%">작성자</th>
						<th width="20%">작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${pageExplorer.list}" var="product">
					<tr>
						<td>${product.id}</td>
						<td><a href="<c:url value="/read/${product.id}"/>">${product.productName}</a>
							<c:if test="${not empty product.productUrl}">
								<img src="<c:url value="/static/img/file.png"/>" alt="${product.productUrl}"  style="width:15px;"/>
							</c:if>
						</td>
						<td>${product.productPrice}</td>
						<td>
							<c:choose>
								<c:when test="${not empty product.memberVO}">
									<!-- nickname(email) -->
									${product.memberVO.nickname}(${product.memberVO.email})
								</c:when>
								<c:otherwise>
									탈퇴한 회원
								</c:otherwise>
							</c:choose>
						</td>
						<td>${product.productRegistDate}</td>
					</tr>
					</c:forEach>
					<c:if test="${empty pageExplorer.list}">
					<tr>
						<td colspan="5">등록된 상품 게시글이 없습니다.</td>
					</tr>
					</c:if>
				</tbody>
			</table>
			
			<form id="searchForm" onsubmit="movePage('0')">
				${pageExplorer.make()}
				<div id="list" style="font-size: 10pt;">
					<select id="searchType" name="searchType">
						<option value="1" ${search.searchType eq 1 ? 'selected' : ''}> 상품 이름 </option>
						<option value="2" ${search.searchType eq 2 ? 'selected' : ''}> 상품 내용 </option>
						<option value="3" ${search.searchType eq 3 ? 'selected' : ''}> 상품 이름 + 상품 내용</option>
						<option value="4" ${search.searchType eq 4 ? 'selected' : ''}> 판매자 Nickname </option>
						<option value="5" ${search.searchType eq 5 ? 'selected' : ''}> 판매자 Email </option>
						<option value="6" ${search.searchType eq 6 ? 'selected' : ''}> 상품 파일 이름 </option>
					</select>
					<input type="text" id="searchType" name="searchType"
							value="${search.searchType}" />
					<a href="<c:url value="/resetPro"/>">검색 초기화</a>
				</div>
			</form>
				
				<c:if test="${not empty sessionScope.__USER__.id && sessionScope.__USER__.userType != 'y'}">
					<div id="productRegist" style="font-size: 11pt;">
						<a href="<c:url value="/productRegist" />">상품 등록하기</a>
					</div>
				</c:if>
		</div>
	</div>
