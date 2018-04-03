<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>http://www.cn24.com/regist</title>
<link rel="stylesheet"
		type="text/css" href="<c:url value="/static/css/button.css"/>"/>
<link rel="stylesheet"
		type="text/css" href="<c:url value="/static/css/input.css"/>"/>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" 
		type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		// validation check
		$("#userId").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("#email").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("#password").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("#password-confirm").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("#nickname").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("#name").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("#phone").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("#address").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("input[type=radio][name=userType]").change(function() {
			var value = $(this).val();
			if (value == "n") {
				// slide
			}
		});
		
		$("#bankAccount").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("#bankName").change(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}
			else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$("#registBtn").click(function() {
			
			if ($("#userId").val() == "") {
				alert("아이디를 입력하세요!");
				$("#userId").focus();
				$("#userId").addClass("invalid");
				return false;
			}
			
			if ($("#email").val() == "") {
				alert("이메일을 입력하세요!");
				$("#email").focus();
				$("#email").addClass("invalid");
				return false;
			}
			
			if ($("#password").val() == "") {
				alert("비밀번호를 입력하세요!");
				$("#password").focus();
				$("#password").addClass("invalid");
				return false;
			}
			
			if ($("#password-confirm").val() == "") {
				alert("비밀번호를 한 번 더 입력하세요!");
				$("#password-confirm").focus();
				$("#password-confirm").addClass("invalid");
				return false;
			}
			
			if ($("#nickname").val() == "") {
				alert("닉네임을 입력하세요!");
				$("#nickname").focus();
				$("#nickname").addClass("invalid");
				return false;
			}
			
			if ($("#name").val() == "") {
				alert("이름을 입력하세요!");
				$("#name").focus();
				$("#name").addClass("invalid");
				return false;
			}
			
			
			if ($("#phone").val() == "") {
				alert("전화번호를 입력하세요!");
				$("#phone").focus();
				$("#phone").addClass("invalid");
				return false;
			}
			
			if ($("#address").val() == "") {
				alert("주소를 입력하세요!");
				$("#address").focus();
				$("#address").addClass("invalid");
				return false;
			}
			
			if ($("input[type=radio][name=userType]:checked").length == 0) {
				alert("판매자와 구매자 중 선택하세요!");
				
				return false;
			}
			
			if ($("#bankAccount").val() == "") {
				alert("계좌번호를 입력하세요!");
				$("#bankAccount").focus();
				$("#bankAccount").addClass("invalid");
				$("#bankAccount").slideDown("300");
				return false;
			}
			if ($("#bankName").val() == "") {
				alert("은행을 선택하세요!");
				$("#bankName").focus();
				$("#bankName").addClass("invalid");
				$("#bankName").slideDown("300");
				return false;
			}
			
			$("#registForm").attr({
				"method": "post",
				"action": "<c:url value="/regist"/>"
			}).submit();
		});
	});
</script>
</head>
<body>
	<div class="wrapper">
		<form:form modelAttribute="registForm">
			<div>
				<%-- TODO userId 중복검사 하기 (ajax) --%>
				<input type="text" id="userId" 
						name="userId" placeholder="userId"
						value="${memberVO.userId}" />
				<div>
					<form:errors path="userId" />
				</div>
			</div>
			<div>
				<%-- TODO userId 중복검사 하기 (ajax) --%>
				<input type="text" id="email" 
						name="email" placeholder="Email"
						value="${memberVO.email}" />
				<div>
					<form:errors path="email" />
				</div>
			</div>
			
			<div>
				<%-- TODO password 중복검사 하기 (ajax) --%>
				<input type="password" id="password" 
						name="password" placeholder="Password"
						value="${memberVO.password}" />
				<div>
					<form:errors path="password" />
				</div>
			</div>
			
			<div>
				<input type="password" id="password-confirm" 
						name="password-confirm" placeholder="Password-confirm"
						value="${memberVO.password}" />
				<div>
					<form:errors path="password-confirm" />
				</div>
			</div>
			
			<div>
				<%-- TODO nickname 중복검사 하기 (ajax) --%>
				<input type="text" id="nickname" 
						name="nickname" placeholder="Nickname"
						value="${memberVO.nickname}" />
				<div>
					<form:errors path="nickname" />
				</div>
			</div>
			
			<div>
				<input type="text" id="name" 
						name="name" placeholder="Name"
						value="${memberVO.name}" />
				<div>
					<form:errors path="name" />
				</div>
			</div>
			
			<div>
				<input type="text" id="phone" 
						name="phone" placeholder="Phone"
						value="${memberVO.phone}" />
				<div>
					<form:errors path="phone" />
				</div>
			</div>
			
			<div>
				<input type="text" id="address" 
						name="address" placeholder="Address"
						value="${memberVO.address}" />
				<div>
					<form:errors path="address" />
				</div>
			</div>
			
			<div>
				
				<input type="radio" name="userType" 
						value="y" style="width: 100px;" />구매자
				<input type="radio" name="userType" 
						value="n" style="width: 100px;" />판매자
				<div>
					<form:errors path="userType" />
				</div>
				<form id="checkForm" >
					<div>
						<input type="text" id="bankAccount" 
								name="bankAccount" placeholder="BankAccount"
								value="${memberVO.bankAccount}" />
						<div>
							<form:errors path="bankAccount" />
						</div>
					</div>
					<div>
						<select name="bankName" id="bankName">
							<option value="">선택</option>
							<option value="KB">국민</option>
							<option value="Woori">우리</option>
							<option value="Shinhan">신한</option>
							<option value="KEBHana">KEB하나(구외한포함)</option>
							<option value="IBK">IBK기업</option>
							<option value="Nonghyup">농협</option>
							<option value="Epost">우체국</option>
							<option value="Etc">기타</option>
						</select>
						<form:errors path="bankName" />
					</div>
				</form>
			</div>
			<div>
				<input style="text-align: center;" class="button" id="registBtn"  value="가입 완료"/>
			</div>
		</form:form>
	</div>
</body>
</html>