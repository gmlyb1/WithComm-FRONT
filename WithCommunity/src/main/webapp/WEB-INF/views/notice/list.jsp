<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
	});
</script>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">
	<br>
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
	<p class="mb-4">
		<a><strong>이곳은 공지사항입니다. 관리자 외에는 글을 조회만 가능합니다.</strong></a>
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><Strong>공지사항 리스트</Strong></h6>
			<br>
			<c:if test="${member == null}">
				<span style="color: red"><strong> 현재 페이지의 글쓰기,수정,삭제는
						회원만 이용 가능합니다.</strong></span>
			</c:if>

			<%-- <c:if test="${member != null }">
				<a href="/board/mypage" class="btn btn-success">마이페이지로 이동</a>
			</c:if> --%>
			<form>
				<input type="button" class="btn btn-warning" value="페이지 새로 고침"
					onClick="window.location.reload()">
			</form>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">주제</th>
							<th class="text-center">작성자</th>
							<th class="text-center">조회수</th>
							<th class="text-center">작성일자</th>
							<th class="text-center">수정일자</th>
						</tr>
					</thead>
					<tbody>
							<c:forEach items="${FixedList}" var="FixedList">
								<tr style="background: LightGray">
									<td class="text-center"><c:out value="" /><strong>[공지]</strong></td>
									<td><strong><a
											href="/notice/read?notice_no=${FixedList.notice_no}"><c:out
													value="${FixedList.notice_title}" /></a></strong></td>
									<td class="text-center"><strong><c:out
												value="${FixedList.notice_writer}" /></strong></td>
									<td class="text-center"><strong><c:out
												value="${FixedList.notice_count}" /></strong></td>
									<td class="text-center"><strong><fmt:formatDate pattern="yyyy-MM-dd"
												value="${FixedList.notice_regdate}" /></strong></td>
									<td class="text-center"><strong><fmt:formatDate pattern="yyyy-MM-dd"
												value="${FixedList.notice_updateDate}" /></strong></td>
								</tr>
							</c:forEach>
							<c:forEach items="${noticeList}" var="list">
								<tr>
									<td class="text-center"><c:out value="${list.rowNo}" /></td>
									<td><a href="/notice/read?notice_no=${list.notice_no}"><c:out
												value="${list.notice_title}" /></a></td>
									<td class="text-center"><c:out
											value="${list.notice_writer}" /></td>
									<td class="text-center"><c:out
											value="${list.notice_count}" /></td>
									<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${list.notice_regdate}" /></td>
									<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${list.notice_updateDate}" /></td>
								</tr>
							</c:forEach>
					</tbody>
				</table><br>
				<c:if test="${member.adminCk == 1}">
					<button type="button" onclick="location.href='/notice/create';"
						class="btn btn-success">글쓰기</button>
				</c:if>

				<!-- 페이징 처리 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">

						<!-- 이전 -->
						<c:if test="${paging.currentPage eq 1}">
							<li class="page-item"><a class="page-link no-before"
								tabindex="-1" aria-disabled="true">이전</a></li>
						</c:if>
						<c:if test="${paging.currentPage ne 1}">
							<c:url var="before" value="/notice/list">
								<c:param name="currentPage" value="${paging.currentPage - 1}" />
							</c:url>

							<li class="page-item"><a class="page-link" tabindex="-1"
								href="${before}" aria-disabled="true">이전</a></li>
						</c:if>

						<!-- 페이지 -->
						<c:forEach var="page" begin="${paging.startPage}"
							end="${paging.endPage}">
							<c:if test="${page eq paging.currentPage }">
								<li class="page-item"><a
									class="page-link bg-primary text-light">${page}</a></li>
							</c:if>

							<c:if test="${page ne paging.currentPage }">
								<c:url var="pagination" value="/notice/list">
									<c:param name="currentPage" value="${paging.currentPage + 1}" />
								</c:url>

								<li class="page-item"><a class="page-link"
									href="${pagination}">${page}</a></li>
							</c:if>
						</c:forEach>

						<!-- 다음 -->
						<c:if test="${paging.currentPage eq paging.maxPage}">
							<li class="page-item"><a class="page-link no-before"
								tabindex="-1" aria-disabled="true">다음</a></li>
						</c:if>
						<c:if test="${paging.currentPage ne paging.maxPage}">
							<c:url var="after" value="/notice/list">
								<c:param name="currentPage" value="${paging.currentPage + 1}" />
							</c:url>

							<li class="page-item"><a class="page-link" tabindex="-1"
								href="${after}" aria-disabled="true">다음</a></li>
						</c:if>

					</ul>
				</nav>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>
