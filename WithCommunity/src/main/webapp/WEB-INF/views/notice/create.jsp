<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#cancelBtn").on("click",function(){
		if(!confirm("글쓰기를 취소하고 목록 페이지로 돌아 가시겠습니까?")) {
			location.href = "/notice/list"
		};
	});
	
	function _onSubmit() {

		if ($("#notice_writer").val() == "") {
			alert("작성자를 입력해주세요");
			$("#notice_writer").focus();
			return false;
		}

		if ($("#notice_title").val() == "") {
			alert("제목을 입력해주세요");
			$("#notice_title").focus();
			return false;
		}

		if ($("#notice_content").val() == "") {
			alert("내용을 입력해주세요");
			$("#notice_content").focus();
			return false;
		}

		if (!confirm("등록하시겠습니까?")) {
			return false;
		}
	}
	
	function YnCheck(obj) {
		var checked = obj.checked;
		if(checked) {
			obj.value = 1;
		}else {
			obj.value = 2;
		}
		
		var isFixed = "${data.isFixed}";
		if(isFixed == 1) {
		    $("#isFixed").prop("checked", true);
		} else {
		    $("#isFixed").prop("checked", false);
		}
		
		// 체크박스 value값 설정
		if($("#isFixed").is(':checked')==true) {
			data.set("isFixed",1);
		}else {
			data.set("isFixed",0);
		}
	};
//끝
});
</script>

<%@include file="../include/header.jsp"%>
<br><br><br>
<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
  <strong>
	<ol class="breadcrumb breadcrumb-style2 mb-0">
      <li class="breadcrumb-item">
        <a href="javascript:void(0);">게시판</a>
      </li>
      <li class="breadcrumb-item">
        <a href="javascript:void(0);">공지사항</a>
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
				<form action="/notice/create" method="post" name="write" id="write" enctype="multipart/form-data" onsubmit="return _onSubmit();">
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
									<th class="active">작성자</th><br>
									<td class="form-inline">
									<input type="text" id="notice_writer" name="notice_writer" class="form-control" style="width: 200px" value="${member.me_name}" readonly />
									</td>
								</tr>
								<tr>
									<th class="active">제목</th><br>
									<td class="form-inline">
										<input type="text" id="notice_title" name="notice_title" placeholder="제목을 입력해주세요." class="form-control" style="width: 840px" />
									</td>
								</tr>

								<tr>
									<th class="active">내용</th><br>
									<td class="form-inline">
										<textarea id="notice_content" name="notice_content" cols="100" rows="10" placeholder="내용을 입력해주세요." class="form-control"></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<input type="file" name="file" class="form-control">
									</td>
								</tr>
								<tr>
									 <td>
										<input type="checkbox" class="form-check-input" id="isFixed" name="isFixed" onchange="YnCheck(this);"><label for="isFixed" >&nbsp;&nbsp;상단 고정</label>								
									</td> 
								</tr>
							</tbody>
						</table>
					</div>
							<div style="margin-left: auto; margin-right: auto; width: fit-content;">
						<button type="submit" class="btn btn-primary" onsubmit="_onSubmit();">등록</button>
						<a id="cancelBtn" href="/notice/list" class="btn btn-danger">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>