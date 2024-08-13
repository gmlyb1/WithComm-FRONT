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
		//소켓
		var socket = new WebSocket( 'ws://localhost:8090/alarm');
		//console.log("socket:"+socket);
		
		var msg = "${msg}"
			if (msg != "") {
				alert(msg);
		}
		
		var formObj = $("form[name='readForm']")

		//삭제
		$("#delete_btn").on("click", function() {
			
			if(confirm("게시물을 삭제하시겠습니까?")){
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});
		
		var formObj = $("form[name='replyForm']")
		$(".replyWriteBtn").on("click", function() {
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/board/WriteReply");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		//댓글수정창 닫기
		$('#replyModal').on('click',function() {
			
			$('#editModal').modal('hide');
		});

		$('#replyEditCancel').on('click',function() {
			$('#editModal').modal('hide');
		});
		
		
		$('#submitModifyReply').on('click', function() {
		    var reply_content = $('#reply_content').val();
		    var reply_no = $('#editReplyNo').val();
		    var board_no = $('#board_no').val();
		    
		    // Make an AJAX request to update the comment on the server
		    $.ajax({
		        type: 'POST',
		        url: '/reply/modify',
		        data: {
		        	board_no : board_no,
		            reply_no: reply_no, // Correct the variable name
		            reply_content: reply_content // Correct the variable name
		        },
		        success: function(response) {
		        	//console.log(response);
		        	console.log("reply_content:" + reply_content);
		            alert('댓글 수정에 성공하였습니다.');
		            $('#editModal').modal('hide');
		            location.reload();
		        },
		        error: function(xhr, textStatus, errorThrown) {
		            alert('실패: ' + xhr.status + ' ' + errorThrown);
		        }
		        
		    });
		  
		});
		//끝
	});
	
	
	
	function remove_replyNo(data1, data2) {
		if (!confirm("삭제 하시겠습니까?"))
			return false;
		else {
			location.href = "/reply/delete?reply_no=" + data1 + "&board_no="
					+ data2;
		}
	}
	
	// 댓글 수정 모달
	function openEditModal(replyNo, content) {
		$('#editReplyNo').val(replyNo);
		$('#reply_content').val(content);
		$('#editModal').modal('show');
	}
	
	let form = $("#infoForm");
	
	$("#list_btn").on("click",function(e) {
		form.find("#board_no").remove();
		form.attr("action","/board/list");
		form.submit();
	});
	
	$("#modify_btn").on("click",function(e) {
		form.attr("action", "/board/update");
		form.submit();
	});
</script>
<style type="text/css">
 .comment-form {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }
    .comment-form label {
        flex-shrink: 0;
        margin-right: 10px;
    }
    .comment-form input[type="text"] {
        flex-grow: 1;
        padding: 5px 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    
    .page-header {
    	font-family: 'Noto Sans KR', sans-serif; /* 한글을 위한 웹 폰트 */
            font-size: 36px; /* 폰트 크기 조절 */
            color: #ffffff; /* 텍스트 색상 */
            background: linear-gradient(to right, #7367F0, #CE9FFC); /* Sneat 테마 그라디언트 배경 */
            padding: 20px; /* 텍스트 주위의 여백 */
            border-radius: 10px; /* 둥근 모서리 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
            text-align: center; /* 텍스트 가운데 정렬 */
            margin-bottom: 20px; /* 아래쪽 여백 */
    }
</style>

<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<c:if test="${member == null}">
		<span style="color: red" class="text-center"><strong>
				현재 페이지의 글쓰기,수정,삭제는 회원만 이용 가능합니다.</strong></span>
	</c:if>
	<div class="col-lg-12"><br>
		<h1 class="page-header text-left">상세 페이지</h1>
	</div>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form role="form" method="post" name="readForm">
					<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
					<input type="hidden" id="board_no" name="board_no" value="${read.board_no}" />
					<%-- <input type="hidden" id="reply_no" name="reply_no" value="${replyList.board_no}"> --%>
					<!-- 게시판 글보기  -->
					<div class="container-fluid">
					    <div class="row">
					        <div class="col-lg-12">
					            <div class="card shadow-sm">
					                <div class="card-body">
					                    <h5 class="card-title">게시판 글 보기</h5>
					                    <hr>
					                    <div class="mb-3">
					                        <strong>글 제목:</strong>
					                        <p>${read.board_title}</p>
					                    </div>
					                    <div class="mb-3">
					                        <strong>작성자:</strong>
					                        <p>${read.board_writer}</p>
					                    </div>
					                    <div class="mb-3">
					                        <strong>작성일자:</strong>
					                        <p>${read.board_regdate}</p>
					                    </div>
					                    <div class="mb-3">
					                        <strong>내용:</strong>
					                        <p>${read.board_content}</p>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					<br>
					
					<!-- 게시판 글보기  -->
	&nbsp;&nbsp;&nbsp;<div style="margin-left: 1px;">
						<c:if test="${member.state == '최고관리자' || member.me_name == read.board_writer}">
							&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-success" onclick="location.href='/board/update?board_no=${read.board_no}';">수정</button>
							&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-danger" id="delete_btn">삭제</button>
						</c:if>
						<button onclick="location.href='/board/list'" type="button" id="list_btn" class="btn btn-primary">목록</button>
						<br>
						<hr>
					</div>
				</form>
				<!-- 게시판 끝 -->

				<!-- 댓글 시작 -->
				<div class="mb-3" style="height: 270px; OVERFLOW-Y: auto;">
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
										<td style="width: 60%; height: 50px;">
											<pre style="font-family: arial;">${replyList.reply_content}</pre>
												<p>
													<c:if test="${member.state == '최고관리자'  || member.me_name == replyList.reply_writer}">
														<!-- <a class="btn btn-primary" href="#">댓글 수정</a> -->
														<a class="btn btn-primary" href="javascript:void(0);" onclick="openEditModal(${replyList.reply_no}, '${replyList.reply_content}')">수정</a>
														<a class="btn btn-danger" href="javascript:remove_replyNo(${replyList.reply_no},${replyList.board_no});">삭제</a>
													</c:if>
												</p></td>
										<td style="width: 35%; text-align: right;">
											<fmt:formatDate value="${replyList.reply_regdate}" pattern="yy-MM-dd hh:mm:ss" />
										</td>
										<td style="width: 5%;">&nbsp;</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<!-- 댓글 끝 -->

				<!-- 댓글 작성 시작 -->
				<div>
					<form method="post" action="/reply/write">
						<input type="hidden" name="board_no" value="${read.board_no}">
						<input type="hidden" name="reply_no" value="${read.reply_no}">
					<div class="comment-form">
						<p>
							<label>댓글 작성자:</label> 
							<input type="text" name="reply_writer" value="${member.me_name}" readonly>
						</p>
					</div>
						<p>
							댓글 내용: <textarea class="form-control" rows="3" cols="155" placeholder="댓글을 남겨주세요." name="reply_content"></textarea>
						</p>
						<p>
							<button type="submit" class="btn btn-success" style="margin: 55px 0 0 10px;">댓글 작성</button>
						</p>
					</form>
				</div>

				<!-- 댓글 작성 끝 -->
				<div class="my-3 p-3 bg-white rounded shadow-sm">
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

				</div>
			</div>
		</div>
	</div>
</div>

<!-- 댓글 수정 모달 팝업 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="replyEditCancel">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editForm">
                    <input type="hidden" name="reply_no" id="editReplyNo">
                    <div class="form-group">
                        <label for="reply_content">댓글 내용:</label>
                        <textarea class="form-control" id="reply_content" name="reply_content"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="replyModal">취소</button>
		        <button type="button" class="btn btn-primary" id="submitModifyReply">수정하기</button>
	   		</div>
        </div>
    </div>
</div>


<%@include file="../include/footer.jsp"%>