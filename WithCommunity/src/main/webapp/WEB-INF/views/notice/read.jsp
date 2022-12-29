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
			formObj.attr("action", "/notice/delete");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='replyForm']")
		$(".replyWriteBtn").on("click", function() {
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/notice/WriteReply");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
</script>
<script type="text/javascript">
	function fn_fileDown(fileNo){
		var formObj = $("form[name='readForm']");
		$("#FILE_NO").attr("value",fileNo);
		formObj.attr("action","/notice/fileDown");
		formObj.submit();
	}

</script>
<script type="text/javascript">
	function remove_replyNo(data1,data2) {
		if(!confirm("삭제 하시겠습니까?")) return false;
		else {
			location.href="/reply/delete?reply_no="+data1+"&notice_no="+data2;
		}
	}
</script>



<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<c:if test="${member == null}">
		<span style="color: red" class="text-center"><strong>
				현재 페이지의 글쓰기,수정,삭제는 회원만 이용 가능합니다.</strong></span>
	</c:if>

	<%-- <c:if test="${member != null}">
		<span style="color: blue" class="text-center"><strong>
				댓글작성은 관리자만 가능합니다.</strong></span>
	</c:if> --%>
	<div class="col-lg-12">
		<h1 class="page-header text-center">상세 페이지</h1>
		<c:if test="${member != null}">
			<span style="color: blue" class="text-center"><strong>
					댓글작성은 관리자만 가능합니다.</strong></span>
		</c:if>
	</div>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form role="form" method="post" name="readForm">
				<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
					<input type="hidden" id="notice_no" name="notice_no"
						value="${read.notice_no}" />
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
										<td colspan="2">${read.notice_title}</td>
									</tr>
									<tr>
										<td>작성자</td>
										<td colspan="2">${read.notice_writer}</td>
									</tr>
									<tr>
										<td>작성일자</td>
										<td colspan="2">${read.notice_regdate}</td>
									</tr>
									<tr>
										<td>내용</td>
										<td colspan="2" style="height: 200px; text-align: left;">${read.notice_content}</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<!-- 게시판 글보기  -->
					<div style="margin-left: 1px;">
						<c:if test="${member.me_name == read.notice_writer}">
							<button type="button" class="btn btn-success"
								onclick="location.href='/notice/update?notice_no=${read.notice_no}';">수정</button>
							<button type="submit" class="btn btn-danger" id="delete_btn">삭제</button>
						</c:if>
						<button type="button" onclick="location.href='/notice/list';"
							class="btn btn-primary">목록</button>
						<br>
						<hr>
					</div>
				</form>
				<!-- 게시판 끝 -->
				
				<!-- 첨부파일 -->
				<span>파일 목록</span>
					<div class="form-group" style="border: 1px solid #dbdbdb;">
						<c:forEach var="file" items="${file}">
							<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
						</c:forEach>
					</div>
				
				<!-- 댓글 작성 끝 -->
				<div class="my-3 p-3 bg-white rounded shadow-sm">
					<c:choose>
						<c:when test="${nextNoticeList.notice_no != null}">

							<button type="button" class="btn btn-warning mr-3 mb-3"
								onclick="location.href='/notice/read?notice_no=${nextNoticeList.notice_no}'">
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글
							</button>
							<a href="/notice/read?notice_no=${nextNoticeList.notice_no}" style="color: black">
								${nextNoticeList.notice_title} </a>
						</c:when>

						<c:when test="${nextNoticeList.notice_no == null}">
							<button type="button" class="btn btn-warning mr-3 mb-3" disabled>다음글이
								없습니다</button>
						</c:when>
					</c:choose>
					<br />
					<c:choose>
						<c:when test="${lastNoticeList.notice_no != null}">
							<button type="button" class="btn btn-info mr-3 "
								onclick="location.href='/notice/read?notice_no=${lastNoticeList.notice_no}'">
								<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>이전글
							</button>
							<a href="/notice/read?notice_no=${lastNoticeList.notice_no}" style="color: black">
								${lastNoticeList.notice_title} </a>
						</c:when>

						<c:when test="${lastNoticeList.notice_no == null}">
							<button type="button" class="btn btn-info mr-3" disabled>이전글이
								없습니다</button>
						</c:when>
					</c:choose>

				</div>
			</div>
		</div>
	</div>
</div>



<%@include file="../include/footer.jsp"%>