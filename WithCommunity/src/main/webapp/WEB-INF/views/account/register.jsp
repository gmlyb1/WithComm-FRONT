<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#me_email").val()==""){
					alert("아이디를 입력해주세요.");
					$("#me_email").focus();
					return false;
				}
				if($("#me_pwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#me_pwd").focus();
					return false;
				}
				if($("#me_name").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#me_name").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/account/register" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="me_email">아이디</label>
					<input class="form-control" type="email" id="me_email" name="me_email" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="me_pwd">패스워드</label>
					<input class="form-control" type="password" id="me_pwd" name="me_pwd" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="me_name">닉네임</label>
					<input class="form-control" type="text" id="me_name" name="me_name" />
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>