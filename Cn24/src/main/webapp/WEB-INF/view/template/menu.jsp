<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/menu.css"/>" />
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/menu.js"/>"></script>
<!------ Include the above in your HEAD tag ---------->

<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
	$().ready(function() {
		
	});
</script>

<div class="container" >
	<ul id="navigation" style="margin-top: 15%;">
            <li class="home"><a href="<c:url value="/main"/>" title="Home"><span>홈으로  <i class="fa fa-home"></i></span></a></li>
            <li class="about"><a href="<c:url value="/product"/>" title="Book"><span> 상품란  <i class="fa fa-shopping-cart"></i></span></a></li>
            <li class="contact"><a href="<c:url value="/list"/>" title="Community"><span> 게시판  <i class="fa fa-commenting"></i></span></a></li>
            <li class="about"><a href="<c:url value="/mypage/communities"/>" title="MyPage"><span>MyPage <i class="fa fa-user-secret"></i></span></a></li>
            <li class="logout"><a href="<c:url value="/logout"/>" title="Logout"><span>Logout <i class="fa fa-sign-out-alt"></i></span></a></li>
        </ul>
</div>