<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Summernote CSS & JS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "/board/list";
		});
		
		
		
	});
	
	$('#summernote').summernote({
	    	placeholder: 'content',
        minHeight: 370,
        maxHeight: null,
        focus: true, 
        lang : 'ko-KR'
  	});

	function _onSubmit() {
		if ($("#board_writer").val().trim() == "") {
			Swal.fire("작성자를 입력해주세요");
			$("#board_writer").focus();
			return false;
		}
			
		if ($("#board_title").val().trim() == "") {
			Swal.fire("제목을 입력해주세요");
			$("#board_title").focus();
			return false;
		}

		if ($("#board_content").val().trim() == "") {
			Swal.fire("내용을 입력해주세요");
			$("#board_content").focus();
			return false;
		}
		
		if($("#board_bgno").val().trim() == "") {
			Swal.fire("카테고리를 선택해 주세요.");
			$("#board_bgno").focus();
			return false;
		}
		
		if (!confirm("수정 하시겠습니까?")) {
			return false;
		}
		
		//pageNum 및 amount default 값을 폼 데이터에 추가
		$('#write').append('<input type="hidden" name="pageNum" value="1" />');
		$('#write').append('<input type="hidden" name="amount" value="10" />');
		
		return true;
	}
</script>
<script type="text/javascript">
$(".cancel_btn").on("click",function() {
	event.preventDefault();
	location.href="/board/read?board_no=${update.board_no}"
	+ "&page=${scri.page}"
	+ "&perPageNum=${scri.perPageNum}"
	+ "&searchTpe=${scri.searchType}"
	+ "&keyword=${scri.keyword}"
})


</script>
<script type="text/javascript">
//수정 
$("#update_btn").on("click", function(){
	formObj.attr("action", "/board/updateView");
	formObj.attr("method", "get");
	formObj.submit();
	

	location.href = "/board/updateView?bno=${read.bno}"
		+"&page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
});
</script>

<%@include file="../include/header.jsp"%>
<br><br><br>
<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
  <strong>
	<div class="col-lg-12">
		<ol class="breadcrumb breadcrumb-style2 mb-0">
	      <li class="breadcrumb-item">
	        <a href="javascript:void(0);">게시판</a>
	      </li>
	      <li class="breadcrumb-item">
	        <a href="javascript:void(0);">자유게시판</a>
	      </li>
	      <li class="breadcrumb-item">
	        <a href="javascript:void(0);">글 수정</a>
	      </li>
	    </ol>
	</div>
  </strong>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form action="/board/update" role="form" method="post"
					name="updateForm" onsubmit="return _onSubmit();">
					<input type="hidden" name="board_no" value="${update.board_no}" readonly="readonly" /> 
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
					<div class="table-responsive" style="text-align: center;">
						<table id="datatable-scroller"
							class="table table-bordered tbl_Form">
							<caption></caption>
							<colgroup>
								<col width="250px" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th class="active">작성자</th>
									<td class="form-inline">
										<input type="text" id="board_writer" name="board_writer" class="form-control" style="width: 200px" value="${update.board_writer}" readonly />
									</td>
								</tr>
								<tr>
									<th class="active">글 카테고리</th>
										<td class="form-inline">
											<select class="form-select" id="board_bgno" name="board_bgno">
												<option value="1" ${update.board_bgno == '1' ? 'selected' : ''}>커뮤니티</option>
												<option value="2" ${update.board_bgno == '2' ? 'selected' : ''}>공유합시다</option>
											</select>
										</td>
								</tr>
								<tr>
									<th class="active">제목</th>
									<td class="form-inline">
										<input type="text" id="board_title" placeholder="제목을 입력해주세요." name="board_title" class="form-control" style="width: 840px" value="${update.board_title}"/>
									</td>
									<br>
								</tr>
								<tr>
									<th class="active">내용</th>
									<td class="form-inline">
										<textarea id="summernote" name="board_content" cols="100" rows="10" placeholder="내용을 입력해주세요." class="form-control">
											<c:out value="${update.board_content}" />
										</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				<div style="margin-left: auto; margin-right: auto; width: fit-content;">
					<button type="submit" class="btn btn-primary">수정</button>
					<a href="/board/list" class="btn btn-danger" id="cancel_btn">취소</a>
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>