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
<script type="text/javascript">
$(document).ready(function() {
	
	var thisIndex = "${vo.pageIndex}"
	$(".pagination li a").each(function(){
		var idx = $(this).parent().index();
		var thistitle = $(this).attr("title");
		if(thistitle == thisIndex){
			$(".pagination").find("li").eq(idx).addClass("active");
		}
	});

	});
</script>
<script type="text/javascript">
function fn_search(){
	$("#pageIndex").val("1");
	$("#listForm").submit();
	return false;
}

</script>
<!-- Begin Page Content -->
<div class="container-fluid">
	<br>
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">고객 게시판</h1>
	<p class="mb-4">
		<a><strong>저희 소프트홈페이지의 고객 게시판을 찾아 주셔서 감사합니다.</strong></a>
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

			<c:if test="${member != null }">
				<a href="/board/mypage" class="btn btn-success">마이페이지로 이동</a>
			</c:if>
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
						<c:forEach items="${boardList}" var="list">
							<tr>
								<td class="text-center"><c:out value="${list.board_no}" /></td>
								<td><a href="/board/read?board_no=${list.board_no}">
										${list.board_title}[${list.reply_cnt}]</a></td>
								<td class="text-center"><c:out value="${list.board_writer}" /></td>
								<td class="text-center"><c:out value="${list.board_count}" /></td>
								<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${list.board_regdate}" /></td>
								<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${list.board_updateDate}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table><br>
				<c:if test="${member != null}">
					<button type="button" onclick="location.href='/board/create';"
						class="btn btn-success">글쓰기</button>
				</c:if>

				<!-- Paging[s] -->
				<%-- <form method="get" id="listForm" action="/board/list">
					<ul class="pagination">
						<c:if test="${vo.prev}">
							<li class="paginate_button page-item previous"
								id="dataTable_previous"><a href="javascript:void(0);"
								onclick="fn_go_page(${vo.startDate - 1}); return false;"
								aria-controls="dataTable" data-dt-idx="0" tabindex="0"
								class="page-link">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${vo.startDate}"
							end="${vo.endDate}">
							<li class="paginate_button page-item"><a
								href="javascript:void(0);"
								onclick="fn_go_page(${num}); return false;"
								aria-controls="dataTable" data-dt-idx="0" tabindex="0"
								class="page-link" title="${num}">${num}</a></li>
						</c:forEach>

						<c:if test="${vo.next}">
							<li class="paginate_button page-item next" id="dataTable_next">
								<a href="javascript:void(0);"
								onclick="fn_go_page(${vo.endDate + 1}); return false;"
								aria-controls="dataTable" data-dt-idx="0" tabindex="0"
								class="page-link">Next</a>
							</li>
						</c:if>
					</ul>
					<!-- Paging[e] -->
				</form> --%>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->


<%@include file="../include/footer.jsp"%>
