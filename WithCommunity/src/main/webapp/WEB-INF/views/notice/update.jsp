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
							</tbody>
						</table>
					</div>
					<!-- 첨부파일 -->
					<td id="fileIndex"><c:forEach var="file" items="${file}"
							varStatus="var">
							<div>
								<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}"
									value="${file.FILE_NO }"> <input type="hidden"
									id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
								<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
								<button id="fileDel"
									onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');"
									type="button">삭제</button>
								<br>
							</div>
						</c:forEach></td>
					</tr>

					</tbody>
					</table>
			</div>
			<div style="margin-left: 1px;">
				<!-- <button type="button" id="update_btn" class="btn btn-primary">수정</button>
				<button type="button" id="cancel_btn" class="btn btn-primary">취소</button>
				<button type="button" id="fileAdd_btn" class="btn btn-primary">파일추가</button> -->

				<!-- 첨부파일 -->


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