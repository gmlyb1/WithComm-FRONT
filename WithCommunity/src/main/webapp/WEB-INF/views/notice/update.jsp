<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
var isFixed = ${update.isFixed};

function YnCheck(cb) {
	if (cb.checked) {
	    document.updateForm.isFixed.checked = true;
	  } else {
	    document.updateForm.isFixed.checked = false;
	  }
}

// 페이지 로드 후, 체크박스의 체크 여부에 따라 isFixed 변수와 isFixed 필드를 초기화합니다.
window.onload = function() {
    var checkbox = document.getElementById('isFixed');
    checkbox.checked = isFixed;
    document.updateForm.isFixed.value = isFixed ? true : false;
};
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
	    swal.fire("체크 해제 후 한 가지만 선택해 주세요");
	    return false;
	  }
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
        <a href="javascript:void(0);">글 수정</a>
      </li>
    </ol>
  </strong>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form action="/notice/update" role="form" method="post" id="updateForm"
					name="updateForm" onsubmit="return _onSubmit();">
					<input type="hidden" name="notice_no" value="${update.notice_no}" readonly="readonly" /> 
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> <input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
					<div class="table-responsive" style="text-align: center;">
						<table id="datatable-scroller" class="table table-bordered tbl_Form">
							<caption></caption>
							<colgroup>
								<col width="250px" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<td class="form-inline"><label for="notice_writer">작성자:</label><br>
									<input type="text" id="notice_writer" name="notice_writer" class="form-control" style="width: 200px" value="${update.notice_writer}" disabled />
									</td>
								</tr>
								<tr>
									<td class="form-inline"><label for="notice_title">제목:</label><br>
									<input type="text" id="notice_title" name="notice_title" class="form-control" style="width: 840px" value="${update.notice_title}" /></td>
								</tr>
								<tr>
									<td class="form-inline"><label for="notice_content">내용:</label><br>
									<textarea id="notice_content" name="notice_content" cols="100" class="form-control"
										rows="10"><c:out value="${update.notice_content}" /></textarea>
								</tr>
								<tr>
									<td>
										  <input type="checkbox" class="form-check-input" id="isFixed" name="isFixed" onchange="YnCheck(this);">
										  <label class="form-check-label" for="isFixed">상단 고정</label>
								    </td>
								</tr>
							</tbody>
						</table>
					</div>
							<div style="margin-left: auto; margin-right: auto; width: fit-content;">
						<button type="submit" class="btn btn-primary">수정</button>
						<a href="/notice/list" class="btn btn-danger">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>