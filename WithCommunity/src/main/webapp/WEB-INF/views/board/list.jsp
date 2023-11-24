<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
		
		// new 스티커 처리
		var currentTime = new Date().getTime();
		
		$("table tr").each(function() {
			var regdate = new Date($(this).data("regdate")).getTime();
			var isNewPost = (currentTime - regdate < 24 * 60 * 60 * 1000);
			
			if(isNewPost) {
				$(this).find("td:eq(1)").append('<span class="badge badge-success">New</span>');
				
				setTimeout(function() {
					$sticker.find(".badge").remove();
				},24 * 60 * 60 * 1000);
			}
		});
		//끝
	});
	
	var moveForm = $("form[name='moveForm']");

	$(".pageInfo a").on("click", function(e) {

		e.preventDefault();
		
		var pageNum;
		var amount = ${pageMaker.cri.amount};
		var startPage = ${pageMaker.startPage};
		
		if(startPage <= 0) {
			pageNum = 1;
		}else {
			pageNum = $(this).attr("href");
		}
		
		moveForm.append("<input type='hidden' name='board_no' value='"+ $(this).attr("href")+ "'>");
		moveForm.attr("action","/board/list");
		moveForm.submit();

	});
</script>
<style type="text/css">
    .pageInfo{
      list-style : none;
      display: inline-block;
    margin: 50px 0 0 100px;      
  }
  .pageInfo li{
      float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
 
 .active {
 background-color : #cdd5ec;
 }
    
    /* 선택 상자의 폭과 높이 조정 */
  select.form-select {
    width: 100px; /* 원하는 폭으로 조정 */
  }

  /* 선택 상자 내부 텍스트 크기 조정 */
  select.form-select option {
    font-size: 14px; /* 원하는 텍스트 크기로 조정 */
  }
</style>


<!-- Begin Page Content -->
<div class="container-fluid">
	<br>
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">자유 게시판</h1>
<!-- 	<p class="mb-4">
		<a><strong>저희 소프트홈페이지의 고객 게시판을 찾아 주셔서 감사합니다.</strong></a>
	</p> -->
	<br/>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><strong>고객 게시판 리스트</strong></h6>
			<br>
			<c:if test="${member == null}">
				<span style="color: red"><strong> 현재 페이지의 글쓰기,수정,삭제는
						회원만 이용 가능합니다.</strong></span>
			</c:if>

			<%-- <c:if test="${member != null }">
				<a href="/board/mypage" class="btn btn-success">마이페이지로 이동</a>
			</c:if> --%>
			<form>
				<input type="button" class="btn btn-warning" value="페이지 새로 고침"
					onClick="window.location.reload()">
			</form>
			
			<select class="form-select" id="bgno" name="bgno">
					<option value="">전체</option>
					<option value="1">커뮤니티</option>
					<option value="2">공유합시다</option>
			</select>
		</div>
		
			

		<div class="card-body">
			<div class="table-responsive">
				<form method="get" id="listForm" action="/board/list">
					<input type="hidden" id="board_no" name="board_no" value='<c:out value="${pageInfo.board_no}"/>'>
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th class="text-center">번호</th>
								<th class="text-center">카테고리</th>
								<th class="text-center">주제</th>
								<th class="text-center">작성자</th>
								<th class="text-center">조회수</th>
								<th class="text-center">작성일자</th>
								<th class="text-center">수정일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardList}" var="list">
								<tr data-regdate = "${list.board_regdate}">
									<td class="text-center"><c:out value="${list.rowNo}" /></td>
										<c:if test="${list.board_bgno == '0' && list.board_bgno == null}">
											<td class="text-center">-</td>
										</c:if>
										<c:if test="${list.board_bgno == '1'}">
											<td class="text-center">커뮤니티</td>
										</c:if>
										<c:if test="${list.board_bgno == '2'}">
											<td class="text-center">공유합시다</td>
										</c:if>
									<td><a href="/board/read?board_no=${list.board_no}">
											${list.board_title}[${list.reply_cnt}]</a></td>
									<td class="text-center"><c:out
											value="${list.board_writer}" /></td>
									<td class="text-center"><c:out value="${list.board_count}" /></td>
									<td class="text-center"><fmt:formatDate
											pattern="yyyy-MM-dd" value="${list.board_regdate}" /></td>
									<td class="text-center"><fmt:formatDate
											pattern="yyyy-MM-dd" value="${list.board_updateDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>

					<div class="pageInfo_wrap" >
				        <div class="pageInfo_area">
				 			<ul id="pageInfo" class="pageInfo">
				 			
				 				 <!-- 이전페이지 버튼 -->
				                <c:if test="${pageMaker.prev}">
				                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
				                </c:if>
				                
								 <!-- 각 번호 페이지 버튼 -->
				                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }">
								        <a href="/board/list?pageNum=${num}&amount=${pageMaker.cri.amount}">${num}</a>
								    </li>
								</c:forEach> 
				                
				                <!-- 다음페이지 버튼 -->
				                <c:if test="${pageMaker.next}">
				                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
				                </c:if>    
							</ul>				 			
				        </div>
				    </div>

					<c:if test="${member != null}">
						<button type="button" onclick="location.href='/board/create';"
							class="btn btn-success">글쓰기</button>
					</c:if>
				</form>
				<form id="moveForm" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->


<%@include file="../include/footer.jsp"%>
