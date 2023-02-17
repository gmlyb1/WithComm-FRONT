<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']")

		//삭제
		$("#delete_btn").on("click", function() {
			formObj.attr("action", "/inquiry/delete");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
</script>
<!-- <script type="text/javascript">
$("#list_btn").on("click", function(){ location.href = "/board/list?page=${scri.page}" +"&perPageNum=${scri.perPageNum}" +"&searchType=${scri.searchType}&keyword=${scri.keyword}"; })
</script> -->
<!-- <script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='replyForm']")
		$(".replyWriteBtn").on("click", function() {
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/board/WriteReply");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
</script>
<script type="text/javascript">
	function fn_fileDown(fileNo) {
		var formObj = $("form[name='readForm']");
		$("#FILE_NO").attr("value", fileNo);
		formObj.attr("action", "/board/fileDown");
		formObj.submit();
	}
</script> -->
<script type="text/javascript">
	function remove_replyNo(data1, data2) {
		if (!confirm("삭제 하시겠습니까?"))
			return false;
		else {
			location.href = "/reply/delete?reply_no=" + data1 + "&board_no="
					+ data2;
		}
	}
</script>

<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<c:if test="${member == null}">
		<span style="color: red" class="text-center"><strong>
				현재 페이지의 글쓰기,수정,삭제는 관리자와 글쓴이만 이용 가능합니다.</strong></span>
	</c:if>

	<%-- <c:if test="${member != null}">
		<span style="color: blue" class="text-center"><strong>
				댓글작성은 관리자만 가능합니다.</strong></span>
	</c:if> --%>
	<div class="col-lg-12">
		<h1 class="page-header text-center">1:1 문의 상세 페이지</h1>
		<c:if test="${member != null}">
			<span style="color: blue" class="text-center"><strong>
					댓글작성은 문의자와 관리자만 가능합니다.</strong></span>
		</c:if>
	</div>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form role="form" method="post" name="readForm">
					<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
					<input type="hidden" id="inq_no" name="inq_no"
						value="${read.inq_no}" />
					<%-- <input type="hidden" id="reply_no" name="reply_no" value="${replyList.board_no}"> --%>
					<!-- 게시판 글보기  -->
					<div class="container">
						<div class="row">
							<table class="table table-striped"
								style="text-align: center; border: 1px solid #dddddd">
								<thead>
									<tr>
										<th colspan="2"
											style="background-color: #eeeeee; text-align: center;">게시판
											글 보기</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td style="width: 20%">글 제목</td>
										<td colspan="2">${read.inq_title}</td>
									</tr>
									<tr>
										<td>작성자</td>
										<td colspan="2">${read.inq_name}</td>
									</tr>
									<tr>
										<td>작성일자</td>
										<td colspan="2">${read.inq_regdate}</td>
									</tr>
									<tr>
										<td>내용</td>
										<td colspan="2" style="height: 200px; text-align: left;">${read.inq_content}</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<!-- 게시판 글보기  -->
					<%-- <div style="margin-left: 1px;">
						<c:if test="${member.me_name == read.inq_name}">
							<button type="button" class="btn btn-success"
								onclick="location.href='/board/update?board_no=${read.board_no}';">수정</button>
							<button type="submit" class="btn btn-danger" id="delete_btn">삭제</button>
						</c:if>
						<button onclick="location.href='/board/list'" type="button"
							id="list_btn" class="btn btn-primary">목록</button>
						<br>
						<hr>
					</div> --%>
				</form>
				<!-- 게시판 끝 -->

				<!-- 댓글 시작 -->
				<%-- <div class="mb-3" style="height: 270px; OVERFLOW-Y: auto;">
					<table class="table table-striped">
						<c:choose>
							<c:when test="${replyList == null}">
								<tr>
									<td style="text-align: center">등록된 댓글이 없습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${replyList}" var="replyList">
									<tr style="width: 100%;">
										<td style="font-weight: bold;" colspan="3">${replyList.reply_writer}</td>
									</tr>
									<tr>
										<td style="width: 60%; height: 50px;"><pre
												style="font-family: arial;">${replyList.reply_content}</pre>
											<p>
												<c:if test="${member.me_name == replyList.reply_writer}">
													<!-- <a class="btn btn-primary" href="">수정</a> / -->
													<!-- <button type="button" class="btn btn-xs btn-success" data-toggle="modal" data-target="#modifyModal">댓글 수정</button> -->
													<a class="btn btn-danger"
														href="javascript:remove_replyNo(${replyList.reply_no},${replyList.board_no});">삭제</a>
												</c:if>
											</p></td>
										<td style="width: 35%; text-align: right;"><fmt:formatDate
												value="${replyList.reply_regdate}" pattern="yy-MM-dd HH:mm" /></td>
										<td style="width: 5%;">&nbsp;</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div> --%>

				<!-- 댓글 끝 -->


				<!-- 댓글 작성 시작 -->
				<%-- <c:if test="${member.me_grade == '최고관리자' }"> --%>
				<%-- <c:if test="${member != null }">
					<div>
						<form method="post" action="/reply/write">
							<input type="hidden" name="board_no" value="${read.board_no}">
													<input type="hidden" name="page" name="page" value="${scri.page}">
						<input type="hidden" name="perPageNum" name="perPageNum" value="${scri.perPageNum }">
						<input type="hidden" name="searchType" name="searchType" value="${scri.searchType }">
						<input type="hidden" name="keyword" name="keyword" value="${scri.keyword}">+

							<input type="hidden" id="reply_no" name="reply_no" value="${replyList.board_no}">
							<p>
								<label>댓글 작성자:</label> <input type="text" name="reply_writer"
									value="${member.me_name}" readonly>
							</p>
							<p>
								댓글 내용:
								<textarea class="form-control" rows="3" cols="155"
									placeholder="댓글을 남겨주세요." name="reply_content"></textarea>
							</p>

							<p>

								<button type="submit" class="btn btn-success"
									style="margin: 55px 0 0 10px;">댓글 작성</button>
							</p>
						</form>
					</div>
				</c:if> --%>

				<!-- 댓글 수정 -->
				<!-- 댓글 수정 -->

				<!-- 댓글 작성 끝 -->
				<%-- <div class="my-3 p-3 bg-white rounded shadow-sm">
					<c:choose>
						<c:when test="${nextBoardList.board_no != null}">

							<button type="button" class="btn btn-warning mr-3 mb-3"
								onclick="location.href='/board/read?board_no=${nextBoardList.board_no}'">
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글
							</button>
							<a href="/board/read?board_no=${nextBoardList.board_no}"
								style="color: black"> ${nextBoardList.board_title} </a>
						</c:when>

						<c:when test="${nextBoardList.board_no == null}">
							<button type="button" class="btn btn-warning mr-3 mb-3" disabled>다음글이
								없습니다</button>
						</c:when>
					</c:choose>
					<br />
					<c:choose>
						<c:when test="${lastBoardList.board_no != null}">
							<button type="button" class="btn btn-info mr-3 "
								onclick="location.href='/board/read?board_no=${lastBoardList.board_no}'">
								<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>이전글
							</button>
							<a href="/board/read?board_no=${lastBoardList.board_no}"
								style="color: black"> ${lastBoardList.board_title} </a>
						</c:when>

						<c:when test="${lastBoardList.board_no == null}">
							<button type="button" class="btn btn-info mr-3" disabled>이전글이
								없습니다</button>
						</c:when>
					</c:choose>

				</div> --%>
			</div>
		</div>
	</div>
</div>



<%@include file="../include/footer.jsp"%>