<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}"
		if (msg != "") {
			alert(msg);
		}
	});
</script> -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			alert("로그아웃을 완료하였습니다.");
			location.href = "/account/logout"
		})
	})
</script>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/home">SOFT SHOPPING</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#!">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">소개</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">상품</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">All Products</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">Popular Items</a></li>
							<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
						</ul></li>
				<c:if test="${member != null }">
					<li class="nav-item"><a class="nav-link active" href="/notice/list">공지사항</a></li>
					<li class="nav-item"><a class="nav-link active" href="/board/list">게시판</a></li>
				</c:if>
				</ul>
				<!-- 세션이 없을때 -->
				<c:if test="${member == null }">
					<form class="d-flex">
						<a class="btn btn-primary" href="/account/register">회원가입</a>
						&nbsp;&nbsp;
						<a class="btn btn-success" href="/account/login"> 로그인 </a>
						&nbsp;&nbsp;
					</form>
				</c:if>

				<!-- 로그인 완료후 -->
				<c:if test="${member != null }">
					<form class="d-flex">
						<span><c:out value="${member.me_name}"></c:out></span>
						<a class="btn btn-success" href="/account/logout" id="logoutBtn" name="logoutBtn"> 로그아웃 </a> &nbsp;&nbsp;
							<button class="btn btn-outline-dark" type="submit">
								<i class="bi-cart-fill me-1"></i> 장바구니 <span
									class="badge bg-dark text-white ms-1 rounded-pill">0</span>
							</button>
					</form>
				</c:if>
			</div>
		</div>
	</nav>