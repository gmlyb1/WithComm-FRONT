<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
function YnCheck(obj) {
	var checked = obj.checked;
	if(checked) {
		obj.value = 1;
	}else {
		obj.value = 2;
	}
	
	var isfixed = "${data.isFixed}";
	if(isFixed == 1) {
		${"#isFixed"}.prop("checked",true);
	}else {
		$("#isFixed").prop("checked",false);
	}
	
	// 체크박스 value값 설정
	if($("#isFixed").is(':checked')==true) {
		data.set("isFixed",1);
	}else {
		data.set("isFixed",0);
	}
};
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "/board/list";
		})
	})

	function _onSubmit() {
		if (!confirm("수정 하시겠습니까?")) {
			return false;
		}
	}
</script>
<script type="text/javascript">
$("#isFixed").click(function () {
	  let chekObj = document.getElementsByClassName("isFixed");
	  let lenth = chekObj.length;
	  let checked = 0;
	  let isFixed;

	  for (i = 0; i < lenth; i++) {
	    if (chekObj[i].checked === true) {
	      checked += 1;
	      isFixed = chekObj[i].getAttribute("id");
	      console.log(isFixed);
	    }
	  }

	  if (checked >= 2){
	    alert("체크 해제 후 한 가지만 선택해 주세요");
	    return false;
	  }
	});
</script>
<script type="text/javascript">
	function fn_addFile() {
		var fileIndex = 1;
		$("#fileAdd_btn")
				.on(
						"click",
						function() {
							$("#fileIndex")
									.append(
											"<div><input type='file' style='float:left;' name='file_"
													+ (fileIndex++)
													+ "'>"
													+ "</button>"
													+ "<button type='button' style='float:right;' id='fileDelBtn'>"
													+ "삭제" + "</button></div>");
						});
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();

		});
	}
	var fileNoArry = new Array();
	var fileNameArry = new Array();
	function fn_del(value, name) {

		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
	}
</script>


<%@include file="../include/header.jsp"%>

<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
		<h1 class="page-header">글수정</h1>
	</div>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form action="/notice/update" role="form" method="post"
					name="updateForm" onsubmit="return _onSubmit();">
					<input type="hidden" name="notice_no" value="${update.notice_no}"
						readonly="readonly" /> <input type="hidden" id="fileNoDel"
						name="fileNoDel[]" value=""> <input type="hidden"
						id="fileNameDel" name="fileNameDel[]" value="">
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
									<td class="form-inline"><label for="notice_writer">작성자:</label><input
										type="text" id="notice_writer" name="notice_writer"
										style="width: 200px" value="${update.notice_writer}" disabled />
									</td>
								</tr>
								<tr>
									<td class="form-inline"><label for="notice_title">제목:</label><input
										type="text" id="notice_title" name="notice_title"
										style="width: 840px" value="${update.notice_title}" /></td>
								</tr>
								<tr>
									<td class="form-inline"><label for="notice_content">내용:</label>
										<textarea id="notice_content" name="notice_content" cols="130"
											rows="20"><c:out value="${update.notice_content}" /></textarea>
								</tr>
								<tr>
									<td>
									<input type="checkbox" id="isFixed" name="isFixed" onchange="YnCheck(this);" <%-- value='${FixedUpdate.isFixed} --%>>
									
										 <label for="isFixed">상단 고정</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>


					<div style="margin-left: 1px;">
						<button type="submit" class="btn btn-primary">수정</button>
						<a href="/notice/list" class="btn btn-danger">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>