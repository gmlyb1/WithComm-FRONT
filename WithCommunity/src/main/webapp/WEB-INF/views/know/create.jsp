<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
	
	function readURL(input) {
		var file = input.files[0]
		console.log(file);
		
		if(file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function (e) {
				console.log(e.target);
				console.log(e.target.result);
				$('#preview').attr('src',e.target.result);
			}
		}
	}
	
	function _onSubmit() {
	
			if ($("#know_writer").val() == "") {
				swal.fire("작성자를 입력해주세요");
				$("#know_writer").focus();
				return false;
			}
				
			if ($("#know_title").val() == "") {
				swal.fire("제목을 입력해주세요");
				$("#know_title").focus();
				return false;
			}
	
			if ($("#know_content").val() == "") {
				swal.fire("내용을 입력해주세요");
				$("#know_content").focus();
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

<br><br><br>
<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
  <strong>	
	<ol class="breadcrumb breadcrumb-style2 mb-0">
      <li class="breadcrumb-item">
        <a href="javascript:void(0);">게시판</a>
      </li>
      <li class="breadcrumb-item">
        <a href="javascript:void(0);">자유게시판</a>
      </li>
      <li class="breadcrumb-item">
        <a href="javascript:void(0);">글 쓰기</a>
      </li>
    </ol>
  </strong>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form action="/know/create" method="post" name="write" id="write" enctype="multipart/form-data" onsubmit="return _onSubmit();">
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
										id="know_writer" name="know_writer" class="form-control"
										style="width: 200px" value="${member.me_name}" readonly /></td>
								</tr>
								<tr>
									<th class="active">제목</th><br>
									<td class="form-inline">
										<input type="text" id="know_title" placeholder="제목을 입력해주세요." name="know_title" class="form-control" style="width: 840px" />
									</td>
								</tr>

								<tr>
									<th class="active">내용</th><br>
									<td class="form-inline">
									<textarea id="know_content" name="know_content" cols="100" rows="10" placeholder="내용을 입력해주세요." class="form-control"></textarea></td>
								</tr>
								<tr>
									<label>이미지 파일 첨부</label> 
						            <input type="file" name="imgFile" onchange="readURL(this);"/>
									<img id="preview" src="#" width=200 height=150 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
								</tr>
							</tbody>
						</table>
					</div>
					<div style="margin-left: auto; margin-right: auto; width: fit-content;">
						<button type="submit" class="btn btn-primary">등록</button>
						<a href="/know/list" class="btn btn-danger">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>