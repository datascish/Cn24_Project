<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="/static/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/login.css"/>" />
<!------ Include the above in your HEAD tag ---------->

<!-- All the files that are required -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/bootstrap.js"/>"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	
	function passCheck() {
		var passwordConfirm = $("#password_confirm").val();
		var password = $("#password").val();
	
		if (passwordConfirm != "" ) {
			if ( passwordConfirm == password ) {
				$("#password-confirm").removeClass();
				$("#password-confirm").addClass("valid");
			}
			else {
				$("#password-confirm").removeClass();
				$("#password-confirm").addClass("invalid");
			}
		}
		else {
			$("#password-confirm").removeClass();
			$("#password-confirm").addClass("blank");
		}
	}
	
	$().ready(function() {
		$("#email").keyup(function(){
			var value = $(this).val();
			var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; 
			/* 이메일 유효성 체크 */
			if( value != "" ) {
				if ( !regEmail.test(value) ) {
					
					$("#email").removeClass();
					$("#email").addClass("blank");
				}
				else {
					$.post("<c:url value="/api/exists/email"/>",
							{ email : value },
							function(response){
								if ( response.response ) {
									$("#email").removeClass();
									$("#email").addClass("invalid");
								}
								else {
									$("#email").removeClass();
									$("#email").addClass("valid");
								}
						});
				}
			}
			else {
				$("#email").removeClass();
				$("#email").addClass("blank");
			}
		});
				
		$("#password").keyup(function() {
			var value = $(this).val();
			var passwordConfirm = $("#password-confirm").val();
			var regPassword = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

			/* 영문, 숫자 혼합하여 6~20자리 이내 */

			if (value != "") {
				if (regPassword.test(value)) {
					$("#password").removeClass();
					$("#password").addClass("valid");
					alert("올바른 비밀번호 형식이 아닙니다!");
				} else {
					$("#password").removeClass();
					$("#password").addClass("invalid");
				}
				if (passwordConfirm != "") {
					passCheck();
				}
			} else {
				$("#password").removeClass();
				$("#password").addClass("blank");
				alert("올바른 비밀번호 형식이 아닙니다!");
			}
		});
	
		$("#password-confirm").keyup(function() {
			passCheck();
		});

		$("#nickname").keyup(function(){
			var value = $(this).val();
			if( value != "" ) {
				$.post("<c:url value="/api/exists/nickname"/>",
						{ nickname : value },
						function(response){
							if ( response.response ) {
								$("#nickname").removeClass();
								$("#nickname").addClass("invalid");
							}
							else {
								$("#nickname").removeClass();
								$("#nickname").addClass("valid");
							}
						});
			}
			else {
				$("#nickname").removeClass();
				$("#nickname").addClass("blank");
			}
		});

		$("#phone").keyup(function() {
			var value = $(this).val();
			var rgEx = /(01[016789])[-](\d{4}|\d{3})[-]\d{4}$/g;  
			var strValue = f.hphone1.value+"-"+f.hphone2.value+"-"+f.hphone3.value;
			var chkFlg = rgEx.test(strValue);   
			if (value != "") {
				if(!chkFlg){
					
					$(this).removeClass("invalid");
					$(this).addClass("valid");
				} else {
					$(this).addClass("invalid");
					$(this).removeClass("valid");
				}
			}
		});

		$("#address").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});

		$("#postNumber").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});

		$("input[type=radio][name=userType]").change(function() {
			var value = $(this).val();
			if (value == "n") {
				// slide
				$("#bankDiv").slideDown(300);
			} else {
				$("#bankDiv").slideUp(300);
			}
		});

		$("#bankAccount").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		$("#bankName").change(function() {
			var value = $(this).val();
			if (value != "") {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).addClass("invalid");
				$(this).removeClass("valid");
			}
		});
		
		$(".login-button").click(function() {
			$("#registForm").attr({
				"method": "post",
				"action": "<c:url value="/regist"/>"
		    }).submit();
		});
		
	});
</script>

<!-- REGISTRATION FORM -->
<div class="text-center" style="padding:50px 0">
	<div class="logo">register</div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form:form id="registForm" class="text-left">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="email" class="sr-only">Email</label>
						<input type="text" class="form-control" id="email" name="email" placeholder="email" value="${memberVO.email}">
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Password</label>
						<input type="password" class="form-control" id="password" name="password" placeholder="password" value="${memberVO.password}">
					</div>
					<div class="form-group">
						<label for="password-confirm" class="sr-only">Password Confirm</label>
						<input type="password" class="form-control" id="password-confirm" name="password-confirm" placeholder="confirm password" value="${memberVO.password}">
					</div>
					
					<div class="form-group">
						<label for="nickname" class="sr-only">Nickname</label>
						<input type="text" class="form-control" id="nickname" name="nickname" placeholder="nickname" value="${memberVO.nickname}">
					</div>
					
					<div class="form-group">
						<label for="name" class="sr-only">Name</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="name" value="${memberVO.name}">
					</div>
					
					<div class="form-group">
						<label for="phone" class="sr-only">phone</label>
						<input type="text" class="form-control" id="phone" name="phone" placeholder="phone" value="${memberVO.phone}">
					</div>
					
					<div class="form-group">
						<label for="address" class="sr-only">address</label>
						<input type="text" class="form-control" id="address" name="address" placeholder="address" value="${memberVO.address}">
					</div>
					
					<div class="form-group">
						<label for="postNumber" class="sr-only">post number</label>
						<input type="text" class="form-control" id="postNumber" name="postNumber" placeholder="post number" value="${memberVO.postNumber}">
					</div>
					
					<div class="form-group login-group-checkbox">
						<input type="radio" class="" name="userType" id="y" placeholder="username" value="y">
						<label for="y">구매자</label>
						
						<input type="radio" class="" name="userType" id="n" placeholder="username" value="n">
						<label for="n">판매자</label>
					</div>
					
						<div id="bankDiv" style="display:none;">	
							<div class="form-control">
								<input type="text" id="bankAccount" 
										name="bankAccount" placeholder="BankAccount"
										value="${memberVO.bankAccount}" />
							</div>
					
							<div class="form-control"> 은행을 선택해 주세요.
								<select name="bankName" id="bankName">
									<option value="">선택</option>
									<option value="KB">국민</option>
									<option value="Woori">우리</option>
									<option value="Shinhan">신한</option>
									<option value="KEBHana">KEB하나(구외한포함)</option>
									<option value="IBK">IBK기업</option>
									<option value="Nonghyup">농협</option>
									<option value="Epost">우체국</option>
								</select>
							</div>
						</div>
					
					<div class="form-group login-group-checkbox">
						<input type="checkbox" class="" id="agree" name="agree">
						<label for="agree">i agree with <a href="<c:url value="/login"/>">terms</a></label>
					</div>
				</div>
				<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<p>이미 회원이신가요? <a href="<c:url value="/login"/>">login here</a></p>
			</div>
		</form:form>
	</div>
	<!-- end:Main Form -->
</div>