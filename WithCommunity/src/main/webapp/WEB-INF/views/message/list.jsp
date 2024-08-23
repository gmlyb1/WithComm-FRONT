<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var messageList = "${messageList}";
	console.log("messageList:"+messageList);
	
	$(document).ready(function() {
		/* $.ajax({
			url:"/message/list",
			dataType:"json",
			type:"post",
			data: $("#listForm").serialize(),
			success:function(data) {
				console.log('조회 완료');
			}
		}); */
	});
</script>


<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<br>
	<h1 class="h3 mb-2 text-gray-800">쪽지 리스트</h1>
	<br/>
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">
				<ol class="breadcrumb breadcrumb-style2 mb-0">
               <li class="breadcrumb-item">
                 <a href="javascript:void(0);">프로필</a>
               </li>
               <li class="breadcrumb-item">
                 <a href="javascript:void(0);">쪽지 리스트</a>
               </li>
             </ol>
			<br>
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
			<form method="post" id="listForm" action="/message/list">
				<input type="hidden" id="recev_name" name="recev_name" value="${member.me_email }"/>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">주제</th>
							<th class="text-center">내용</th>
							<th class="text-center">보낸사람</th>
							<th class="text-center">작성일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${messageList}" var="list">
							<tr>
								<td class="text-center">${list.msg_id}</td>
								<td class="text-center">${list.msg_title}</td>
								<td class="text-center">${list.msg_content}</td>
								<td class="text-center">${list.sender_name}</td>
								<td class="text-center">${list.create_dt}</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				<input type="hidden" name="page" value="1">
				</form>
				<br/>
				<!-- 페이징 -->
				<%-- <form name="form2">
						<!-- <button type="button" onclick="location.href='/notice/create';" class="btn btn-success">글쓰기</button> -->
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
				</form> --%>
			</div>
		</div>
	</div>

</div>


<%@include file="../include/footer.jsp"%>