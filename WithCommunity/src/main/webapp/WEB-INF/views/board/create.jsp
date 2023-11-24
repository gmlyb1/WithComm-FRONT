<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
	
	
	
	
	function _onSubmit() {
	
			if ($("#board_writer").val() == "") {
				alert("작성자를 입력해주세요");
				$("#board_writer").focus();
				return false;
			}
	
			if ($("#board_title").val() == "") {
				alert("제목을 입력해주세요");
				$("#board_title").focus();
				return false;
			}
	
			if ($("#board_content").val() == "") {
				alert("내용을 입력해주세요");
				$("#board_content").focus();
				return false;
			}
			
			if($("#board_bgno").val() == "") {
				alert("카테고리를 선택해 주세요.");
				$("#board_bgno").focus();
				return false;
			}
	
			if (!confirm("등록하시겠습니까?")) {
				return false;
			}
			
			//pageNum 및 amount default 값을 폼 데이터에 추가
			$('#write').append('<input type="hidden" name="pageNum" value="1" />');
			$('#write').append('<input type="hidden" name="amount" value="10" />');
			
			return true;
		}
</script>
<style type="text/css">
    /* 선택 상자의 폭과 높이 조정 */
  select.form-select {
    width: 100px; /* 원하는 폭으로 조정 */
  }

  /* 선택 상자 내부 텍스트 크기 조정 */
  select.form-select option {
    font-size: 14px; /* 원하는 텍스트 크기로 조정 */
  }
</style>

<%@include file="../include/header.jsp"%>

<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
		<h1 class="page-header">글작성</h1>
	</div>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form action="/board/create" method="post" name="write" id="write"
					onsubmit="return _onSubmit();">
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
									<td class="form-inline"><input type="text"
										id="board_writer" name="board_writer" class="form-control"
										style="width: 200px" value="${member.me_name}" readonly /></td>
								</tr>
								<tr>
									<th class="active">글 카테고리</th>
										<td class="form-inline">
											<select class="form-select" id="board_bgno" name="board_bgno">
												<option value="">전체</option>
												<option value="1">커뮤니티</option>
												<option value="2">공유합시다</option>
											</select>
										</td>
								</tr>
								<tr>
									<th class="active">제목</th>
									<td class="form-inline"><input type="text"
										id="board_title" placeholder="제목을 입력해주세요." name="board_title"
										class="form-control" style="width: 840px" /></td>
								</tr>

								<tr>
									<th class="active">내용</th>
									<td class="form-inline">
									<textarea id="board_content" name="board_content" cols="100" rows="10" placeholder="내용을 입력해주세요." class="form-control"></textarea></td>
								</tr>
								
								<!-- <tr>
									<td id="fileIndex">
									<input type="file" name="file" />
								<div>  
			 						<button id="fileAdd_btn" class="btn btn-primary" type="button">파일추가+</button>
								</div>
									</td>
								</tr> -->

							</tbody>
						</table>
					</div>
					<div style="margin-left: 1px;">
						<button type="submit" class="btn btn-primary">등록</button>
						<a href="/board/list" class="btn btn-danger">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>