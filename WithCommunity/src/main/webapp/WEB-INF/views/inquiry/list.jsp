<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
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


<!-- Begin Page Content -->
 <div class="container-fluid">
<br>
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">1:1문의</h1>
	<p class="mb-4">
		<a><strong>관리자와 1:1 문의가 가능합니다.</strong></a>
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">고객 게시판 리스트</h6>
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
						</tr>
					</thead>
					<tbody>
						<c:forEach items="" var="list">
							<tr>
								<td class="text-center"><c:out value="" /></td>
								<td><a href="#"><c:out
											value="" /></a></td>
								<td class="text-center"><c:out value="" /></td>
								<td class="text-center"><c:out value="" /></td>
								<td class="text-center"><c:out
										value="" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${member != null}">
					<a type="button" href="#" class="btn btn-success">글쓰기</a>
				</c:if>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->


<%@include file="../include/footer.jsp"%>
