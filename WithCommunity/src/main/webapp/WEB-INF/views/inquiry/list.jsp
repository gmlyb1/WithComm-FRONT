<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
						<strong style="color:blue">관리자</strong>만 이용 가능합니다.</strong></span>
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
							<!-- <th class="text-center">번호</th> -->
							<th class="text-center">주제</th>
							<th class="text-center">작성자</th>
							<th class="text-center">작성일자</th>
							<th class="text-center">답변여부</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${member != null}"> 
						<c:forEach items="${inquiryList}" var="list">
							 <c:if test="${list.inq_name eq member.me_name}">
								<tr>
									<%-- <td class="text-center"><c:out value="${list.inq_no}" /></td> --%>
									<td><a href="/inquiry/detail?inq_no=${list.inq_no}"><c:out value="${list.inq_title}" /></a></td>
									<td class="text-center"><c:out value="${list.inq_name}" /></td>
									<td class="text-center">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${list.inq_regdate}"/></td>
									<td class="text-center">
									  <c:choose>
									    <c:when test="${list.answerYn == true}">
									      <i class="fas fa-check"></i> <!-- 'fas'는 Font Awesome Solid 스타일 아이콘입니다. -->
									    </c:when>
									    <c:otherwise>
									      <i class="fas fa-times"></i>
									    </c:otherwise>
									  </c:choose>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
				<c:if test="${member != null}">
				<br>
					<a type="button" href="/inquiry/create" class="btn btn-success">글쓰기</a>
				</c:if>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->


<%@include file="../include/footer.jsp"%>
