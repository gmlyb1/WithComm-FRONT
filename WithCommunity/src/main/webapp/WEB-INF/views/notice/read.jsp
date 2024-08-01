<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']")

		//삭제
		$("#delete_btn").on("click", function() {
			if(confirm("정말 삭제하시겠습니까?")){
			formObj.attr("action", "/notice/delete");
			formObj.attr("method", "post");
			formObj.submit();
			}
		});
		
		
		// 댓글 작성
		var formObj = $("form[name='replyForm']")
		$(".replyWriteBtn").on("click", function() {
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/notice/WriteReply");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
	});
	
	//jquery 끝 
	// 댓글 삭제 로직
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
					<input type="hidden" id="notice_no" name="notice_no" value="${read.notice_no}" />
					<%-- <input type="hidden" id="reply_no" name="reply_no" value="${replyList.board_no}"> --%>
					<div class="container-fluid">
					    <div class="row">
					        <div class="col-lg-12">
					            <div class="card shadow-sm">
					                <div class="card-body">
					                    <h5 class="card-title text-center mb-4">게시판 글 보기</h5>
					                    <table class="table table-borderless">
					                        <tbody>
					                            <tr>
					                                <td style="width: 20%"><strong>글 제목</strong></td>
					                                <td>${read.notice_title}</td>
					                            </tr>
					                            <tr>
					                                <td><strong>작성자</strong></td>
					                                <td>${read.notice_writer}</td>
					                            </tr>
					                            <tr>
					                                <td><strong>작성일자</strong></td>
					                                <td>${read.notice_regdate}</td>
					                            </tr>
					                            <tr>
					                                <td><strong>내용</strong></td>
					                                <td style="text-align: left;">${read.notice_content}</td>
					                            </tr>
					                        </tbody>
					                    </table>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>

					<br>
					<!-- 게시판 글보기  -->
					<div style="margin-left: 1px;">
						<c:if test="${member.me_name == read.notice_writer}">
							<button type="button" class="btn btn-success" onclick="location.href='/notice/update?notice_no=${read.notice_no}';">수정</button>
							<button type="submit" class="btn btn-danger" id="delete_btn">삭제</button>
						</c:if>
						<button type="button" onclick="location.href='/notice/list';" class="btn btn-primary">목록</button>
						<br>
						<hr>
					</div>
				</form>
				<!-- 게시판 끝 -->
				
				
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