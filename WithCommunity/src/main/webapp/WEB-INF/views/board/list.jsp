<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
		
		// new 스티커 처리
		var currentTime = new Date().getTime();
		
		$("table tr").each(function() {
			var regdate = new Date($(this).data("regdate")).getTime();
			var isNewPost = (currentTime - regdate < 24 * 60 * 60 * 1000);
			
			if(isNewPost) {
				$(this).find("td:eq(1)").append('<span class="badge badge-success">New</span>');
				
				setTimeout(function() {
					$sticker.find(".badge").remove();
				},24 * 60 * 60 * 1000);
			}
		});
		
		// 페이징 
		var pagination = document.querySelector("#pagination");
		var pageUL = document.querySelector('#pageUL');
	
		pagination.onclick = function() {
			event.preventDefault();
			if((event.target.className).indexOf("right") != -1) {
				document.form2.page.value = Number(document.form2.page.value) + 5;
				document.form2.submit();
				return;
			}else if((event.target.className).indexOf("left") != -1 ){
				document.form2.page.value = Number(document.form2.page.value) -5;
				document.form2.submit();
				return;
			}else if(event.target.tagName == 'A' || event.target.tagName == 'I'){
				document.form2.page.value = event.target.textContent;
				document.form2.submit();
			}else 
				return;
		};
	});
});
</script>

<div class="container-fluid">
	<br>
	<h1 class="h3 mb-2 text-gray-800">자유 게시판</h1>
	<br/>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<ol class="breadcrumb breadcrumb-style2 mb-0">
               <li class="breadcrumb-item">
                 <a href="javascript:void(0);">게시판</a>
               </li>
               <li class="breadcrumb-item">
                 <a href="javascript:void(0);">자유게시판</a>
               </li>
             </ol>
			<br>
			
			<select class="form-select" id="bgno" name="bgno">
					<option value="">전체</option>
					<option value="1">커뮤니티</option>
					<option value="2">공유합시다</option>
			</select>
		</div>

		<div class="card-body">
			<div class="table-responsive">
				<form method="get" id="listForm" action="/board/list">
					<input type="hidden" id="board_no" name="board_no" value='<c:out value="${pageInfo.board_no}"/>'>
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th class="text-center">번호</th>
								<th class="text-center">카테고리</th>
								<th class="text-center">주제</th>
								<th class="text-center">작성자</th>
								<th class="text-center">조회수</th>
								<th class="text-center">작성일자</th>
								<th class="text-center">수정일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardList}" var="list">
								<tr data-regdate = "${list.board_regdate}">
									<td class="text-center"><c:out value="${list.board_no}" /></td>
										<c:if test="${list.board_bgno == ''}">
											<td class="text-center">미선택</td>
										</c:if>
										<c:if test="${list.board_bgno == '1'}">
											<td class="text-center">커뮤니티</td>
										</c:if>
										<c:if test="${list.board_bgno == '2'}">
											<td class="text-center">공유합시다</td>
										</c:if>
									<td>
										<strong><a href="/board/read?board_no=${list.board_no}"> ${list.board_title}</a></strong>
									</td>
									<td class="text-center">
										<c:out value="${list.board_writer}" />
									</td>
									<td class="text-center">
										<c:out value="${list.board_count}" />
									</td>
									<td class="text-center">
										<fmt:formatDate pattern="yyyy-MM-dd" value="${list.board_regdate}" />
									</td>
									<td class="text-center">
										<fmt:formatDate pattern="yyyy-MM-dd" value="${list.board_updateDate}" />
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<input type="hidden" name="page" value="1">
					<br/>
				</form>
				<!-- 페이징 -->
				<form name="form2">
				<c:if test="${member != null}">
						<button type="button" onclick="location.href='/board/create';" class="btn btn-success">글쓰기</button>
					</c:if>
				    <div id="pagination" class="d-flex justify-content-center align-items-center">
				        <ul id="pageUL" class="pagination">
				            <c:if test="${pageMaker.prev}">
				                <li class="page-item">
				                    <a class="page-link" href='<c:url value="/board/list?page=${pageMaker.startPage-1}"/>' aria-label="Previous">
				                        <span aria-hidden="true">&laquo;</span>
				                        <span class="sr-only">Previous</span>
				                    </a>
				                </li>
				            </c:if>
				            
				            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum" varStatus="loop">
						    <li id="page${loop.index}" class="page-item <c:if test='${pageNum eq pageMaker.cri.page}'>active</c:if>'">
						        <a class="page-link" href='<c:url value="/board/list?page=${pageNum}"/>'><c:out value="${pageNum}"/></a>
						    </li>
							</c:forEach>
							
				            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				                <li class="page-item">
				                    <a class="page-link" href='<c:url value="/board/list?page=${pageMaker.endPage+1}"/>' aria-label="Next">
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

<%@include file="../include/footer.jsp"%>
