<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../include/header.jsp"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
		
		
	var pagination = document.querySelector("#pagination");
	var pageUL = document.querySelector('#pageUL');
	pagination.onclick = function() {
		event.preventDefault();
		if((event.target.className).indexOf("right") != -1 ){
			document.form2.page.value = Number(document.form2.page.value) +5;
			document.form2.submit();
			return;
		}else if((event.target.className).indexOf("left") != -1) {
			document.form2.page.value = Number(document.form2.page.value) -5;
			document.form2.submit();
			return;
		}else if(event.target.tagName == 'A' || event.target.tagName == 'I') {
			document.form2.page.value = event.target.textContent;
			document.form2.submit();
		}else 
			return;
	};
	// jquery 끝
	});
</script>
<style type="text/css">
#pagination {
    margin-top: 20px;
}

.pagination {
    margin: 0;
}

.pagination .page-item {
    display: inline;
}

.pagination .page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}

.pagination .page-item .page-link {
    position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #007bff;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #dee2e6;
}

.pagination .page-item.disabled .page-link {
    color: #6c757d;
    pointer-events: none;
    cursor: auto;
    background-color: #fff;
    border-color: #dee2e6;
}

.pagination .page-item:first-child .page-link {
    margin-left: 0;
    border-top-left-radius: 0.25rem;
    border-bottom-left-radius: 0.25rem;
}

.pagination .page-item:last-child .page-link {
    border-top-right-radius: 0.25rem;
    border-bottom-right-radius: 0.25rem;
}

</style>

<div class="container-fluid">
	<br>
	<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
	<br/>
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">
				<ol class="breadcrumb breadcrumb-style2 mb-0">
               <li class="breadcrumb-item">
                 <a href="javascript:void(0);">게시판</a>
               </li>
               <li class="breadcrumb-item">
                 <a href="javascript:void(0);">공지사항</a>
               </li>
             </ol>
			<br>
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
			<form method="get" id="listForm" action="/notice/list">
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
									<td class="text-center"><c:out value="${list.notice_no}" /></td>
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
					
				</table>
				<input type="hidden" name="page" value="1">
				</form>
				<br/>
				<!-- 페이징 -->
				<form name="form2">
					<c:if test="${member.adminCk == 1}">
						<button type="button" onclick="location.href='/notice/create';" class="btn btn-success">글쓰기</button>
					</c:if>
				    <div id="pagination" class="d-flex justify-content-center align-items-center">
				        <ul id="pageUL" class="pagination">
				            <c:if test="${pageMaker.prev}">
				                <li class="page-item">
				                    <a class="page-link" href='<c:url value="/notice/list?page=${pageMaker.startPage-1}"/>' aria-label="Previous">
				                        <span aria-hidden="true">&laquo;</span>
				                        <span class="sr-only">Previous</span>
				                    </a>
				                </li>
				            </c:if>
				            
				            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum" varStatus="loop">
						    <li id="page${loop.index}" class="page-item <c:if test='${pageNum eq pageMaker.cri.page}'>active</c:if>'">
						        <a class="page-link" href='<c:url value="/notice/list?page=${pageNum}"/>'><c:out value="${pageNum}"/></a>
						    </li>
							</c:forEach>
							
				            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				                <li class="page-item">
				                    <a class="page-link" href='<c:url value="/notice/list?page=${pageMaker.endPage+1}"/>' aria-label="Next">
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
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>
