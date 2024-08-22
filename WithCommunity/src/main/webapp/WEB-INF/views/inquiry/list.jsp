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

 <div class="container-fluid">
<br>
	<h1 class="h3 mb-2 text-gray-800">1:1문의</h1>
	<p class="mb-4">
		<a><strong>관리자와 1:1 문의가 가능합니다.</strong></a>
	</p>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">고객 게시판 리스트</h6>
			<br>
			<c:if test="${member == null}">
				<span style="color: red"><strong> 현재 페이지의 글쓰기,수정,삭제는
						<strong style="color:blue">관리자</strong>만 이용 가능합니다.</strong></span>
			</c:if>
		</div>
		<div class="card-body">
			<div class="table-responsive">
			<form method="get" id="listForm" action="/inquiry/list">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th class="text-center">번호</th>
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
									<td class="text-center"><c:out value="${list.inq_no}" /></td>
									<td><a href="/inquiry/detail?inq_no=${list.inq_no}"><c:out value="${list.inq_title}" /></a></td>
									<td class="text-center"><c:out value="${list.inq_name}" /></td>
									<td class="text-center">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${list.inq_regdate}"/></td>
									<td class="text-center">
									    <c:choose>
									        <c:when test="${list.answerYn == '대기중'}">
									            <span class="text-danger"><strong>${list.answerYn}</strong></span>
									        </c:when>
									        <c:when test="${list.answerYn == '확인중'}">
									            <span class="text-primary"><strong>${list.answerYn}</strong></span>
									        </c:when>
									        <c:when test="${list.answerYn == '답변완료'}">
									            <span class="text-success"><strong>${list.answerYn}</strong></span>
									        </c:when>
									        <c:otherwise>
									            <span>${list.answerYn}</span>
									        </c:otherwise>
									    </c:choose>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${list.inq_name eq member.me_name && list == null}">
						<td colspan="6" class="text-center">데이터가 없습니다.</td>
					</c:if>
					</tbody>
				</table>
				<input type="hidden" name="page" value="1">
			</form>
				<c:if test="${member != null}">
				<br>
					<a type="button" href="/inquiry/create" class="btn btn-success">글쓰기</a>
				</c:if>
				
				<!-- 페이징 -->
				<c:if test="${list != null}">
					<form name="form2">
					    <div id="pagination" class="d-flex justify-content-center align-items-center">
					        <ul id="pageUL" class="pagination">
					            <c:if test="${pageMaker.prev}">
					                <li class="page-item">
					                    <a class="page-link" href='<c:url value="/inquiry/list?page=${pageMaker.startPage-1}"/>' aria-label="Previous">
					                        <span aria-hidden="true">&laquo;</span>
					                        <span class="sr-only">Previous</span>
					                    </a>
					                </li>
					            </c:if>
					            
					            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum" varStatus="loop">
							    <li id="page${loop.index}" class="page-item <c:if test='${pageNum eq pageMaker.cri.page}'>active</c:if>'">
							        <a class="page-link" href='<c:url value="/inquiry/list?page=${pageNum}"/>'><c:out value="${pageNum}"/></a>
							    </li>
								</c:forEach>
								
					            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					                <li class="page-item">
					                    <a class="page-link" href='<c:url value="/inquiry/list?page=${pageMaker.endPage+1}"/>' aria-label="Next">
					                        <span aria-hidden="true">&raquo;</span>
					                        <span class="sr-only">Next</span>
					                    </a>
					                </li>
					            </c:if>
					        </ul>
					    </div>
					    <input id="pageH" type="hidden" name="page" value="${pageMaker.cri.page}">
					    <input id="keywordH" type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					    <input id="optionH" type="hidden" name="option" value="${pageMaker.cri.option}">
					</form>
				</c:if>
			</div>
		</div>
	</div>
</div>


<%@include file="../include/footer.jsp"%>
