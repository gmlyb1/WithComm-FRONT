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

		if (!confirm("등록하시겠습니까?")) {
			return false;
		}
	}
</script>


    <script>
        $(document).ready(function () {

            $('#myEditor').summernote({
                lang: 'ko-KR',
                height: 300,
                placeholder: '내용을 입력하세요',
                toolbar: [
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                    ['color', ['forecolor', 'color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert', ['picture', 'link', 'video']],
                    ['view', ['fullscreen', 'help']]
                  ],
                  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체',
                    '굴림', '돋음체', '바탕체'],
                  fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36',
                    '50', '72']
               
                
            });


        });
    </script>
<script type="text/javascript">
	function fn_addFile(){
		var fileIndex = 1;
		$(".fileAdd_btn").on("click",function(){
			$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>")
		});
		
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
		});
	}
</script>


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
								
								<tr>
									<td id="fileIndex">
									<input type="file" name="file" />
								<div>  
			 						<button id="fileAdd_btn" class="btn btn-primary" type="button">파일추가+</button>
								</div>
									</td>
								</tr>

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