<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>
<html lang="ko" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/resources/assets/"
	data-template="vertical-menu-template-free">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin
	Template - Pro</title>

<meta name="description" content="" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}"
		if (msg != "") {
			alert(msg);
		}
		
		
		
		$("#chatBtn").on("click",function(){
		 const member = "${member}";
		    //console.log(member);
		    
		    if (member === "") {
		        // 확인 대화 상자를 띄우고 사용자 응답을 확인
		        if (confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")) {
		            // 사용자가 "확인"을 클릭하면 로그인 페이지로 이동
		            location.href = "/account/login"; // 로그인 페이지 URL로 변경
		        }
		        // 사용자가 "취소"를 클릭한 경우 별도의 처리 없이 현재 페이지에 머무름
		    } else {
		        // 로그인 상태인 경우 채팅 페이지로 이동
		        location.href = "/chat"; // 채팅 페이지 URL로 변경
		        //location.href = "/msg/message_list";
		    }
			
		});
		
	});
</script>

<%@include file="/WEB-INF/views/include/header.jsp"%>

</head>
<!-- 팝업 - 사용하고자 할때 주석처리 해제 -->
<%-- <%@include file="/WEB-INF/views/popup/popup.jsp"%> --%>
<body>
	<!-- Content wrapper -->
	<div class="content-wrapper">
		<!-- Content -->

		<div class="container-xxl flex-grow-1 container-p-y">
			<div class="row">
				<div class="col-lg-8 mb-4 order-0">
					<div class="card">
						<div class="d-flex align-items-end row">
							<div class="col-sm-7">
								<div class="card-body">
									<h5 class="card-title text-primary"> 위드컴에 오신것을 환영합니다!</h5>
									<p class="mb-4">
										이곳은 <span class="fw-bold">전 세계 개발자들의</span> 여러가지의 이야기를
										공유하기 위한 커뮤니티입니다.
									</p>
									
									<a id="chatBtn" href="#" class = "btn btn-success">채팅방</a>
								
									<!-- <a href="javascript:;" class="btn btn-sm btn-outline-primary">View
										Badges</a> -->
								</div>
							</div>
							<div class="col-sm-5 text-center text-sm-left">
								<div class="card-body pb-0 px-0 px-md-4">
									<img
										src="/resources/assets/img/illustrations/man-with-laptop-light.png"
										height="140" alt="View Badge User"
										data-app-dark-img="illustrations/man-with-laptop-dark.png"
										data-app-light-img="illustrations/man-with-laptop-light.png" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 order-1">
					<div class="row">
						<div class="col-lg-6 col-md-12 col-6 mb-4">
							<div class="card">
								<div class="card-body">
									<div
										class="card-title d-flex align-items-start justify-content-between">
										<div class="avatar flex-shrink-0">
											<img
												src="/resources/assets/img/icons/unicons/chart-success.png"
												alt="chart success" class="rounded" />
										</div>
										<div class="dropdown">
											<button class="btn p-0" type="button" id="cardOpt3"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="bx bx-dots-vertical-rounded"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-end"
												aria-labelledby="cardOpt3">
												<a class="dropdown-item" href="javascript:void(0);">View
													More</a> <a class="dropdown-item" href="javascript:void(0);">Delete</a>
											</div>
										</div>
									</div>
									<span class="fw-semibold d-block mb-1">하루 방문자</span>
									<h3 class="card-title mb-2">${HomeVisitCnt.day} 명</h3>
									<small class="text-success fw-semibold"><i
										class="bx bx-up-arrow-alt"></i> 1일 대비 ${HomeVisitCnt.yesterday_diff} 명</small>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-6 mb-4">
							<div class="card">
								<div class="card-body">
									<div
										class="card-title d-flex align-items-start justify-content-between">
										<div class="avatar flex-shrink-0">
											<img
												src="/resources/assets/img/icons/unicons/wallet-info.png"
												alt="Credit Card" class="rounded" />
										</div>
										<div class="dropdown">
											<button class="btn p-0" type="button" id="cardOpt6"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="bx bx-dots-vertical-rounded"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-end"
												aria-labelledby="cardOpt6">
												<a class="dropdown-item" href="javascript:void(0);">View
													More</a> <a class="dropdown-item" href="javascript:void(0);">Delete</a>
											</div>
										</div>
									</div>
									<span><strong>주 방문자</strong></span>
									<h3 class="card-title text-nowrap mb-1">${HomeVisitCnt.week} 명</h3>
									<small class="text-success fw-semibold"><i
										class="bx bx-up-arrow-alt"></i> 전주 대비 ${HomeVisitCnt.last_week_diff} 명</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Total Revenue 공지사항 -->
				<div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
					<div class="card">
						<div class="row row-bordered g-0">
							<div class="col-md-12">
								<h5 class="card-header m-0 me-2 pb-3">공지사항</h5>
								<table class="table table-bordered col-md-12">
									<thead>
										<tr>
											<th class="text-center">번호</th>
											<th class="text-center">주제</th>
											<th class="text-center">작성자</th>
											<th class="text-center">조회수</th>
											<th class="text-center">작성일자</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<c:forEach items="${HomeNoticeList}" var="nlist">
											<tr>
												<td class="text-center">
													<c:out value="${nlist.notice_no}" />
												</td>
												<td>
													<strong>
														<a href="/notice/read?notice_no=${nlist.notice_no}">
															<c:out value="${nlist.notice_title}" />
														</a>
													</strong>
												</td>
												<td class="text-center">
													<c:out value="${nlist.notice_writer}" />
												</td>
												<td class="text-center">
													<c:out value="${nlist.notice_count}" />
												</td>
												<td class="text-center">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${nlist.notice_regdate}" />
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--/ Total Revenue -->
				<div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
					<div class="row">
						<div class="col-6 mb-4">
							<div class="card">
								<div class="card-body">
									<div
										class="card-title d-flex align-items-start justify-content-between">
										<div class="avatar flex-shrink-0">
											<img src="/resources/assets/img/icons/unicons/paypal.png"
												alt="Credit Card" class="rounded" />
										</div>
										<div class="dropdown">
											<button class="btn p-0" type="button" id="cardOpt4"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="bx bx-dots-vertical-rounded"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-end"
												aria-labelledby="cardOpt4">
												<a class="dropdown-item" href="javascript:void(0);">View
													More</a> <a class="dropdown-item" href="javascript:void(0);">Delete</a>
											</div>
										</div>
									</div>
									<span class="d-block mb-1"><strong>월 방문자</strong></span>
									<h3 class="card-title text-nowrap mb-2">${HomeVisitCnt.month} 명</h3>
									<small class="text-success fw-semibold"><i
										class="bx bx-up-arrow-alt"></i> 전월 대비 ${HomeVisitCnt.last_month_diff} 명</small>
								</div>
							</div>
						</div>
						<div class="col-6 mb-4">
							<div class="card">
								<div class="card-body">
									<div
										class="card-title d-flex align-items-start justify-content-between">
										<div class="avatar flex-shrink-0">
											<img src="/resources/assets/img/icons/unicons/cc-primary.png"
												alt="Credit Card" class="rounded" />
										</div>
										<div class="dropdown">
											<button class="btn p-0" type="button" id="cardOpt1"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="bx bx-dots-vertical-rounded"></i>
											</button>
											<div class="dropdown-menu" aria-labelledby="cardOpt1">
												<a class="dropdown-item" href="javascript:void(0);">View
													More</a> <a class="dropdown-item" href="javascript:void(0);">Delete</a>
											</div>
										</div>
									</div>
									<span class="fw-semibold d-block mb-1">연 방문자</span>
									<h3 class="card-title mb-2">${HomeVisitCnt.year} 명</h3>
									<small class="text-success fw-semibold"><i
										class="bx bx-up-arrow-alt"></i> 작년 대비 ${HomeVisitCnt.last_year_diff} 명</small>
								</div>
							</div>
						</div>
					</div>
   					<div class="row"> 
						<div class="col-12 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
									<a href="/calendar/index">
										<div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
											<div class="card-title">
												<h5 class="text-nowrap mb-2">달력 보기</h5>
											</div>
										</div>
										<div id="profileReportChart"></div>
									</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Order Statistics -->
				<div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
					<div class="card">
						<div class="row row-bordered g-0">
							<div class="col-md-12">
								<h5 class="card-header m-0 me-2 pb-3">자유게시판</h5>
								<table class="table table-bordered col-md-12">
									<thead>
										<tr>
											<th class="text-center">번호</th>
											<th class="text-center">주제</th>
											<th class="text-center">작성자</th>
											<th class="text-center">조회수</th>
											<th class="text-center">작성일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${HomeBoardList}" var="blist">
											<tr>
												<td class="text-center"><c:out
														value="${blist.board_no}" /></td>
												<td><strong><a href="/board/read?board_no=${blist.board_no}"><c:out
															value="${blist.board_title}" /></a></strong></td>
												<td class="text-center"><c:out
														value="${blist.board_writer}" /></td>
												<td class="text-center"><c:out
														value="${blist.board_count}" /></td>
												<td class="text-center"><fmt:formatDate
											pattern="yyyy-MM-dd" value="${blist.board_regdate}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-4 order-2 mb-4">
					<div class="card h-100">
						<div
							class="card-header d-flex align-items-center justify-content-between">
							<h5 class="card-title m-0 me-2">회원 리스트</h5>
							<div class="dropdown">
								<button class="btn p-0" type="button" id="transactionID"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<i class="bx bx-dots-vertical-rounded"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="transactionID">
									<a class="dropdown-item" href="javascript:void(0);">Last 28
										Days</a> <a class="dropdown-item" href="javascript:void(0);">Last
										Month</a> <a class="dropdown-item" href="javascript:void(0);">Last
										Year</a>
								</div>
							</div>
						</div>
						
						<div class="card-body">
							<c:forEach items="${HomeMemberList}" var="mmList">
								<ul class="p-0 m-0">
									<li class="d-flex mb-4 pb-1">
												
										<div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
											<div class="me-2">
												<small class="text-muted d-block mb-1">${mmList.me_email}</small>
												<h6 class="mb-0">${mmList.me_name}</h6>
											</div>
											<div class="user-progress d-flex align-items-center gap-1">
												<h6 class="mb-0">+${mmList.state}</h6>
											</div>
										</div>
									</li>
								</ul>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="content-backdrop fade"></div>
</div>
<div class="layout-overlay layout-menu-toggle"></div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>